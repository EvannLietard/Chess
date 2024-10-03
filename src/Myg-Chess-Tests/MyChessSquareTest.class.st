Class {
	#name : 'MyChessSquareTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'foreground' }
MyChessSquareTest >> testForegroundBlackSquare [

    | blackSquare board |

    board := MyChessBoard empty.
    board blackColor: Color pink.
    board whiteColor: Color orange.

    "Test case noire"
    blackSquare := MyChessSquare new.
    blackSquare color: Color black.
    blackSquare board: board.
    self assert: blackSquare foreground equals: Color pink.

]

{ #category : 'foreground' }
MyChessSquareTest >> testForegroundWhiteSquare [

    | whiteSquare board |

    board := MyChessBoard empty.
    board blackColor: Color pink.
    board whiteColor: Color orange.

    "Test case blanche"
    whiteSquare := MyChessSquare new.
    whiteSquare color: Color white.
    whiteSquare board: board.
    self assert: whiteSquare foreground equals: Color orange.

]

{ #category : 'tests' }
MyChessSquareTest >> testPlus [ 
	
	| squareTest result boardTest |
	
	boardTest := MyChessBoard empty. 
	squareTest := MyChessSquare new. 
	squareTest color: Color white.
	squareTest name: 'e4'.
   squareTest board: boardTest. 

	result := squareTest + (1 @ 1). 
	self assert: result name equals: 'f5'. 
	
	result := squareTest + (-1 @ -1).
   self assert: result name equals: 'd3'.
]

{ #category : 'rendering' }
MyChessSquareTest >> testRenderBishop [ 

	| squareTest whiteBishop blackBishop |
	squareTest := MyChessSquare new.
	
	"Test fou blanc sur case blanche"
	whiteBishop := MyBishop white. 
	squareTest color: Color white.
	self assert: (squareTest renderBishop: whiteBishop) equals: 'B'.
	" test identique mais avec renderPieceOn qui décide de la méthode appelée en fonction de la pièce"
	self assert: (whiteBishop renderPieceOn: squareTest ) equals: 'B'.
	
	"Test fou blanc sur case noire"
	squareTest color: Color black.
	self assert: (squareTest renderBishop: whiteBishop) equals: 'b'.
	
	"Test fou noir sur case blanche"
	blackBishop := MyBishop black. 
	squareTest color: Color white.
	self assert: (squareTest renderBishop: blackBishop) equals: 'V'.
	
	"Test fou noir sur case noire"
	squareTest color: Color black.
	self assert: (squareTest renderBishop: blackBishop) equals: 'v'.

	
	
]

{ #category : 'rendering' }
MyChessSquareTest >> testRenderKing [

	| squareTest whiteKing blackKing |
	squareTest := MyChessSquare new.
	
	"Test roi blanc sur case blanche"
	whiteKing := MyKing white. 
	squareTest color: Color white.
	self assert: (squareTest renderKing: whiteKing) equals: 'K'.
	
	"Test roi blanc sur case noire"
	squareTest color: Color black.
	self assert: (squareTest renderKing: whiteKing) equals: 'k'.
	
	"Test roi noir sur case blanche"
	blackKing := MyBishop black. 
	squareTest color: Color white.
	self assert: (squareTest renderKing: blackKing) equals: 'L'.
	
	"Test roi noir sur case noire"
	squareTest color: Color black.
	self assert: (squareTest renderKing: blackKing) equals: 'l'.
]

{ #category : 'rendering' }
MyChessSquareTest >> testRenderKnight [

	| squareTest whiteKnight blackKnight |
	squareTest := MyChessSquare new.
	
	"Test cavalier blanc sur case blanche"
	whiteKnight := MyKnight white. 
	squareTest color: Color white.
	self assert: (squareTest renderKnight: whiteKnight) equals: 'N'.
	
	"Test cavalier blanc sur case noire"
	squareTest color: Color black.
	self assert: (squareTest renderKnight: whiteKnight) equals: 'n'.
	
	"Test cavalier noir sur case blanche"
	blackKnight := MyKnight black. 
	squareTest color: Color white.
	self assert: (squareTest renderKnight: blackKnight) equals: 'M'.
	
	"Test cavalier noir sur case noire"
	squareTest color: Color black.
	self assert: (squareTest renderKnight: blackKnight) equals: 'm'.
]

{ #category : 'rendering' }
MyChessSquareTest >> testRenderPawn [

	| squareTest whitePawn blackPawn |
	squareTest := MyChessSquare new.
	
	"Test pion blanc sur case blanche"
	whitePawn := MyPawn white. 
	squareTest color: Color white.
	self assert: (squareTest renderPawn: whitePawn) equals: 'P'.
	
	"Test pion blanc sur case noire"
	squareTest color: Color black.
	self assert: (squareTest renderPawn: whitePawn) equals: 'p'.
	
	"Test pion noir sur case blanche"
	blackPawn := MyPawn black. 
	squareTest color: Color white.
	self assert: (squareTest renderPawn: blackPawn) equals: 'O'.
	
	"Test pion noir sur case noire"
	squareTest color: Color black.
	self assert: (squareTest renderPawn: blackPawn) equals: 'o'.
]

{ #category : 'rendering' }
MyChessSquareTest >> testRenderQueen [

	| squareTest whiteQueen blackQueen |
	squareTest := MyChessSquare new.
	
	"Test reine blanche sur case blanche"
	whiteQueen := MyQueen white. 
	squareTest color: Color white.
	self assert: (squareTest renderQueen: whiteQueen) equals: 'Q'.
	
	"Test reine blanche sur case noire"
	squareTest color: Color black.
	self assert: (squareTest renderQueen: whiteQueen) equals: 'q'.
	
	"Test pion noir sur case blanche"
	blackQueen := MyQueen black. 
	squareTest color: Color white.
	self assert: (squareTest renderQueen: blackQueen) equals: 'W'.
	
	"Test pion noir sur case noire"
	squareTest color: Color black.
	self assert: (squareTest renderQueen: blackQueen) equals: 'w'.
]

{ #category : 'rendering' }
MyChessSquareTest >> testRenderRook [ 

	| squareTest whiteRook blackRook |
	squareTest := MyChessSquare new.
	
	"Test tour blanche sur case blanche"
	whiteRook := MyRook white. 
	squareTest color: Color white.
	self assert: (squareTest renderRook: whiteRook) equals: 'R'.
	
	"Test tour blanche sur case noire"
	squareTest color: Color black.
	self assert: (squareTest renderRook: whiteRook) equals: 'r'.
	
	"Test tour noir sur case blanche"
	blackRook := MyRook black. 
	squareTest color: Color white.
	self assert: (squareTest renderRook: blackRook) equals: 'T'.
	
	"Test tour noir sur case noire"
	squareTest color: Color black.
	self assert: (squareTest renderRook: blackRook) equals: 't'.

]
