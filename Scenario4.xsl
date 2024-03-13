<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes"/>

    <!-- Template pour le document racine -->
    <xsl:template match="/boiteRecettes">
        <categoriesRecettes>
            <!-- Groupement des recettes par gastronomie -->
            <xsl:for-each select="recette">
                <!-- Utiliser une clé pour regrouper, si nécessaire -->
                <xsl:sort select="gastronomie"/>
                <!-- Assurer un traitement unique pour chaque catégorie de gastronomie -->
                <xsl:if test="not(preceding-sibling::recette/gastronomie = current()/gastronomie)">
                    <categorie nom="{gastronomie}">
                        <xsl:for-each select="../recette[gastronomie = current()/gastronomie]">
                            <recette>
                                <titre><xsl:value-of select="titre"/></titre>
                                <description><xsl:value-of select="description"/></description>
                                <budget><xsl:value-of select="budget"/></budget>
                                <tempsPreparation><xsl:value-of select="tempsPreparation"/></tempsPreparation>
                                <!-- Ajouter d'autres détails si nécessaire -->
                            </recette>
                        </xsl:for-each>
                    </categorie>
                </xsl:if>
            </xsl:for-each>
        </categoriesRecettes>
    </xsl:template>
</xsl:stylesheet>
