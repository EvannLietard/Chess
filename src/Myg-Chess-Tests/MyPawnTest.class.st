Class {
	#name : 'MyPawnTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyPawnTest >> testReplacePiece [
    | board oldPiece newPiece square |
    
    board := MyChessBoard empty.
	 board initializeSquares. 
    oldPiece := MyPawn black.
    newPiece := MyQueen black.
	 square := board at:'e4'.
    board  at: 'e4' put: oldPiece.
    self assert: (square hasPiece ) equals: true.
	 oldPiece replacePiece: newPiece.
    self assert: square contents equals: newPiece .

]
