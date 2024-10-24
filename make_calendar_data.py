import glob
import os
import json
from acdh_cidoc_pyutils import extract_begin_end
from acdh_tei_pyutils.tei import TeiReader


files = glob.glob("./data/editions/*xml")

out_dir = os.path.join("html", "js-data")
out_file = os.path.join(out_dir, "calendarData.json")
os.makedirs(out_dir, exist_ok=True)

data = []
years = set()
for x in files:
    doc = TeiReader(x)
    link = os.path.split(x)[-1].replace(".xml", ".html")
    start, end = extract_begin_end(doc.any_xpath(".//tei:creation/tei:date")[0])
    years.add(start[:4])
    years.add(end[:4])
    if start and end:
        item = {
            "date": start.replace("201", "191"),
            "label": doc.any_xpath(".//tei:title[1]")[0].text,
            "link": link,
            "kind": doc.any_xpath(".//tei:typeDesc")[0].text
        }
        data.append(item)

with open(out_file, "w", encoding="utf-8") as fp:
    json.dump(data, fp, ensure_ascii=False, indent=2)

print(years)