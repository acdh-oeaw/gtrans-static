<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:local="http://dse-static.foo.bar"
    version="2.0" exclude-result-prefixes="xsl tei xs local">
    <xsl:output encoding="UTF-8" media-type="text/html" method="html" version="5.0" indent="yes" omit-xml-declaration="yes"/>

    <xsl:import href="./partials/html_head.xsl"/>
    <xsl:import href="./partials/html_navbar.xsl"/>
    <xsl:import href="./partials/html_footer.xsl"/>
    <xsl:import href="./partials/one_time_alert.xsl"/>

    <xsl:template match="/">
        <xsl:variable name="doc_title">
            <xsl:value-of select='"gtrans"'/>
        </xsl:variable>
        <html class="h-100">
            <head>
                <xsl:call-template name="html_head">
                    <xsl:with-param name="html_title" select="$doc_title"></xsl:with-param>
                </xsl:call-template>
            </head>            
            <body class="d-flex flex-column h-100">
                <xsl:call-template name="nav_bar"/>
                <main class="flex-shrink-0 flex-grow-1">
                    <div class="container col-xxl-8 px-2">
                        <div class="row flex-lg-row align-items-center g-5 py-5">
                            <div class="col-lg-6">
                                <h1 class="display-5 text-body-emphasis lh-1 mb-3">
                                    Die große Transformation. 
                                </h1>
                                <p class="lead">Staat und kommunaler öffentlicher Dienst in Wien, 1918-1920</p>
                                <div class="d-grid gap-2 d-md-flex justify-content-md-start">
                                    <a href="search.html" type="button"
                                        class="btn btn-primary btn-lg px-4 me-md-2">Suche im Volltext
                                    </a>
                                    <a href="toc.html" type="button"
                                        class="btn btn-outline-secondary btn-lg px-4">Alle Einträge</a>
                                </div>
                            </div>
                            <div class="col-10 col-sm-8 col-lg-6">
                                <figure class="figure">
                                    <img src="images/title-image.jpg" class="d-block mx-lg-auto img-fluid"
                                        alt="" height="700" loading="lazy"/>
                                    <figcaption class="figure-caption">Ein Aktenbeispiel</figcaption>
                                </figure>
                            </div>
                        </div>
                    </div>
                </main>
                <xsl:call-template name="html_footer"/>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>