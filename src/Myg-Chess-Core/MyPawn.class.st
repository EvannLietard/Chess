Class {
	#name : 'MyPawn',
	#superclass : 'MyPiece',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'asserting' }
MyPawn >> canPromote [
	"Return True if the pawn can promot false if not"
    ^(self isWhite and: [self square name endsWith: '8'])
        xor: [self isBlack and: [self square name endsWith: '1']].
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
|window reine tour fou chevalier |
window := BlSpace new.
reine:= ToButton new.
reine labelText: 'reine'.
tour:=ToButton new.
tour labelText: 'tour'.
fou:=ToButton new.
fou labelText: 'fou'.
chevalier:=ToButton new.
chevalier labelText: 'chevalier'.
window root addChild: reine.
window root addChild: tour.
window root addChild: fou.
window root addChild: chevalier. 
window show.
]

{ #category : 'rendering' }
MyPawn >> renderPieceOn: aSquare [ 
	
	^ aSquare renderPawn: self
]

{ #category : 'promote' }
MyPawn >> replacePiece: aNewPiece [ 
	self board at: self square name put: aNewPiece .
]

{ #category : 'rendering' }
MyPawn >> targetSquaresLegal: aBoolean [

	^ (self isWhite
		   ifTrue: [ { square up } ]
		   ifFalse: [ { square down } ]) select: [ :s |
		  s notNil and: [
			  s hasPiece not or: [ s contents color ~= color ] ] ]
]
