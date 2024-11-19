Class {
	#name : 'MyAutomaticPromotionStrategy',
	#superclass : 'MyPromotionStrategy',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'as yet unclassified' }
MyAutomaticPromotionStrategy >> promotePawn: aPawn [ [
    | possiblePieces randomChoice |
    possiblePieces := { MyQueen. MyRook. MyBishop. MyKnight }.
    randomChoice := possiblePieces at: (1 to: possiblePieces size) atRandom.
    aPawn replacePiece: randomChoice new.
]
]
