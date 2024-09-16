Class {
	#name : 'MyPawn',
	#superclass : 'MyPiece',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'promotion' }
MyPawn >> checkPromotion [ [
    "Vérifie si le pion a atteint la dernière rangée"
    | shouldPromote |
    
    shouldPromote := (self isWhite and: [self square name endsWith: '8'])
        or: [self isBlack and: [self square name endsWith: '1']].

    "shouldPromote ifTrue: [ self promote ]."
]





]

{ #category : 'accessing' }
MyPawn >> id [

	^ 'P'
]

{ #category : 'rendering' }
MyPawn >> renderPieceOn: aSquare [ 
	
	^ aSquare renderPawn: self
]

{ #category : 'promotion' }
MyPawn >> replacePiece: oldPiece with: newPiece [
    "Remplace une pièce par une autre sur l'échiquier"
    self removePiece: oldPiece.
    self at: oldPiece square name put: newPiece.

]

{ #category : 'rendering' }
MyPawn >> targetSquaresLegal: aBoolean [

	^ (self isWhite
		   ifTrue: [ { square up } ]
		   ifFalse: [ { square down } ]) select: [ :s |
		  s notNil and: [
			  s hasPiece not or: [ s contents color ~= color ] ] ]
]
