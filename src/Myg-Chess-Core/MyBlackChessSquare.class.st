Class {
	#name : 'MyBlackChessSquare',
	#superclass : 'MyChessSquare',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'as yet unclassified' }
MyBlackChessSquare >> emptySquareRepresentation [

	^ 'x'
]

{ #category : 'accessing' }
MyBlackChessSquare >> foreground [
			
	^ board blackColor
]

{ #category : 'as yet unclassified' }
MyBlackChessSquare >> negatedColor [

	^ Color white
]

{ #category : 'rendering' }
MyBlackChessSquare >> renderBlackBishop: aPiece [

	^ 'v'
]

{ #category : 'rendering' }
MyBlackChessSquare >> renderBlackKing: aPiece [

	^ 'l'
]

{ #category : 'rendering' }
MyBlackChessSquare >> renderBlackKnight: aPiece [

	^ 'm'
]

{ #category : 'rendering' }
MyBlackChessSquare >> renderBlackPawn: aPiece [

	^ 'o'
]

{ #category : 'rendering' }
MyBlackChessSquare >> renderBlackQueen: aPiece [

	^ 'w'
]

{ #category : 'rendering' }
MyBlackChessSquare >> renderBlackRook: aPiece [

	^ 't'
]

{ #category : 'rendering' }
MyBlackChessSquare >> renderWhiteBishop: aPiece [

	^ 'b'
]

{ #category : 'rendering' }
MyBlackChessSquare >> renderWhiteKing: aPiece [

	^ 'k'
]

{ #category : 'rendering' }
MyBlackChessSquare >> renderWhiteKnight: aPiece [

	^ 'n'
]

{ #category : 'rendering' }
MyBlackChessSquare >> renderWhitePawn: aPiece [

	^ 'p'
]

{ #category : 'rendering' }
MyBlackChessSquare >> renderWhiteQueen: aPiece [

	^ 'q'
]

{ #category : 'rendering' }
MyBlackChessSquare >> renderWhiteRook: aPiece [

	^ 'r'
]
