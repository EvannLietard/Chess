Class {
	#name : 'MyPawnTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyPawnTest >> testPawnIsBlack [
    | blackPawn |
    
    blackPawn := MyPawn black .
	self assert: blackPawn isBlack .
]

{ #category : 'tests' }
MyPawnTest >> testPawnIsWhite [
    | whitePawn |
    
    whitePawn := MyPawn white .
	self assert: whitePawn isWhite.
]

{ #category : 'tests' }
MyPawnTest >> testReplacePiece [
    | board oldPiece newPiece square |
    
    board := MyChessBoard empty.
	 board initializeSquares. 
    oldPiece := MyPawn black.
    newPiece := MyQueen black.
	 square := board at:'e4'.
	 self assert: (square hasPiece ) equals: false.
    board  at: 'e4' put: oldPiece.
    self assert: (square hasPiece ) equals: true.
	 oldPiece replacePiece: newPiece.
    self assert: square contents equals: newPiece .

]
