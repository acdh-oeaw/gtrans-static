import glob
import os

import lxml.etree as ET
from acdh_tei_pyutils.tei import TeiReader
from acdh_tei_pyutils.utils import get_xmlid
from acdh_xml_pyutils.xml import NSMAP

files = sorted(glob.glob("./data/editions/*.xml"))

data = {}

for x in files:
    f_name = os.path.basename(x)
    doc = TeiReader(x)
    doc_title = doc.any_xpath(".//tei:title[@type='main']/text()")[0]
    doc_info = {"f_name": f_name, "doc_title": doc_title}
    for y in doc.any_xpath(".//tei:person[@xml:id]"):
        label = y.xpath("./tei:persName[@key]/@key", namespaces=NSMAP)[0]
        id = get_xmlid(y)
        try:
            data[id]["label"] = label
            data[id]["docs"].append(doc_info)
        except KeyError:
            data[id] = {"label": label, "docs": [doc_info]}


listperson = os.path.join("data", "indices", "listperson.xml")
doc = TeiReader(listperson)

for bad in doc.any_xpath(".//tei:noteGrp"):
    bad.getparent().remove(bad)
for x in doc.any_xpath(".//tei:person[@xml:id]"):
    ent_id = get_xmlid(x)
    match = data[ent_id]
    ngroup = ET.SubElement(x, "{http://www.tei-c.org/ns/1.0}noteGrp")
    ngroup.attrib["n"] = str(len(match["docs"]))
    for y in match["docs"]:
        note = ET.SubElement(
            ngroup, "{http://www.tei-c.org/ns/1.0}note", type="mentions"
        )
        note.attrib["target"] = y["f_name"]
        note.text = y["doc_title"]
ET.indent(doc.any_xpath(".")[0], space="   ")
doc.tree_to_file(listperson)


# with open("foo.json", "w", encoding="utf-8") as fp:
#     json.dump(data, fp, ensure_ascii=False, indent=4)
