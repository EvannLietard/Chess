Class {
	#name : 'MyManualPromotionStrategy',
	#superclass : 'MyPromotionStrategy',
	#instVars : [
		'window'
	],
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'as yet unclassified' }
MyManualPromotionStrategy >> createBishopButton: aPawn [

	^ self
		  createPromotionButtonFor: aPawn
		  pieceClass: MyBishop
		  label: 'Bishop'
]

{ #category : 'as yet unclassified' }
MyManualPromotionStrategy >> createKnightButton: aPawn [ 
    ^ self createPromotionButtonFor: aPawn pieceClass: MyKnight label: 'Knight'.
]

{ #category : 'as yet unclassified' }
MyManualPromotionStrategy >> createPromotionButtonFor: aPawn pieceClass: aPieceClass label: aLabel [ 
    | button |
    button := ToButton new.
    button labelText: aLabel.
    button whenClickedDo: [
        aPawn replacePiece: aPieceClass new.
        window close.
    ].
    ^ button
]

{ #category : 'promote' }
MyManualPromotionStrategy >> createQueenButton: aPawn [ 
    ^ self createPromotionButtonFor: aPawn pieceClass: MyQueen label: 'Queen'.
]

{ #category : 'as yet unclassified' }
MyManualPromotionStrategy >> createRookButton: aPawn [ 
    ^ self createPromotionButtonFor: aPawn pieceClass: MyRook label: 'Rook'.
]

{ #category : 'initialization' }
MyManualPromotionStrategy >> initializeNewWindow [

	window := BlSpace new
]

{ #category : 'as yet unclassified' }
MyManualPromotionStrategy >> promotePawn: aPawn [

	| pane |
	self initializeNewWindow.
	pane := ToPane horizontal.

	pane addChild: (self createQueenButton: aPawn).
    pane addChild: (self createRookButton: aPawn).
    pane addChild: (self createBishopButton: aPawn).
    pane addChild: (self createKnightButton: aPawn).

	window root addChild: pane.
	window show
]

{ #category : 'accessing' }
MyManualPromotionStrategy >> window [
    ^ window
]
