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
    | window pane pieces |

    window := BlSpace new.
    pane := ToPane horizontal.
    
    pieces := {
        {'reine'. MyQueen}.
        {'tour'. MyRook}.
        {'fou'. MyBishop}.
        {'chevalier'. MyKnight}
    }.
    
    pieces do: [ :each | 
        | button pieceName pieceClass |
        pieceName := each first.
        pieceClass := each second.
        button := ToButton new.
        button labelText: pieceName.
        button whenClickedDo: [ self replacePiece: pieceClass new. window close. ].
        pane addChild: button.
    ].
    
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
