import xml.etree.ElementTree as ET
from prompt_toolkit import prompt
from prompt_toolkit.shortcuts import button_dialog

# Charger le fichier XML
tree = ET.parse('recettes.xml')
root = tree.getroot()

def extraire_et_trier_recettes(root, mode_tri):
    recettes = []

    for recette in root.findall('recette'):
        info_recette = {
            "titre": recette.find('titre').text,
            "budget": int(recette.find('budget').text),
            "tempsPreparation": int(recette.find('tempsPreparation').text),
        }
        recettes.append(info_recette)

    if mode_tri == "budget":
        recettes.sort(key=lambda x: x["budget"])
    elif mode_tri == "tempsPreparation":
        recettes.sort(key=lambda x: x["tempsPreparation"])
    elif mode_tri == "titre":
        recettes.sort(key=lambda x: x["titre"])

    return recettes

# Afficher un menu de sélection pour le mode de tri
result = button_dialog(
    title="Mode de Tri",
    text="Choisissez le mode de tri:",
    buttons=[
        ("Budget", "budget"),
        ("Temps de Préparation", "tempsPreparation"),
        ("Titre", "titre"),
    ],
).run()

mode_tri = result

# Utiliser la fonction et afficher les résultats
recettes_triees = extraire_et_trier_recettes(root, mode_tri)
for recette in recettes_triees:
    if mode_tri == "budget":
        print(f"- {recette['titre']} (Budget: {recette['budget']} euros)")
    elif mode_tri == "tempsPreparation":
        print(f"- {recette['titre']} (Temps de préparation: {recette['tempsPreparation']} minutes)")
    elif mode_tri == "titre":
        print(f"- {recette['titre']}")
