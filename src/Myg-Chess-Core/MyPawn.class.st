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

{ #category : 'promote' }
MyPawn >> createBishopButton [

	| button |
	button := ToButton new.
	button labelText: 'fou'.
	button whenClickedDo: [
		self replacePiece: MyBishop new.
		window close ].
	^ button
]

{ #category : 'promote' }
MyPawn >> createKnightButton [

	| button |
	button := ToButton new.
	button labelText: 'chevalier'.
	button whenClickedDo: [
		self replacePiece: MyKnight new.
		window close ].
	^ button
]

{ #category : 'promote' }
MyPawn >> createQueenButton [

	| button |
	button := ToButton new.
	button labelText: 'reine'.
	button whenClickedDo: [
		self replacePiece: MyQueen new.
		window close ].
	^ button
]

{ #category : 'promote' }
MyPawn >> createRookButton [

	| button |
	button := ToButton new.
	button labelText: 'tour'.
	button whenClickedDo: [
		self replacePiece: MyRook new.
		window close ].
	^ button
]

{ #category : 'accessing' }
MyPawn >> id [

	^ 'P'
]

{ #category : 'initialization' }
MyPawn >> initializeNewWindow [
    window := BlSpace new.
]

{ #category : 'promote' }
MyPawn >> promotionWindow [
    
    | pane |
    self initializeNewWindow .
    pane := ToPane horizontal.
    
    pane addChild: self createQueenButton.
    pane addChild: self createRookButton.
    pane addChild: self createBishopButton.
    pane addChild: self createKnightButton.
    
    window root addChild: pane.
    window show.
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

{ #category : 'accessing' }
MyPawn >> window [
    ^ window
]
