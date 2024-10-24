<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:local="http://dse-static.foo.bar"
    version="2.0" exclude-result-prefixes="xsl tei xs local">
    <xsl:output encoding="UTF-8" media-type="text/html" method="html" version="5.0" indent="yes" omit-xml-declaration="yes"/>
    

    <xsl:import href="./partials/html_navbar.xsl"/>
    <xsl:import href="./partials/html_head.xsl"/>
    <xsl:import href="./partials/html_footer.xsl"/>
    

    <xsl:variable name="prev">
        <xsl:value-of select="replace(tokenize(data(tei:TEI/@prev), '/')[last()], '.xml', '.html')"/>
    </xsl:variable>
    <xsl:variable name="next">
        <xsl:value-of select="replace(tokenize(data(tei:TEI/@next), '/')[last()], '.xml', '.html')"/>
    </xsl:variable>
    <xsl:variable name="teiSource">
        <xsl:value-of select="data(tei:TEI/@xml:id)"/>
    </xsl:variable>
    <xsl:variable name="link">
        <xsl:value-of select="replace($teiSource, '.xml', '.html')"/>
    </xsl:variable>
    <xsl:variable name="doc_title">
        <xsl:value-of select=".//tei:titleStmt/tei:title[1]/text()"/>
    </xsl:variable>


    <xsl:template match="/">
        <html class="h-100">
            <head>
                <xsl:call-template name="html_head">
                    <xsl:with-param name="html_title" select="$doc_title"></xsl:with-param>
                </xsl:call-template>
                
            </head>
            <body class="d-flex flex-column h-100">
                <xsl:call-template name="nav_bar"/>
                <main class="flex-shrink-0 flex-grow-1">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-2 col-lg-2 col-sm-12 text-start">
                                <xsl:if test="ends-with($prev,'.html')">
                                    <a>
                                        <xsl:attribute name="href">
                                            <xsl:value-of select="$prev"/>
                                        </xsl:attribute>
                                        <i class="fs-2 bi bi-chevron-left" title="Zurück zum vorigen Dokument" visually-hidden="true">
                                            <span class="visually-hidden">Zurück zum vorigen Dokument</span>
                                        </i>
                                    </a>
                                </xsl:if>
                            </div>
                            <div class="col-md-8 col-lg-8 col-sm-12 text-center">
                                <h1>
                                    <xsl:value-of select="$doc_title"/>
                                </h1>
                                <div>
                                    <a href="{$teiSource}">
                                        <i class="bi bi-download fs-2" title="Zum TEI/XML Dokument" visually-hidden="true">
                                            <span class="visually-hidden">Zum TEI/XML Dokument</span>
                                        </i>
                                    </a>
                                </div>
                            </div>
                            <div class="col-md-2 col-lg-2 col-sm-12 text-start">
                                <xsl:if test="ends-with($next, '.html')">
                                    <a>
                                        <xsl:attribute name="href">
                                            <xsl:value-of select="$next"/>
                                        </xsl:attribute>
                                        <i class="fs-2 bi bi-chevron-right" title="Weiter zum nächsten Dokument" visually-hidden="true">
                                            <span class="visually-hidden">Weiter zum nächsten Dokument</span>
                                        </i>
                                    </a>
                                </xsl:if>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-5">
                                <h2>Zum Dokument</h2>
                                <dl>
                                    <dt>Archiv</dt>
                                    <dd><xsl:value-of select=".//tei:msIdentifier/tei:repository"/></dd>
                                    <dt>Bestand</dt>
                                    <dd><xsl:value-of select=".//tei:msIdentifier/tei:msName"/></dd>
                                    <dt>Art des Dokuments</dt>
                                    <dd><xsl:value-of select=".//tei:typeDesc"/></dd>
                                    <dt>Schlagworte</dt>
                                    <dd>
                                        <xsl:for-each select=".//tei:keywords">
                                            <a href="{concat('search.html?gtrans[refinementList][keywords][0]=', .//text())}">
                                                <span class="badge rounded-pill text-bg-light fs-5">
                                                    <xsl:value-of select="."/>
                                                    <xsl:text> </xsl:text>
                                                </span>
                                            </a>
                                        </xsl:for-each>
                                    </dd>
                                </dl>
                            </div>
                            <div class="col-md-7">
                                <h2>Zusammenfassung</h2>
                                <p class="lead"><xsl:value-of select=".//tei:abstract"/></p>
                                <xsl:for-each select=".//tei:editor">
                                    <figcaption class="blockquote-footer text-end">
                                        <xsl:value-of select="."/>
                                    </figcaption>
                                </xsl:for-each>
                                
                            </div>
                            
                        </div>
                        <hr/>
                        <h2 class="text-center pt-3">Personen, Orte, Institutionen</h2>
                        <div class="row">
                            <div class="col-md-4">
                                <dl>
                                <xsl:for-each select=".//tei:back//tei:person[@xml:id]">
                                    
                                        <dt>
                                            <xsl:value-of select="./tei:persName/tei:surname"/><xsl:if test="./tei:persName/tei:forename/text()">, <xsl:value-of select="./tei:persName/tei:forename"/></xsl:if>
                                            
                                        </dt>
                                        <dd>
                                            <xsl:if test="./tei:birth/tei:placeName">
                                                *<xsl:value-of select="./tei:birth/tei:placeName/text()"/>
                                            </xsl:if><xsl:if test="./tei:birth[@when]">
                                                <xsl:text>, </xsl:text><xsl:value-of select="./tei:birth/@when"/>
                                            </xsl:if>
                                        </dd>
                                        <dd>
                                            <xsl:if test="./tei:death/tei:placeName">
                                                <xsl:text>†</xsl:text><xsl:value-of select="./tei:death/tei:placeName/text()"/>
                                            </xsl:if>
                                            <xsl:if test="./tei:death[@when]">
                                                <xsl:text> </xsl:text><xsl:value-of select="./tei:death/@when"/>
                                            </xsl:if>
                                       </dd>
                                        <dd>
                                            <xsl:if test="./tei:idno">  <a href="{./tei:idno/text()}"><xsl:value-of select="./tei:idno"/></a></xsl:if>
                                        </dd>
                                </xsl:for-each>
                                </dl>
                            </div>
                            <div class="col-md-4">
                                <dl>
                                <xsl:for-each select=".//tei:back//tei:place[@xml:id]">
                                    <dt>
                                        <xsl:value-of select="./tei:placeName"/>
                                    </dt>
                                    <dd>
                                        <xsl:if test="./tei:idno">
                                            <a href="{./tei:idno/text()}">
                                                <xsl:value-of select="./tei:idno"/>
                                            </a>
                                        </xsl:if>
                                    </dd>
                                </xsl:for-each>
                                </dl>
                            </div>
                            <div class="col-md-4">
                                <dl>
                                    <xsl:for-each select=".//tei:back//tei:org[@xml:id]">
                                        <dt>
                                            <xsl:value-of select="./tei:orgName"/>
                                        </dt>
                                        <dd>
                                            <xsl:if test="./tei:idno">
                                                <a href="{./tei:idno/text()}">
                                                    <xsl:value-of select="./tei:idno"/>
                                                </a>
                                            </xsl:if>
                                        </dd>
                                    </xsl:for-each>
                                </dl>
                            </div>
                        </div>
                    </div>
                    
                </main>
                <xsl:call-template name="html_footer"/>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/openseadragon/4.1.0/openseadragon.min.js"/>
                <script src="https://unpkg.com/de-micro-editor@0.3.4/dist/de-editor.min.js"></script>
                <script type="text/javascript" src="js/run.js"></script>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
