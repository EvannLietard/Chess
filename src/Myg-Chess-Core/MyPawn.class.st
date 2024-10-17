Class {
	#name : 'MyPawn',
	#superclass : 'MyPiece',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'asserting' }
MyPawn >> canPromote [
	"Return True if the pawn can promot false if not"
    ^(self isWhite and: [self square up name endsWith: '8'])
        xor: [self isBlack and: [self square down name endsWith: '1']].
]

{ #category : 'accessing' }
MyPawn >> id [

	^ 'P'
]

{ #category : 'as yet unclassified' }
MyPawn >> promote [ 
 ^ 2
]

{ #category : 'as yet unclassified' }
MyPawn >> promotionWindow [

	| window reine tour fou chevalier pane |
	window := BlSpace new.
	pane:= ToPane horizontal .
	reine := ToButton new.
	reine labelText: 'reine'.
	tour := ToButton new.
	tour labelText: 'tour'.
	fou := ToButton new.
	fou labelText: 'fou'.
	chevalier := ToButton new.
	chevalier labelText: 'chevalier'.
	chevalier whenClickedDo: [ self replacePiece: MyKnight new. window close. ].
	reine whenClickedDo: [ self replacePiece: MyQueen new. window close.].
	fou whenClickedDo: [ self replacePiece: MyBishop new. window close.].
	tour whenClickedDo: [ self replacePiece: MyRook new. window close. ].
	pane addChild: reine .
	pane addChild: chevalier .
	pane addChild: fou .
	pane addChild: tour .
	window root addChild: pane.
	window show
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
