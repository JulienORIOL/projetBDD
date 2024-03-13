<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes"/>

    <!-- Racine -->
    <xsl:template match="/boiteRecettes">
        <categoriesRecettes>
            <xsl:for-each select="recette">
                <xsl:sort select="gastronomie"/>
                <xsl:if test="not(preceding-sibling::recette/gastronomie = current()/gastronomie)">
                    <categorie nom="{gastronomie}">
                        <xsl:for-each select="../recette[gastronomie = current()/gastronomie]">
                            <recette>
                                <titre><xsl:value-of select="titre"/></titre>
                                <imageRecetteURL><xsl:value-of select="imageRecetteURL"/></imageRecetteURL>
                                <description><xsl:value-of select="description"/></description>
                                <budget><xsl:value-of select="budget"/></budget>
                                <tempsPreparation><xsl:value-of select="tempsPreparation"/></tempsPreparation>
                                <ingredients>
                                    <xsl:for-each select="ingredients">
                                        <ingredient>
                                            <nom><xsl:value-of select="nom"/></nom>
                                            <imageURL><xsl:value-of select="imageURL"/></imageURL>
                                            <sante><xsl:value-of select="sante"/></sante>
                                        </ingredient>
                                    </xsl:for-each>
                                </ingredients>
                                <etapes>
                                    <xsl:for-each select="etapes">
                                        <etape><xsl:value-of select="."/></etape>
                                    </xsl:for-each>
                                </etapes>
                            </recette>
                        </xsl:for-each>
                    </categorie>
                </xsl:if>
            </xsl:for-each>
        </categoriesRecettes>
    </xsl:template>
</xsl:stylesheet>
