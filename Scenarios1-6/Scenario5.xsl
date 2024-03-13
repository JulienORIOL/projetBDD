<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text"/>

    <xsl:template match="/boiteRecettes">
        {
        "recettes": [
        <xsl:for-each select="recette">
            <xsl:if test="position() != 1">, </xsl:if>
            {
            "titre": "<xsl:value-of select='titre'/>",
            "imageRecetteURL": "<xsl:value-of select='imageRecetteURL'/>",
            "description": "<xsl:value-of select='description'/>",
            "gastronomie": "<xsl:value-of select='gastronomie'/>",
            "budget": <xsl:value-of select='budget'/>,
            "tempsPreparation": <xsl:value-of select='tempsPreparation'/>,
            "ingredients": [
            <xsl:for-each select="ingredients">
                <xsl:if test="position() != 1">, </xsl:if>
                {
                "nom": "<xsl:value-of select='nom'/>",
                "imageURL": "<xsl:value-of select='imageURL'/>",
                "quantite": <xsl:value-of select='quantite'/>,
                "unite": "<xsl:value-of select='unite'/>",
                "sante": "<xsl:value-of select='sante'/>"
                }
            </xsl:for-each>
            ],
            "etapes": [
            <xsl:for-each select="etapes">
                <xsl:if test="position() != 1">, </xsl:if>
                "<xsl:value-of select='.'/>"
            </xsl:for-each>
            ]
            }
        </xsl:for-each>
        ]
        }
    </xsl:template>
</xsl:stylesheet>
