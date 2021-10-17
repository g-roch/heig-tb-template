# Travail de Bachelor de ...

 - Ce dépôt git contient un template **QUI N'EST PAS FINI**
 - Les issues et pull-request sont les bienvenues, merci beaucoup

## Rapport

### Construction

Pour construire tout le rapport

```sh
make report
```

Pour construire tout les PDFs de base

```sh
make pdf
```

Pour automatiquement reconstruire le rapport lorsqu'un fichier change

```sh
cd latex && make report.pdf.pvc
```

Pour construire juste une sous-partie du rapport, le fichier 

```sh
cd latex && make <subfile>.pdf
```

avec `<subfile>.tex` correspondant au modele suivant :

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



Les logos sont pris de https://intra.heig-vd.ch/services/communication/papeterie_logos/Pages/default.aspx
