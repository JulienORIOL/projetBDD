# README

## Prérequis

Avant de pouvoir exécuter le script `Scenario6.py`, veillez à satisfaire aux prérequis suivants :

### Python

Le script est écrit pour Python 3. Vous aurez besoin de Python 3.6 ou plus récent pour exécuter le script correctement, en raison de l'utilisation de f-strings et d'autres fonctionnalités modernes de Python.

Pour vérifier la version de Python installée sur votre machine, ouvrez un terminal et tapez :

```sh
python --version
```

ou

```sh
python3 --version
```

Si Python n'est pas installé ou si votre version est antérieure à 3.6, visitez [le site officiel de Python](https://www.python.org/downloads/) pour télécharger et installer la dernière version de Python.

### Bibliothèques Python

Le script utilise la bibliothèque `prompt_toolkit` pour l'interface utilisateur interactive dans le terminal. Vous devez installer cette bibliothèque avant d'exécuter le script.

Pour installer `prompt_toolkit`, utilisez le gestionnaire de paquets `pip`, qui est l'outil d'installation de paquets pour Python. Ouvrez un terminal et exécutez la commande suivante :

```sh
pip install prompt_toolkit
```

ou si vous avez à la fois Python 2 et Python 3 installés et que `pip` est associé à Python 2 :

```sh
pip3 install prompt_toolkit
```

Assurez-vous que `pip` est à jour en exécutant :

```sh
pip install --upgrade pip
```

ou pour Python 3 :

```sh
pip3 install --upgrade pip
```

### Fichier XML

Le script nécessite un fichier XML `recettes.xml` contenant les données des recettes à classifier. Assurez-vous que ce fichier est dans le même répertoire que le script ou que le chemin vers le fichier est correctement référencé dans le script.

### Système d'exploitation

Le script doit être exécuté dans un environnement de terminal. Il est compatible avec les systèmes d'exploitation Windows, macOS et Linux, à condition que Python et les dépendances nécessaires soient installés.

### Permissions

Sur les systèmes basés sur Unix (macOS et Linux), il se peut que vous deviez rendre le script exécutable avant de pouvoir le lancer. Pour ce faire, utilisez la commande `chmod` :

```sh
chmod +x Scenario6.py
```

## Exécution

Pour exécuter le script, ouvrez un terminal, accédez au répertoire contenant le script, puis exécutez la commande suivante :

```sh
python3 /path/to/Scenario6.py
```
ou, si python3 n'est pas reconnu,
```sh
python /path/to/Scenario6.py
```