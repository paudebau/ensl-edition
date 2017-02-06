# Production de documents d'enseignement pour l'ENS Lyon

* Ce qui est relatif à l'ENSL est constant (identité, logo, etc)
* Les paramètres relatifs à un cours sont détachés dans un fichier de configuration
* Les éléments qui ne concernent que le document courant sont en tête de ce document.

Voir [`sample.tex`](sample.tex) pour un exemple.

Ce dépôt intègre également le paquet LaTeX `minted.sty` (version plus récente que
cette distribuée par TeXLive, au 10 septembre 2016), qui dépend du module Python
`pygments` pour la colorisation des sources.

Ces fichiers ont été mis au point initialement pour les cours en CPES Sciences, à
sa création en 2010-11. Le seul changement concerne le remplacement du paquet
`listings` par `minted`.

Le logiciel [TeXmacs](http://www.texmacs.org/) permet de faire tout cela,
et bien davantage, avec une interface très facile à utiliser.

## Chargement des paquets

chaque cours a une étiquette (thpr, pnp, ...) notée ici <label>.

1. `<label>.cls` appelle `ensldocuments.cls` avec les bonnes options :

    lecture=<label>,langage=...

2. `ensldocument.cls` charge, dans cet ordre :

  a. `lecture.sty` : le matériel commun à TOUS les enseignements
  b. `<label>.cfg` : métadata relative à CET enseignement
  b. `lecture.<label>.sty`: celui ne concernant que CET enseignement
  c. `\jobname.patch.sty` : optionnellement, des macros requise pour CE document
  
Tout ce qui serait dans le préambule du document est chargé entre a) et b).
Donc, sa juste place est dans b) ou bien dans c) !

# Dépendances

* **minted** [Github](https://github.com/gpoore/minted)
* **fvextra** [Github](https://github.com/gpoore/fvextra)
