<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text"/>

    <!-- Template pour le document racine -->
    <xsl:template match="/boiteRecettes">
        {
        "recettes": [
        <xsl:for-each select="recette">
            <xsl:if test="position() != 1">, </xsl:if>
            {
            "titre": "<xsl:value-of select='titre'/>",
            "description": "<xsl:value-of select='description'/>",
            "gastronomie": "<xsl:value-of select='gastronomie'/>",
            "budget": <xsl:value-of select='budget'/>
            }
        </xsl:for-each>
        ]
        }
    </xsl:template>
</xsl:stylesheet>
