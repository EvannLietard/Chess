Class {
	#name : 'MyChessBlackColor',
	#superclass : 'MyChessColor',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'accessing' }
MyChessBlackColor >> color [ 

 ^ Color black  
]

{ #category : 'rendering' }
MyChessBlackColor >> renderBishop: aSquare [ 

	^ aSquare renderBlackBishop
]

{ #category : 'rendering' }
MyChessBlackColor >> renderKing: aSquare [ 

	^ aSquare renderBlackKing
]

{ #category : 'rendering' }
MyChessBlackColor >> renderKnight: aSquare [ 

	^ aSquare renderBlackKnight
]

{ #category : 'rendering' }
MyChessBlackColor >> renderPawn: aSquare [ 

	^ aSquare renderBlackPawn
]

{ #category : 'rendering' }
MyChessBlackColor >> renderQueen: aSquare [ 

	^ aSquare renderBlackQueen
]

{ #category : 'rendering' }
MyChessBlackColor >> renderRook: aSquare [ 

	^ aSquare renderBlackRook
]
