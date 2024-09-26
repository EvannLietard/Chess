Class {
	#name : 'MyPawnTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyPawnTest >> testBlackPawnShouldNotPromote [
    | blackPawn board promotedBlack |
    
    board := MyChessBoard empty.
	 board initializeSquares. 
    blackPawn := MyPawn black.
    board at: 'e2' put: blackPawn.    
    promotedBlack := blackPawn shouldPromote.
    self deny: promotedBlack.


]

{ #category : 'tests' }
MyPawnTest >> testBlackPawnShouldPromote [
    | blackPawn board promotedBlack |
    
    board := MyChessBoard empty.
	 board initializeSquares. 
    blackPawn := MyPawn black .
    board at: 'e1' put: blackPawn.  
    promotedBlack := blackPawn shouldPromote.
    self assert: promotedBlack.

]

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

{ #category : 'tests' }
MyPawnTest >> testWhitePawnShouldNotPromote [
    | whitePawn board promotedWhite |
    
    board := MyChessBoard empty.
	 board initializeSquares. 
    whitePawn := MyPawn white.
    board at: 'e2' put: whitePawn.    
    promotedWhite := whitePawn shouldPromote.
    self deny: promotedWhite.


]

{ #category : 'tests' }
MyPawnTest >> testWhitePawnShouldPromote [

	| whitePawn board promotedWhite |
	board := MyChessBoard empty.
	board initializeSquares. 
	whitePawn := MyPawn white.
	board at: 'e8' put: whitePawn.
	promotedWhite := whitePawn shouldPromote.
	self assert: promotedWhite 
]
