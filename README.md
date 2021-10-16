# Travail de Bachelor de ...

 - Ce dépôt git contient un template **QUI N'EST PAS FINI**
 - Les issues et pull-request sont les bienvenues, merci beaucoup

## Ce qu'il reste à faire

 - [ ] pdflatex
 - - [x] Add meta information

 - [ ] Cahier des charges:
 - - [ ] Ajouter un template
 - - [ ] Inclure dans le rapport
 - - [ ] Construction séparée également
 - [ ] Résumé publiable:
 - - [ ] Ajouter un template
 - - [ ] Inclure dans le rapport
 - - [ ] Construction séparée également
 - [ ] Journal de travail:
 - - [ ] Ajouter un template
 - - [ ] Inclure dans le rapport
 - [ ] Présentation:
 - - [ ] Ajouter un template

 - [ ] Ajouter un Makefile à la racine pour construire le raport++ dans répertoire `publish`

 - [ ] Ajouter github action
 - - [ ] vérifier le build raport, CdC, Présentation, ...
 - - [ ] Lors du push dans ¿¿`stable`?? créer une release et la publier
 - - - [ ] Ajouter le build du diff depuis la dernière release

 - [ ] Ajouter une manière de build les diff. du rapport (entre 2 commit)
 
 - [ ] TOC
 - - [ ] Ajouter les tables de figures/tableau sommaire et autre

## Rapport

### Construction

Pour construire tout le rapport

```sh
cd latex
make report
```

Pour automatiquement reconstruire le rapport lorsqu'un fichier change

```sh
cd latex
make report.pdf.pvc
```

Pour construire juste une sous-partie du rapport, le fichier 

```sh
cd latex
make <subfile>.pdf
```

avec `<subfile>.tex` correspondant au modele suivant :

```latex
\documentclass[report]{subfiles}
\begin{document}
  % Le contenu
\end{document}
```



Les logos sont pris de https://intra.heig-vd.ch/services/communication/papeterie_logos/Pages/default.aspx
