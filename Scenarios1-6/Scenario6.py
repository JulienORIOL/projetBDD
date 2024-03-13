import xml.etree.ElementTree as ET
from prompt_toolkit.shortcuts import button_dialog

# Charger le fichier XML
tree = ET.parse('recettes.xml')
root = tree.getroot()

def classifier_par_budget(budget):
    if budget < 19:
        return "Bas"
    elif 19 <= budget <= 25:
        return "Moyen"
    else:
        return "Élevé"

def classifier_par_temps(temps):
    if temps < 30:
        return "Rapide"
    elif 30 <= temps <= 60:
        return "Moyen"
    else:
        return "Long"

def extraire_recettes(root):
    recettes = []
    for recette in root.findall('recette'):
        budget = int(recette.find('budget').text)
        temps = int(recette.find('tempsPreparation').text)
        recettes.append({
            "titre": recette.find('titre').text,
            "budget": budget,
            "tempsPreparation": temps,
            "categorie_budget": classifier_par_budget(budget),
            "categorie_temps": classifier_par_temps(temps),
        })
    return recettes

# Afficher un menu de sélection pour le mode de tri
mode_tri = button_dialog(
    title="Mode de Tri",
    text="Choisissez le mode de tri:",
    buttons=[
        ("Budget", "budget"),
        ("Temps de Préparation", "tempsPreparation"),
        ("Titre", "titre"),
    ],
).run()

# Trier et classifier les recettes
recettes = extraire_recettes(root)

# Classer les recettes par catégorie
categories = {"Bas": [], "Moyen": [], "Élevé": [], "Rapide": [], "Moyen": [], "Long": []}
for recette in recettes:
    if mode_tri == "budget":
        categories[recette["categorie_budget"]].append(recette)
    elif mode_tri == "tempsPreparation":
        categories[recette["categorie_temps"]].append(recette)
    elif mode_tri == "titre":
        # Pas de catégorie pour le tri par titre
        print(f"- {recette['titre']}")

# Afficher les recettes classées par catégorie pour le budget et le temps de préparation
if mode_tri in ["budget", "tempsPreparation"]:
    for categorie, recettes_list in categories.items():
        # Sauter l'affichage des catégories vides
        if not recettes_list:
            continue
        print(f"Budget {categorie}:" if mode_tri == "budget" else f"Temps de préparation {categorie}:")
        for recette in recettes_list:
            print(f" - {recette['titre']}")
        print()  # Saut de ligne pour séparer les catégories
