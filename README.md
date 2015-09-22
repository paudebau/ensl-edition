# Production de documents d'enseignement pour l'ENS Lyon

* Ce qui est relatif à l'ENSL est constant (identité, logo, etc)
* Les paramètres relatifs à un cours sont détachés dans un fichier de configuration
* Les éléments qui ne concerne que le document courant sont en tête de ce document

Voir [`sample.tex`](blob/master/sample.tex) pour un exemple.

Ce dépôt intègre également le paquet LaTeX `minted.sty` (version plus récente que
cette distribuée par TeXLive, au 19 septembre 2015), qui dépend du module Python
`pygments` pour la colorisation des sources.

Ces fichiers ont été mis au point initialement pour les cours en CPES Sciences, à
sa création en 2010-11. Le seul changement concerne le remplacement du paquet
`listings` par `minted`.

Le logiciel [TeXmacs](http://www.texmacs.org/tmweb/home/) permet de faire tout cela,
et bien davantage, avec une interface très facile à utiliser.

