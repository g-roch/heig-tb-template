# Travail de Bachelor de ...

 - Ce dépôt git contient un template **QUI N'EST PAS FINI**
 - Les issues et pull-request sont les bienvenues, merci beaucoup

## Dépendance

### Rapport

Le paquet `texlive-full` (sous Debian/Ubuntu) contient toutes les dépendences. Une installation plus
spécifique peut fonctionner aussi, mais n'est pas documenté.

Le Makefile utilise les programmes suivants (doivent être dans le path) :
 - `find`
 - `latexdiff` et `latexdiff-vc`
 - `sed`
 - `make`
 - `latexmk`
 - `zip`

## Construction

### Rapport

Attention la construction dépends dur dépôt git, voir section `Dépôt git`

Pour construire tout le rapport:

```sh
make report
```

Pour construire tout les PDFs de base:

```sh
make pdf
```

Pour automatiquement reconstruire le rapport lorsqu'un fichier change:

```sh
cd latex && make report.pdf.pvc
```

Pour construire juste une sous-partie du rapport:

```sh
cd latex && make <dir>/<subfile>.pdf
```

avec le fichier `<dir>/<subfile>.tex` existant et correspondant au modele suivant :
```latex
\documentclass[report]{subfiles}
\begin{document}
  % Le contenu
\end{document}
```

Pour construire tout les PDFs en affichant les différences avec un commit : 

```sh
make diff-<ref>
```

example: 

```sh
make diff-main
```

## Dépôt git

Pour que la construction fonctionne vous devez avoir un tag dans l'historique git matchant avec `v[0-9]*` (ex: `v0.5.3` ou `v2`)

Branche principale à utiliser : `main` (pour utiliser une autre branche, adaptez les fichiers github actions)

Lors d'un push sur `main`, le rapport est automatiquement construit et publier dans une releases github.

## Dossier

 - `diff-*.zip`: PDF de diff avec `*`
 - `diff-*/`: Construction des fichiers de différence avec `*` (si corresponds à `*..*` contient les différences entre les deux commits referencé)
 - `lastdiff.zip`: PDF de difference avec la dernière version taggée
 - `lastdiff`: Difference avec la dernière version taggée
 - `latex/[a-zA-Z0-9]*/`: Contients des subfile LaTeX (ils sont inclus dans un/des fichiers `latex/*.tex`
 - `latex/_dyn/`: Contient des fichiers générée dynamiquement par `make` pour LaTeX
 - `latex/`: Contient les sources LaTeX

## Crédits

Les logos sont pris de https://intra.heig-vd.ch/services/communication/papeterie_logos/Pages/default.aspx .
Ces logos ne sont pas libre de droit.
