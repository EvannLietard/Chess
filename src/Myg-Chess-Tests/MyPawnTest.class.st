Class {
	#name : 'MyPawnTest',
	#superclass : 'TestCase',
	#instVars : [
		'pawn',
		'board'
	],
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'running' }
MyPawnTest >> setUp [

	
	super setUp.
	board := MyChessBoard empty.
	board initializeSquares. 
	pawn := MyPawn black.
	board at: 'e1' put: pawn.
]

{ #category : 'tests' }
MyPawnTest >> testBlackPawnShouldNotPromote [
    | blackPawn promotedBlack |
    
    blackPawn := MyPawn black.
    board at: 'e3' put: blackPawn.    
    promotedBlack := blackPawn canPromote.
    self deny: promotedBlack.


]

{ #category : 'tests' }
MyPawnTest >> testBlackPawnShouldPromote [
    | blackPawn promotedBlack |

    blackPawn := MyPawn black .
    board at: 'e1' put: blackPawn.  
    promotedBlack := blackPawn canPromote.
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
    |  oldPiece newPiece square |
    
    oldPiece := MyPawn black.
    newPiece := MyQueen black.
	 square := board at:'e4'.
    board  at: 'e4' put: oldPiece.
	 oldPiece replacePiece: newPiece.
    self assert: square contents equals: newPiece .

]

{ #category : 'tests' }
MyPawnTest >> testWhitePawnShouldNotPromote [
    | whitePawn  promotedWhite |
     
    whitePawn := MyPawn white.
    board at: 'e2' put: whitePawn.    
    promotedWhite := whitePawn canPromote.
    self deny: promotedWhite.


]

{ #category : 'tests' }
MyPawnTest >> testWhitePawnShouldPromote [

	| whitePawn  promotedWhite |
	whitePawn := MyPawn white.
	board at: 'e8' put: whitePawn.
	promotedWhite := whitePawn canPromote.
	self assert: promotedWhite 
]
