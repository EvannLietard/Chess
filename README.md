## Getting started

### Getting the code

This code has been tested in Pharo 12. You can get it by installing the following baseline code:

```smalltalk
Metacello new
	repository: 'github://UnivLille-Meta/Chess:main';
	baseline: 'MygChess';
	onConflictUseLoaded;
	load.
```

### Using it

You can open the chess game using the following expression:

```smalltalk
board := MyChessGame freshGame.
board size: 800@600.
space := BlSpace new.
space root addChild: board.
space pulse.
space resizable: true.
space show.
```

## KATAS 

### Pawlowski Florine 
#### refactor piece rendering 

Pour l'élaboration de mon kata je vous conseille de lire mes rubriques KATA sur ce repo : 

https://github.com/PawlowskiFlo/Miage23/blob/2024/Groups/G04/report_week03.md

(week 03 / week 05 / week 06 / week 08) 

### TAGs 

(je ne savais pas comment tagger les parties de mon code j'ai appris ça sur la fin de mon kata donc je n'ai pas pu tagger directement sur git mes anciennes parties. Voici une découpe sur certains commits de mon kata)

TAG 1 : Voici la première version de mon kata : C'est la partie où j'ai créé des tests pour assurer que le refactoring que j'allais faire par la suite garderait le même comportement qu'auparavent. 

https://github.com/EvannLietard/Chess/tree/9d93eaea09766c5e38dce43d51ae4e8ee92f29b6

TAG 2 : La deuxième version de mon kata est l'implémentation de MyBlackChessSquare et MyWhiteChessSquare (afin d'appliquer le double dispatch, voir la méthode contents : type du pion inconnu + type du square inconnu à l'écriture de la méthode, le double dispatch s'appliquera donc à l'execution quand le message sera envoyé aux objets.) 

https://github.com/EvannLietard/Chess/commit/ff07a5a2253ae36bea5e7d8619c718b6910fcf3e

TAG 3 : Suite à ces deux parties il me restait toujours un block conditionnel dans chaque méthode render, j'avais pensé à créer des classes de pions pour chaque couleur (par exemple un king blanc, un king noir, une queen blanche, une queen blanche etc) toutefois en étant tous passés au tableau pour présenter l'avancée de notre kata en cours, Guille nous a mis sur la voix de la Strategy. J'ai donc pensé à mettre en place ce design pattern sur la couleur du pion ce qui permettrait de ne pas créer une classe de pion par couleur et donc c'est beaucoup plus lisible et ouvert aux possibles extensions. 

https://github.com/EvannLietard/Chess/commit/bb496a38ef8f7cfb3e1a74718b35499a69892180

#### solution apportée 

Durant mes dernieres séances sur ce kata j'ai modifié mes derniers changements, j'ai fait un peu de refactoring en retirant quelques méthodes inutiles (par exemple renderBishop: et tous les autres render dans la classe MyChessSquare puisque on peut mettre en place le double dispacth directement grâce à myChessColor (qui est une stratégie) dans les méthodes renderPieceOn de chaque type de pièce.) 

En finalité nous n'avons plus aucun block conditionnel dans les méthodes render. Ceci étant possible grâce à la stratégie mise en place ( MyChessColor -> MyChessWhiteColor / MyChessBlackColor qui est une stratégie sur la couleur de la pièce) et grâce à l'héritage mis en place sur MyChessSquare qui est la super classe de MyWhiteChessSquare et MyBlackChessSquare. 
La pièce, à sa création, connaît myChessColor (stratégie noire ou blanche finalement) et grâce à cette stratégie et en lui passant un square de type blanc ou noir en paramètre, la méthode renderPieceOn fera appel à la bonne méthode de rendering en appliquant le double dispatch sur myChessColor et aSquare. 

J'ai produit ce refactoring en créant des tests dès le départ que j'ai dû légérement modifer (surtout la partie set up de mes variables par exemple on construit un test en créant un MyBlackChessSquare et pas seulement un MyChessSquare classique ) 

Voici l'UML du projet de départ centré sur les classes dont on s'occupe particulièrement pour le refactoring des méthodes de render:

![UML départ](UML_starting_project.png)

Voici l'UML de ma solution apportée pour ce KATA : 

![UML solution](UML_solution.png)

Je n'ai volontairement pas tout représenté, il manque certaines méthodes et bien sûr les classes environnantes du projet Chess. Pour les exemples, j'ai à chaque fois pris renderBishop mais la logique est la même pour toutes les autres méthodes de rendering. 

#### introspection 

