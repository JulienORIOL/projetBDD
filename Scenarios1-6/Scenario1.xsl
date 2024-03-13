<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/boiteRecettes/recette[@id='recette_poulet_curry']">
    <html>
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <link rel="stylesheet" type="text/css" href="../Stylesheets/scenario1.css"/>
        <style type="text/css">
          body::before {
            content: "";
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: url('<xsl:value-of select="imageRecetteURL"/>');
            background-size: cover;
            background-attachment: scroll;
            z-index: -1;
            filter: blur(5px);
          }
        </style>
      </head>
      <body>
        <div class = "content">
          <h1><xsl:value-of select="titre"/></h1>
          <hr class="section-separator"/>
          <p><xsl:value-of select="description"/></p>
          <div class="preparation-information">
            <ul>
              <li><span class="information">Gastronomie : </span><xsl:value-of select="gastronomie"/></li>
              <li><span class="information">Budget : </span><xsl:value-of select="budget"/>€</li>
              <li><span class="information">Temps de préparation : </span><xsl:value-of select="tempsPreparation"/> minutes</li>
            </ul>
          </div>

          <h2>Ingrédients</h2>
          <ul>
            <xsl:for-each select="ingredients">
              <li>
                <div class="ingredient-wrapper">
                  <div class="ingredient-details">
                    <img class="ingredient-image">
                      <xsl:attribute name="src">
                        <xsl:value-of select="imageURL"/>
                      </xsl:attribute>
                      <xsl:attribute name="alt">
                        <xsl:value-of select="nom"/>
                      </xsl:attribute>
                    </img>
                    <div class="ingredient-info">
                      <div class="ingredient-quantity"><xsl:value-of select="concat(quantite, ' ', unite)"/></div>
                      <div class="ingredient-name"><xsl:value-of select="nom"/></div>
                    </div>
                  </div>
                  <img class="nutri-score">
                    <xsl:attribute name="src">
                      <xsl:choose>
                        <xsl:when test="sante='A'">https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Nutri-score-A.svg/2560px-Nutri-score-A.svg.png</xsl:when>
                        <xsl:when test="sante='B'">https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Nutri-score-B.svg/2560px-Nutri-score-B.svg.png</xsl:when>
                        <xsl:when test="sante='C'">https://upload.wikimedia.org/wikipedia/commons/thumb/b/b5/Nutri-score-C.svg/2560px-Nutri-score-C.svg.png</xsl:when>
                        <xsl:when test="sante='D'">https://upload.wikimedia.org/wikipedia/commons/thumb/d/d6/Nutri-score-D.svg/2560px-Nutri-score-D.svg.png</xsl:when>
                        <xsl:when test="sante='E'">https://upload.wikimedia.org/wikipedia/commons/thumb/8/8a/Nutri-score-E.svg/2560px-Nutri-score-E.svg.png</xsl:when>
                      </xsl:choose>
                    </xsl:attribute>
                    <xsl:attribute name="alt">
                      <xsl:value-of select="concat('Nutri-Score ', sante)"/>
                    </xsl:attribute>
                  </img>
                </div>
              </li>
            </xsl:for-each>
          </ul>

          <h2>Étapes de préparation</h2>
          <ul>
            <xsl:for-each select="etapes">
              <li>
                <strong>Étapes <xsl:value-of select="position()" />: </strong>
                <xsl:value-of select="." />
              </li>
            </xsl:for-each>
          </ul>
        </div>
      </body>
    </html>
  </xsl:template>

  <!-- Cette balise permet de capturer toutes les autres données textuelles, mais elle ne produit aucune sortie donc elle permet de les ignorer,
  afin de n'afficher que les données capturées précédemment -->
  <xsl:template match="text()"/>

</xsl:stylesheet>
