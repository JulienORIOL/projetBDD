<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Aperçu Hebdomadaire des Menus</title>
            </head>
            <body>
                <h1>Aperçu Hebdomadaire des Menus</h1>
                <xsl:for-each select="boiteRecettes/menu">
                    <xsl:sort select="semaine"/>
                    <div>
                        <h2>Semaine <xsl:value-of select="semaine"/></h2>
                        <table border="1">
                            <tr>
                                <th>Plats disponibles</th>
                            </tr>
                            <tr>
                                    <xsl:for-each select="./recetteRef">
                                        <tr>
                                            <td>
                                                <xsl:value-of select="/boiteRecettes/recette[@id=current()]/titre"/>
                                            </td>
                                        </tr>
                                    </xsl:for-each>
                            </tr>
                        </table>
                    </div>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
