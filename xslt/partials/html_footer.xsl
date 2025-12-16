<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="#all"
    version="2.0">
    <xsl:template match="/" name="html_footer">
        <footer class="footer mt-auto py-3 bg-body-tertiary">
            <div class="container p-4">
                <div class="row my-4">
                    <div class="col-md-2 text-start">
                        <div>
                            <a href="https://wirtschaftsgeschichte.univie.ac.at/">
                                <img src="images/uni_wien_logo.png" class="footerimage" />
                            </a>
                        </div>
                    </div>
                    <div class="col-md-4 text-start">
                        <p>
                            Institut für Wirtschafts- und Sozialgeschichte
                            <br></br>
                             Universtiät Wien
                            <br></br>
                             Universitätsring 1
                            <br></br>
                             1010 Wien
                        </p>
                        <p>
                            T: +43-1-4277-272 01
                            <br></br>
                        </p>
                    </div>
                    <div class="col-md-2 text-end" >
                        <div>
                            <a href="https://www.oeaw.ac.at/acdh/acdh-home">
                                <img src="images/acdhch_logo.png" class="acdh-logo"></img>
                            </a>
                        </div>
                    </div>
                    <div class="col-md-4 text-end">
                        <p>
                            ACDH-CH
                            <br></br>
                                Austrian Centre for Digital Humanities
                                <br></br>
                                Österreichische Akademie der Wissenschaften
                        </p>
                        <p>
                            Bäckerstraße 13
                            <br></br>
                            1010 Wien
                        </p>
                        <p>
                            T: +43 1 51581-2200
                            <br></br>
                                E: <a href="mailto:acdh-helpdesk@oeaw.ac.at">acdh-helpdesk@oeaw.ac.at</a>
                        </p>
                    </div>
                </div>
            </div>
            <div class="text-center">
                <a href="{$github_url}"><i class="bi bi-github fs-2"></i></a>
            </div>
        </footer>
        <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </xsl:template>
</xsl:stylesheet>