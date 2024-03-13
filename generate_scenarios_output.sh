#!/bin/bash

XML_INPUT="recettes.xml"

XSL_DIR="Scenarios1-6"

OUTPUT_DIR="Outputs"

# Créer le dossier de sortie s'il n'existe pas déjà
mkdir -p "$OUTPUT_DIR"

# Boucler sur chaque fichier XSL
for XSL_FILE in "$XSL_DIR"/*.xsl; do
    # Obtenir le numéro du scénario
    SCENARIO_NUM=$(basename "$XSL_FILE" .xsl | sed 's/[^0-9]*//g')

    # Extension du fichier de sortie dépendante du numéro du scénario
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

    OUTPUT_FILE="$OUTPUT_DIR/scenario${SCENARIO_NUM}${OUTPUT_EXT}"

    # Transformer le XML avec le XSL
    xsltproc -o "$OUTPUT_FILE" "$XSL_FILE" "$XML_INPUT"
done

echo "Les fichiers de sortie ont été générés dans le dossier : $OUTPUT_DIR"
