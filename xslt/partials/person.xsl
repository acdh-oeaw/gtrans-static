<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    version="2.0" exclude-result-prefixes="xsl tei xs">
    
    <xsl:template match="tei:person" name="person_detail">
        <table class="table entity-table">
            <tbody>
                <xsl:if test="./tei:birth/tei:date">
                <tr>
                    <th>
                        Geburtsdatum
                    </th>
                    <td>
                        <xsl:value-of select="./tei:birth/tei:date"/>
                    </td>
                </tr>
                </xsl:if>
                <xsl:if test="./tei:death/tei:date">
                <tr>
                    <th>
                        Sterbedatum
                    </th>
                    <td>
                        <xsl:value-of select="./tei:death/tei:date"/>
                    </td>
                </tr>
                </xsl:if>
                <xsl:if test="./tei:idno">
                    <th>Links</th>
                    <td>
                        <xsl:for-each select="./tei:idno">
                            <a href="{.}"><xsl:value-of select="."/></a>
                        </xsl:for-each>
                    </td>
                </xsl:if>
                <xsl:if test="./tei:noteGrp/tei:note[@type='mentions']">
                    <tr>
                        <th>
                            Erwähnt in
                        </th>
                        <td>
                            <ul>
                                <xsl:for-each select="./tei:noteGrp/tei:note[@type='mentions']">
                                    <li>
                                        <a href="{replace(@target, '.xml', '.html')}">
                                            <xsl:value-of select="./text()"/>
                                        </a>
                                    </li>
                                </xsl:for-each>
                            </ul>
                        </td>
                    </tr>
                </xsl:if>
            </tbody>
        </table>
    </xsl:template>
</xsl:stylesheet>