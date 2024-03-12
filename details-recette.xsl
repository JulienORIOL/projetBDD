<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/boiteRecettes/recette[@id='recette_poulet_curry']">
    <html>
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <link rel="stylesheet" type="text/css" href="scenario1.css"/>
      </head>
      <body>
        <h1><xsl:value-of select="titre"/></h1>
        <p><xsl:value-of select="description"/></p>

        <h2>Ingrédients</h2>
        <ul>
          <xsl:for-each select="ingredients">
            <li><xsl:value-of select="concat(quantite, ' ', unite, ' de ', nom)"/></li>
          </xsl:for-each>
        </ul>

        <h2>Étapes de préparation</h2>
        <ol>
          <xsl:for-each select="etapes">
            <li>
              <strong>Étapes <xsl:value-of select="position()" />:</strong>
              <xsl:value-of select="." />
            </li>
          </xsl:for-each>
        </ol>
        
      </body>
    </html>
  </xsl:template>

  <!-- Cette balise permet de capturer toutes les autres données textuelles, mais elle ne produit aucune sortie donc elle permet de les ignorer,
  afin de n'afficher que les données capturées précédemment -->
  <xsl:template match="text()"/>

</xsl:stylesheet>
