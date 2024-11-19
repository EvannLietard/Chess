Class {
	#name : 'MyPawn',
	#superclass : 'MyPiece',
	#instVars : [
		'window'
	],
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'promote' }
MyPawn >> canPromote [

	^ (self isWhite and: [ self square up name endsWith: '8' ]) xor: [
		  self isBlack and: [ self square down name endsWith: '1' ] ]
]

{ #category : 'accessing' }
MyPawn >> id [

	^ 'P'
]

{ #category : 'rendering' }
MyPawn >> renderPieceOn: aSquare [ 
	
	^ aSquare renderPawn: self
]

{ #category : 'promote' }
MyPawn >> replacePiece: aNewPiece [

	aNewPiece color: self color.
	self board at: self square name put: aNewPiece
]

{ #category : 'rendering' }
MyPawn >> targetSquaresLegal: aBoolean [

	^ (self isWhite
		   ifTrue: [ { square up } ]
		   ifFalse: [ { square down } ]) select: [ :s |
		  s notNil and: [
			  s hasPiece not or: [ s contents color ~= color ] ] ]
]
