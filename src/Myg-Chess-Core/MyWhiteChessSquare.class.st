Class {
	#name : 'MyWhiteChessSquare',
	#superclass : 'MyChessSquare',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'as yet unclassified' }
MyWhiteChessSquare >> emptySquareRepresentation [

	^ 'z'
]

{ #category : 'accessing' }
MyWhiteChessSquare >> foreground [
			
	^ board whiteColor
]

{ #category : 'as yet unclassified' }
MyWhiteChessSquare >> negatedColor [

	^ Color black
]

{ #category : 'rendering' }
MyWhiteChessSquare >> renderBlackBishop: aPiece [

	^ 'V'
]

{ #category : 'rendering' }
MyWhiteChessSquare >> renderBlackKing: aPiece [

	^ 'L'
]

{ #category : 'rendering' }
MyWhiteChessSquare >> renderBlackKnight: aPiece [

	^ 'M'
]

{ #category : 'rendering' }
MyWhiteChessSquare >> renderBlackPawn: aPiece [

	^ 'O'
]

{ #category : 'rendering' }
MyWhiteChessSquare >> renderBlackQueen: aPiece [

	^ 'W'
]

{ #category : 'rendering' }
MyWhiteChessSquare >> renderBlackRook: aPiece [

	^ 'T'
]

{ #category : 'rendering' }
MyWhiteChessSquare >> renderWhiteBishop: aPiece [

	^ 'B'
]

{ #category : 'rendering' }
MyWhiteChessSquare >> renderWhiteKing: aPiece [

	^ 'K'
]

{ #category : 'rendering' }
MyWhiteChessSquare >> renderWhiteKnight: aPiece [

	^ 'N'
]

{ #category : 'rendering' }
MyWhiteChessSquare >> renderWhitePawn: aPiece [

	^ 'P'
]

{ #category : 'rendering' }
MyWhiteChessSquare >> renderWhiteQueen: aPiece [

	^ 'Q'
]

{ #category : 'rendering' }
MyWhiteChessSquare >> renderWhiteRook: aPiece [

	^ 'R'
]
