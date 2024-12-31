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

	^ (self isWhite and: [ self square name endsWith: '8' ]) xor: [
		  self isBlack and: [ self square name endsWith: '1' ] ]
]

{ #category : 'accessing' }
MyPawn >> id [

	^ 'P'
]

{ #category : 'rendering' }
MyPawn >> renderPieceOn: aSquare [ 
	
	^ self myChessColor renderPawn: aSquare
]

{ #category : 'promote' }
MyPawn >> replacePiece: aNewPiece [

	aNewPiece myChessColor: myChessColor.
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
