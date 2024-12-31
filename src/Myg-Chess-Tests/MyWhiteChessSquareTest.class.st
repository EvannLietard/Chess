Class {
	#name : 'MyWhiteChessSquareTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'foreground' }
MyWhiteChessSquareTest >> testForegroundWhiteSquare [

    | whiteSquare board |

    board := MyChessBoard empty.
    board blackColor: Color pink.
    board whiteColor: Color orange.

    "Test case blanche"
    whiteSquare := MyWhiteChessSquare new.
    whiteSquare board: board.
    self assert: whiteSquare foreground equals: Color orange.

]

{ #category : 'tests' }
MyWhiteChessSquareTest >> testWhiteContents [

    | whiteSquareTest whitePiece blackPiece boardTest |

    boardTest := MyChessBoard empty.
    boardTest whiteColor: Color white.
    boardTest blackColor: Color black.

    whiteSquareTest := MyWhiteChessSquare new.
    whiteSquareTest board: boardTest. 

    whitePiece := MyBishop white. 
    blackPiece := MyBishop black. 

    whiteSquareTest contents: whitePiece.
    self assert: (whiteSquareTest contents) equals: whitePiece.


]

{ #category : 'tests' }
MyWhiteChessSquareTest >> testWhiteContentsWithNil [

	| whiteSquareTest boardTest expectedText |
	
	boardTest := MyChessBoard empty.
	boardTest whiteColor: Color white.
	boardTest blackColor: Color black.

	whiteSquareTest := MyWhiteChessSquare new.
	whiteSquareTest board: boardTest.
	
	whiteSquareTest contents: nil. "Pas de pièce sur la case"
	self assert: whiteSquareTest contents isNil. 

	"Vérification que le texte affiché est 'z' pour une case blanche sans pièce"
	expectedText := whiteSquareTest contents
		                ifNil: ['z']
		                ifNotNil: [ whiteSquareTest contents renderPieceOn: self ].
	self assert: expectedText equals: 'z'.

	
]

{ #category : 'foreground' }
MyWhiteChessSquareTest >> testWhiteForeground [

    | blackSquare board |

    board := MyChessBoard empty.
    board blackColor: Color pink.
    board whiteColor: Color orange.

    "Test case noire"
    blackSquare := MyWhiteChessSquare new.
    blackSquare board: board.
    self assert: blackSquare foreground equals: Color orange.

]

{ #category : 'tests' }
MyWhiteChessSquareTest >> testWhiteNegativeColor [
    
    self assert: MyWhiteChessSquare new negatedColor equals: Color black.

]

{ #category : 'rendering' }
MyWhiteChessSquareTest >> testWhiteRenderBishop [ 

	| squareTest whiteBishop blackBishop |
	squareTest := MyWhiteChessSquare new.
	
	"Test fou blanc sur case blanche"
	whiteBishop := MyBishop white. 
	self assert: (whiteBishop renderPieceOn: squareTest ) equals: 'B'.
	
	"Test fou noir sur case blanche"
	blackBishop := MyBishop black. 
	self assert: (blackBishop renderPieceOn: squareTest ) equals: 'V'.
	

	
	
]

{ #category : 'rendering' }
MyWhiteChessSquareTest >> testWhiteRenderKing [

	| squareTest whiteKing blackKing |
	squareTest := MyWhiteChessSquare new.
	
	"Test roi blanc sur case blanche"
	whiteKing := MyKing white. 
	self assert: (whiteKing renderPieceOn: squareTest) equals: 'K'.
	
	"Test roi noir sur case blanche"
	blackKing := MyKing black. 
	self assert: (blackKing renderPieceOn: squareTest) equals: 'L'.

]

{ #category : 'rendering' }
MyWhiteChessSquareTest >> testWhiteRenderKnight [

	| squareTest whiteKnight blackKnight |
	squareTest := MyWhiteChessSquare new.
	
	"Test cavalier blanc sur case blanche"
	whiteKnight := MyKnight white. 
	self assert: (whiteKnight renderPieceOn: squareTest) equals: 'N'.
	
	"Test cavalier noir sur case blanche"
	blackKnight := MyKnight black. 
	self assert: (blackKnight renderPieceOn: squareTest) equals: 'M'.
	
]

{ #category : 'rendering' }
MyWhiteChessSquareTest >> testWhiteRenderPawn [

	| squareTest whitePawn blackPawn |
	squareTest := MyWhiteChessSquare new.
	
	"Test pion blanc sur case blanche"
	whitePawn := MyPawn white. 
	self assert: (whitePawn renderPieceOn: squareTest) equals: 'P'.
	
	"Test pion noir sur case blanche"
	blackPawn := MyPawn black. 
	self assert: (blackPawn renderPieceOn: squareTest) equals: 'O'.
	
]

{ #category : 'rendering' }
MyWhiteChessSquareTest >> testWhiteRenderQueen [

	| squareTest whiteQueen blackQueen |
	squareTest := MyWhiteChessSquare new.
	
	"Test reine blanche sur case blanche"
	whiteQueen := MyQueen white. 
	self assert: (whiteQueen renderPieceOn: squareTest) equals: 'Q'.
	
	"Test pion noir sur case blanche"
	blackQueen := MyQueen black. 
	self assert: (blackQueen renderPieceOn: squareTest) equals: 'W'.
	
]

{ #category : 'rendering' }
MyWhiteChessSquareTest >> testWhiteRenderRook [ 

	| squareTest whiteRook blackRook |
	squareTest := MyWhiteChessSquare new.
	
	"Test tour blanche sur case blanche"
	whiteRook := MyRook white. 
	self assert: (whiteRook renderPieceOn: squareTest ) equals: 'R'.
	
	"Test tour noir sur case blanche"
	blackRook := MyRook black. 
	self assert: (blackRook renderPieceOn: squareTest ) equals: 'T'.

]
