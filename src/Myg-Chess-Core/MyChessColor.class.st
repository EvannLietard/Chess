Class {
	#name : 'MyChessColor',
	#superclass : 'Object',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'accessing' }
MyChessColor >> color [ 

	self subclassResponsibility 
]

{ #category : 'rendering' }
MyChessColor >> renderBishop: aSquare [ 
	
	self subclassResponsibility 
]

{ #category : 'rendering' }
MyChessColor >> renderKing: aSquare [ 
	
	self subclassResponsibility 
]

{ #category : 'rendering' }
MyChessColor >> renderKnight: aSquare [ 
	
	self subclassResponsibility 
]

{ #category : 'rendering' }
MyChessColor >> renderPawn: aSquare [ 
	
	self subclassResponsibility 
]

{ #category : 'rendering' }
MyChessColor >> renderQueen: aSquare [ 
	
	self subclassResponsibility 
]

{ #category : 'rendering' }
MyChessColor >> renderRook: aSquare [ 
	
	self subclassResponsibility 
]
