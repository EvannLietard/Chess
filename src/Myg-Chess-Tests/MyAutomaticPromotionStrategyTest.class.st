Class {
	#name : 'MyAutomaticPromotionStrategyTest',
	#superclass : 'TestCase',
	#instVars : [
		'pawn',
		'whitePlayer',
		'strategy',
		'board'
	],
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'running' }
MyAutomaticPromotionStrategyTest >> setUp [
	super setUp.
	whitePlayer := MyPlayer new white game: self.
	whitePlayer setPromotionStrategy: MyAutomaticPromotionStrategy new.
	strategy := whitePlayer promotionStrategy.
	board := MyChessBoard empty.
	board initializeSquares.
	pawn := MyPawn black.
	board at: 'e1' put: pawn
]

{ #category : 'tests' }
MyAutomaticPromotionStrategyTest >> testPromotePawn [
    | newPiece possiblePieces |
    self assert: pawn class equals: MyPawn.
    strategy promotePawn: pawn.
    newPiece := pawn square contents.
    possiblePieces := {MyQueen. MyRook. MyBishop. MyKnight}.
    self assert: (possiblePieces includes: newPiece class).
    self assert: (newPiece isKindOf: MyPiece).
]
