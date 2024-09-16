Class {
	#name : 'MyPawnTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyPawnTest >> testCheckPromotion [
    | pawn board |
    board := MyChessBoard empty.
    pawn := MyPawn white.
    board at: 'e7'  put: pawn.
    pawn checkPromotion.
    self assert: (pawn isKindOf: MyQueen).





]

{ #category : 'tests' }
MyPawnTest >> testReplacePiece [
    | board oldPiece newPiece oldPosition newPosition |
    
    board := MyChessBoard empty.
    oldPiece := MyPawn black.
    newPiece := MyQueen black.
    
    board  at: 'e4' put: oldPiece.
    self assert: (board at: 'e4') = oldPiece.
    
    board replacePiece: oldPiece with: newPiece.
    self assert: (board at: 'e4') = newPiece.

]
