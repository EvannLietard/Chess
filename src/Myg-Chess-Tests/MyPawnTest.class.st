Class {
	#name : 'MyPawnTest',
	#superclass : 'TestCase',
	#instVars : [
		'pawn'
	],
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'running' }
MyPawnTest >> setUp [

	super setUp.
	pawn := MyPawn new
]

{ #category : 'tests' }
MyPawnTest >> testBlackPawnShouldNotPromote [
    | blackPawn board promotedBlack |
    
    board := MyChessBoard empty.
	 board initializeSquares. 
    blackPawn := MyPawn black.
    board at: 'e3' put: blackPawn.    
    promotedBlack := blackPawn canPromote.
    self deny: promotedBlack.


]

{ #category : 'tests' }
MyPawnTest >> testBlackPawnShouldPromote [
    | blackPawn board promotedBlack |
    
    board := MyChessBoard empty.
	 board initializeSquares. 
    blackPawn := MyPawn black .
    board at: 'e2' put: blackPawn.  
    promotedBlack := blackPawn canPromote.
    self assert: promotedBlack.

]

{ #category : 'tests' }
MyPawnTest >> testCreateBishopButton [

	| button |
	button := pawn createBishopButton.
	self assert: button notNil.
	self assert: (button labelText) equals: 'fou'.

]

{ #category : 'tests' }
MyPawnTest >> testCreateKnightButton [

	| button |
	button := pawn createKnightButton.
	self assert: button notNil.
	self assert: (button labelText) equals: 'chevalier'.
]

{ #category : 'tests' }
MyPawnTest >> testCreateQueenButton [

	| button |
	button := pawn createQueenButton.
	self assert: button notNil.
	self assert: (button labelText) equals: 'reine'.
	
]

{ #category : 'tests' }
MyPawnTest >> testCreateRookButton [

	| button |
	button := pawn createRookButton.
	self assert: button notNil.
	self assert: (button labelText) equals: 'tour'.
	
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
MyPawnTest >> testPromotionWindowCreateTheWindow [
    self assert: pawn window isNil.
    pawn promotionWindow.
    self assert: pawn window notNil.

   

]

{ #category : 'tests' }
MyPawnTest >> testPromotionWindowNumberOfButton [

	pawn promotionWindow.
	self assert: (pawn window root firstChild children size) equals: 4.
]

{ #category : 'tests' }
MyPawnTest >> testPromotionWindowPaneSize [

	pawn promotionWindow.
	self assert: (pawn window root children size) equals: 1.
]

{ #category : 'tests' }
MyPawnTest >> testReplacePiece [
    | board oldPiece newPiece square |
    
    board := MyChessBoard empty.
	 board initializeSquares. 
    oldPiece := MyPawn black.
    newPiece := MyQueen black.
	 square := board at:'e4'.
    board  at: 'e4' put: oldPiece.
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
    promotedWhite := whitePawn canPromote.
    self deny: promotedWhite.


]

{ #category : 'tests' }
MyPawnTest >> testWhitePawnShouldPromote [

	| whitePawn board promotedWhite |
	board := MyChessBoard empty.
	board initializeSquares. 
	whitePawn := MyPawn white.
	board at: 'e7' put: whitePawn.
	promotedWhite := whitePawn canPromote.
	self assert: promotedWhite 
]
