Class {
	#name : 'MyChessWhiteColor',
	#superclass : 'MyChessColor',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'accessing' }
MyChessWhiteColor >> color [ 

	^ Color white
]

{ #category : 'arithmetic' }
MyChessWhiteColor >> negated [

	^ Color black
]

{ #category : 'rendering' }
MyChessWhiteColor >> renderBishop: aSquare [ 

	^ aSquare renderWhiteBishop
]

{ #category : 'rendering' }
MyChessWhiteColor >> renderKing: aSquare [ 

	^ aSquare renderWhiteKing
]

{ #category : 'rendering' }
MyChessWhiteColor >> renderKnight: aSquare [ 

	^ aSquare renderWhiteKnight
]

{ #category : 'rendering' }
MyChessWhiteColor >> renderPawn: aSquare [ 

	^ aSquare renderWhitePawn
]

{ #category : 'rendering' }
MyChessWhiteColor >> renderQueen: aSquare [ 

	^ aSquare renderWhiteQueen
]

{ #category : 'rendering' }
MyChessWhiteColor >> renderRook: aSquare [ 

	^ aSquare renderWhiteRook
]
