Class {
	#name : 'MyBlackChessSquareTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyBlackChessSquareTest >> testBlackContents [

    | blackSquareTest whitePiece blackPiece boardTest |

    boardTest := MyChessBoard empty.
    boardTest whiteColor: Color white.
    boardTest blackColor: Color black.

    blackSquareTest := MyBlackChessSquare new.
    blackSquareTest board: boardTest. 

    whitePiece := MyBishop white. 
    blackPiece := MyBishop black. 

    blackSquareTest contents: whitePiece.
    self assert: (blackSquareTest contents) equals: whitePiece.


]

{ #category : 'tests' }
MyBlackChessSquareTest >> testBlackContentsWithNil [

	| blackSquareTest boardTest expectedText |
	
	boardTest := MyChessBoard empty.
	boardTest whiteColor: Color white.
	boardTest blackColor: Color black.

	blackSquareTest := MyBlackChessSquare new.
	blackSquareTest board: boardTest.
	
	blackSquareTest contents: nil. "Pas de pièce sur la case"
	self assert: blackSquareTest contents isNil. 

	"Vérification que le texte affiché est 'z' pour une case noire sans pièce"
	expectedText := blackSquareTest contents
		                ifNil: ['x']
		                ifNotNil: [ blackSquareTest contents renderPieceOn: self ].
	self assert: expectedText equals: 'x'.

	
]

{ #category : 'foreground' }
MyBlackChessSquareTest >> testBlackForeground [

    | blackSquare board |

    board := MyChessBoard empty.
    board blackColor: Color pink.
    board whiteColor: Color orange.

    "Test case noire"
    blackSquare := MyBlackChessSquare new.
    blackSquare board: board.
    self assert: blackSquare foreground equals: Color pink.

]

{ #category : 'tests' }
MyBlackChessSquareTest >> testBlackNegativeColor [
    
    self assert: MyBlackChessSquare new negatedColor equals: Color white.

]

{ #category : 'rendering' }
MyBlackChessSquareTest >> testBlackRenderBishop [ 

	| squareTest whiteBishop blackBishop |
	squareTest := MyBlackChessSquare new.
	
	"Test fou blanc sur case blanche"
	whiteBishop := MyBishop white. 
	self assert: (whiteBishop renderPieceOn: squareTest) equals: 'b'.
	
	"Test fou noir sur case blanche"
	blackBishop := MyBishop black. 
	self assert: (blackBishop renderPieceOn: squareTest) equals: 'v'.
	

	
	
]

{ #category : 'rendering' }
MyBlackChessSquareTest >> testBlackRenderKing [

	| squareTest whiteKing blackKing |
	squareTest := MyBlackChessSquare new.
	
	"Test roi blanc sur case blanche"
	whiteKing := MyKing white. 
	self assert: (whiteKing renderPieceOn: squareTest) equals: 'k'.
	
	

]

{ #category : 'rendering' }
MyBlackChessSquareTest >> testBlackRenderKnight [

	| squareTest whiteKnight blackKnight |
	squareTest := MyBlackChessSquare new.
	
	"Test cavalier blanc sur case blanche"
	whiteKnight := MyKnight white. 
	self assert: (whiteKnight renderPieceOn: squareTest) equals: 'n'.
	
	"Test cavalier noir sur case blanche"
	blackKnight := MyKnight black. 
	self assert: (blackKnight renderPieceOn: squareTest) equals: 'm'.
	
]

{ #category : 'rendering' }
MyBlackChessSquareTest >> testBlackRenderPawn [

	| squareTest whitePawn blackPawn |
	squareTest := MyBlackChessSquare new.
	
	"Test pion blanc sur case blanche"
	whitePawn := MyPawn white. 
	self assert: (whitePawn renderPieceOn: squareTest) equals: 'p'.
	
	"Test pion noir sur case blanche"
	blackPawn := MyPawn black. 
	self assert: (blackPawn renderPieceOn: squareTest) equals: 'o'.
	
]

{ #category : 'rendering' }
MyBlackChessSquareTest >> testBlackRenderQueen [

	| squareTest whiteQueen blackQueen |
	squareTest := MyBlackChessSquare new.
	
	"Test reine blanche sur case blanche"
	whiteQueen := MyQueen white. 
	self assert: (whiteQueen renderPieceOn: squareTest) equals: 'q'.
	
	"Test pion noir sur case blanche"
	blackQueen := MyQueen black. 
	self assert: (blackQueen renderPieceOn: squareTest) equals: 'w'.
	
]

{ #category : 'rendering' }
MyBlackChessSquareTest >> testBlackRenderRook [ 

	| squareTest whiteRook blackRook |
	squareTest := MyBlackChessSquare new.
	
	"Test tour blanche sur case blanche"
	whiteRook := MyRook white. 
	self assert: (whiteRook renderPieceOn: squareTest) equals: 'r'.
	
	"Test tour noir sur case blanche"
	blackRook := MyRook black. 
	self assert: (blackRook renderPieceOn: squareTest) equals: 't'.

]
