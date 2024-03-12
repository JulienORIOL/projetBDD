<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Suivi des Commandes</title>
                <link rel="stylesheet" type="text/css" href="scenario3.css"/>
            </head>
            <body>
                <h1>Liste des Commandes</h1>
                <table border="1">
                    <tr>
                        <th>Client</th>
                        <th>Adresse de Livraison</th>
                        <th>Date de Commande</th>
                        <th>Menu</th>
                        <th>Status</th>
                    </tr>
                    <xsl:for-each select="boiteRecettes/commande">
                        <xsl:sort select="status"/>
                        <tr>
                            <td>
                                <xsl:value-of select="../client[@id=current()/clientRef]/nom"/>
                            </td>
                            <td>
                                <xsl:value-of select="../client[@id=current()/clientRef]/adresseLivraison"/>
                            </td>
                            <td>
                                <xsl:value-of select="dateCommande"/>
                            </td>
                            <td>
                                <xsl:for-each select="../menu[@id=current()/menuRef]">
                                    <xsl:value-of select="@id"/>
                                    <xsl:text> (Semaine: </xsl:text>
                                    <xsl:value-of select="semaine"/>
                                    <xsl:text>)</xsl:text>
                                </xsl:for-each>
                            </td>
                            <td>
                                <xsl:value-of select="status"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
