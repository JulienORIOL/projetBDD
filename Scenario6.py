import xml.etree.ElementTree as ET

# Charger le fichier XML
tree = ET.parse('recettes.xml')
root = tree.getroot()

# Fonction pour classer les recettes par budget
def classer_recettes_par_budget(root):
    recettes_par_budget = {"Bas": [], "Moyen": [], "Élevé": []}

    for recette in root.findall('recette'):
        titre = recette.find('titre').text
        budget = int(recette.find('budget').text)

        if budget < 20:
            recettes_par_budget["Bas"].append(titre)
        elif 20 <= budget <= 40:
            recettes_par_budget["Moyen"].append(titre)
        else:
            recettes_par_budget["Élevé"].append(titre)

    return recettes_par_budget

# Utiliser la fonction et afficher les résultats
recettes_par_budget = classer_recettes_par_budget(root)

for categorie, recettes in recettes_par_budget.items():
    print(f"budget {categorie}:")
    for recette in recettes:
        print(f" - {recette}")
    print()  # Ajouter une ligne vide pour la lisibilité