Pour ce kata j'ai choisi de d'abord faire les tests, puis de réfléchir à une première solution (square blanc et square noir) 
cette première partie était bien pensée puisque j'ai fait les tests d'abord et l'implémentation ensuite. 
Toutefois comme ce n'était pas suffisant j'ai ajouté la stratégie sur la couleur mais je n'avais pas encore modifié mes tests et j'ai tout changé en même temps en un seul gros "block" ce qui n'est pas une très bonne pratique car j'aurais pu casser tout mon code (heureusement ce n'était pas le cas ici car le projet n'est pas très gros). J'ai quand même procédé par étapes c'est à dire par exemple m'occuper seulement de MyChessWhiteColor puis ensuite MyChessBlackColor, puis modifier ou valider les tests etc.
A l'avenir j'essaierais de modifier mon code par plus petits blocks en vérifiant que les tests ne sont pas cassés ou en créant des méthodes intermédiaires par exemple qui permettent de maintenir un code fonctionnel pendant les changements. 

#### Pour aller plus loin 
J'ai laissé la variable color dans MyPiece car je sais que le Kata d'evann l'utilise pour éviter de lui ajouter du travail en plus alors qu'il avait fini, mais celle ci en soit n'est plus utile car elle redirige vers la couleur de myChessColor. Pour aller plus loin il faudrait retirer cette variable et veiller à changer toutes les méthodes utilisant color en remplaçant par "myChessColor color" 

### Lietard Evann
#### Pawn promotion

  Mon kata peut être divisé en 4 versions différentes (celles-ci sont visibles dans les sorties) :

- **Première version** :  
  Cette version consistait en l'implémentation des méthodes permettant de remplacer le pion par une pièce prédéfinie. Le problème principal était que les boutons de l'interface graphique se superposaient, ce qui rendait impossible de proposer plusieurs options de promotion. Par conséquent, je n'ai pu intégrer qu'un seul bouton, obligeant à remplacer manuelement le 
  pion par une pièce prédéfinie (comme une reine).  
  *Problèmes rencontrés* : Interface graphique non adaptée aux besoins, empêchant le choix du type de pièce.  

- **Deuxième version** :  
  Dans cette version, il était désormais possible de choisir le type de pièce remplaçant le pion. En effet, c'est à ce stade que mon interface graphique a été rendue fonctionnelle, avec des boutons distincts permettant de sélectionner une reine, un cavalier, une tour ou un fou.  
  *Exemple* : Lorsqu'un pion atteignait la dernière rangée, une fenêtre s'ouvrait, présentant des boutons cliquables pour chaque type de pièce.  

- **Troisième version** :  
  Ici, j'ai implémenté un type de promotion différent. Jusqu'alors, la promotion nécessitait obligatoirement l'intervention humaine, mais je voulais que cela puisse être réalisée automatiquement par l'ordinateur. Pour ce faire, j'ai choisi d'utiliser le design pattern *Strategy* afin de gérer le comportement de la méthode de promotion de pion.  
  *Exemple* : Si un pion noir atteignait la dernière rangée, l'ordinateur sélectionnait automatiquement une pièce en fonction d'une logique prédéfinie. Pour le joueur blanc, cependant, il conservait la possibilité de choisir manuellement la pièce qui remplacerait son pion.  
  *Limites* : Bien que cette version ait introduit un mécanisme de promotion automatique, elle n'offrait pas une flexibilité totale aux joueurs. Les joueurs n'avaient pas le choix de décider comment ils souhaitaient jouer leur partie (manuel ou automatique), ce qui pouvait limiter leur expérience de jeu.


- **Quatrième version (actuelle)** :  
  Dans cette version, je voulais offrir aux joueurs le choix de la manière dont ils effectuent la promotion. J'ai donc refait une interface graphique permettant aux joueurs de décider comment effectuer leur promotion.  
  *Exemple* : Avant le début de la partie, chaque joueur peut configurer son mode de promotion (manuel, automatique,).  

### ATTENTION :  
Les interfaces graphiques apparaissent très souvent derrière l'interface principale du jeu. Si cela se produit, il suffit de faire un clic gauche sur l'icône de Pharo dans la barre des tâches, et les interfaces deviendront visibles.

### Méthode de travail :  
Au début, je n'ai rencontré aucun problème pour appliquer la méthode TDD (Test-Driven Development). Cependant, cela s'est avéré beaucoup plus difficile lorsque j'ai dû gérer les interfaces graphiques, car je ne les maîtrisais pas du tout.  

Face à cette difficulté, j'ai préféré effectuer de nombreux tests manuels pour valider le fonctionnement des interfaces. Parallèlement, je veillais à ce que mes changements n'affectent pas les tests déjà réalisés, afin de garantir la stabilité du reste du code.



