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
MyPawnTest >> testCreateBishopButtonClick [
	| button |
	pawn initializeNewWindow.
	button := pawn createBishopButton.
	pawn window root addChild: button.
	button dispatchEvent: BlMouseUpEvent primary asClickEvent.
	self assert: (pawn square contents class) equals: MyBishop.

]

{ #category : 'tests' }
MyPawnTest >> testCreateKnightButton [

	| button |
	button := pawn createKnightButton.
	self assert: button notNil.
	self assert: (button labelText) equals: 'chevalier'.
]

{ #category : 'tests' }
MyPawnTest >> testCreateKnightButtonClick [

	| button |
	pawn initializeNewWindow.
	button := pawn createKnightButton.
	pawn window root addChild: button.
	button dispatchEvent: BlMouseUpEvent primary asClickEvent.
	self assert: (pawn square contents class) equals: MyKnight.
]

{ #category : 'tests' }
MyPawnTest >> testCreateQueenButton [

	| button |
	button := pawn createQueenButton.
	self assert: button notNil.
	self assert: (button labelText) equals: 'reine'.
	
]

{ #category : 'tests' }
MyPawnTest >> testCreateQueenButtonClick [

	| button |
	pawn initializeNewWindow.
	button := pawn createQueenButton.
	pawn window root addChild: button.
	button dispatchEvent: BlMouseUpEvent primary asClickEvent.
	self assert: (pawn square contents class) equals: MyQueen.
]

{ #category : 'tests' }
MyPawnTest >> testCreateRookButton [

	| button |
	button := pawn createRookButton.
	self assert: button notNil.
	self assert: (button labelText) equals: 'tour'.
	
]

{ #category : 'tests' }
MyPawnTest >> testCreateRookButtonClick [

	| button |
	pawn initializeNewWindow.
	button := pawn createRookButton.
	pawn window root addChild: button.
	button dispatchEvent: BlMouseUpEvent primary asClickEvent.
	self assert: (pawn square contents class) equals: MyRook.
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
	board at: 'e7' put: whitePawn.
	promotedWhite := whitePawn canPromote.
	self assert: promotedWhite 
]
