Class {
	#name : 'MyManualPromotionStrategyTest',
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
MyManualPromotionStrategyTest >> setUp [

	super setUp.
	whitePlayer := MyPlayer new white game: self.
	whitePlayer setPromotionStrategy: MyManualPromotionStrategy new.
	strategy := whitePlayer promotionStrategy.
	board := MyChessBoard empty.
	board initializeSquares.
	pawn := MyPawn black.
	board at: 'e1' put: pawn
]

{ #category : 'tests' }
MyManualPromotionStrategyTest >> testCreateBishopButton [

	| button |
	button := strategy createBishopButton: pawn.
	self assert: button notNil.
	self assert: button labelText equals: 'Bishop'
]

{ #category : 'tests' }
MyManualPromotionStrategyTest >> testCreateBishopButtonClick [

	| button |
	strategy initializeNewWindow.
	button := strategy createBishopButton: pawn.
	strategy window root addChild: button.
	button dispatchEvent: BlMouseUpEvent primary asClickEvent.
	self assert: pawn square contents class equals: MyBishop
]

{ #category : 'tests' }
MyManualPromotionStrategyTest >> testCreateKnightButton [

	| button |
	button := strategy createKnightButton: pawn.
	self assert: button notNil.
	self assert: button labelText equals: 'Knight'
]

{ #category : 'tests' }
MyManualPromotionStrategyTest >> testCreateKnightButtonClick [

	| button |
	strategy initializeNewWindow.
	button := strategy createKnightButton:pawn.
	strategy window root addChild: button.
	button dispatchEvent: BlMouseUpEvent primary asClickEvent.
	self assert: pawn square contents class equals: MyKnight
]

{ #category : 'tests' }
MyManualPromotionStrategyTest >> testCreateQueenButton [

	| button |
	button := strategy createQueenButton: pawn.
	self assert: button notNil.
	self assert: button labelText equals: 'Queen'
]

{ #category : 'tests' }
MyManualPromotionStrategyTest >> testCreateQueenButtonClick [

	| button |
	strategy initializeNewWindow.
	button := strategy createQueenButton:pawn.
	strategy window root addChild: button.
	button dispatchEvent: BlMouseUpEvent primary asClickEvent.
	self assert: pawn square contents class equals: MyQueen
]

{ #category : 'tests' }
MyManualPromotionStrategyTest >> testCreateRookButton [

	| button |
	button := strategy createRookButton: pawn.
	self assert: button notNil.
	self assert: button labelText equals: 'Rook'
]

{ #category : 'tests' }
MyManualPromotionStrategyTest >> testCreateRookButtonClick [

	| button |
	strategy initializeNewWindow.
	button := strategy createRookButton:pawn.
	strategy window root addChild: button.
	button dispatchEvent: BlMouseUpEvent primary asClickEvent.
	self assert: pawn square contents class equals: MyRook
]

{ #category : 'tests' }
MyManualPromotionStrategyTest >> testPromotionWindowCreateTheWindow [

	self assert: strategy window isNil.
	strategy promotePawn: pawn.
	self assert: strategy notNil
]

{ #category : 'tests' }
MyManualPromotionStrategyTest >> testPromotionWindowNumberOfButton [

	strategy promotePawn: pawn.
	self assert: strategy window root firstChild children size equals: 4
]

{ #category : 'tests' }
MyManualPromotionStrategyTest >> testPromotionWindowPaneSize [

	strategy promotePawn: pawn.
	self assert: strategy window root children size equals: 1
]
