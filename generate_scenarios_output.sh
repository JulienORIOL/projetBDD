#!/bin/bash

# Définissez le chemin d'accès à votre fichier XML d'entrée
XML_INPUT="recettes.xml"

# Définissez le chemin d'accès à votre dossier de feuilles de style XSL
XSL_DIR="Scenarios1-6"

# Définissez le chemin d'accès au dossier de sortie
OUTPUT_DIR="Outputs"

# Créez le dossier de sortie s'il n'existe pas déjà
mkdir -p "$OUTPUT_DIR"

# Bouclez sur chaque fichier XSL dans le dossier de feuilles de style
for XSL_FILE in "$XSL_DIR"/*.xsl; do
    # Obtenez le numéro du scénario à partir du nom du fichier XSL
    SCENARIO_NUM=$(basename "$XSL_FILE" .xsl | sed 's/[^0-9]*//g')

    # Définissez l'extension du fichier de sortie en fonction du numéro du scénario
    if [ "$SCENARIO_NUM" -le 3 ]; then
        OUTPUT_EXT=".html"
    elif [ "$SCENARIO_NUM" -eq 4 ]; then
        OUTPUT_EXT=".xml"
    elif [ "$SCENARIO_NUM" -eq 5 ]; then
        OUTPUT_EXT=".json"
    else
        echo "Aucune extension spécifiée pour le scénario $SCENARIO_NUM"
        continue
    fi

    # Construisez le chemin d'accès au fichier de sortie
    OUTPUT_FILE="$OUTPUT_DIR/scenario${SCENARIO_NUM}${OUTPUT_EXT}"

    # Utilisez xsltproc pour transformer le XML avec le XSL
    xsltproc -o "$OUTPUT_FILE" "$XSL_FILE" "$XML_INPUT"
done

# Confirmation des fichiers générés
echo "Les fichiers de sortie ont été générés dans le dossier : $OUTPUT_DIR"
