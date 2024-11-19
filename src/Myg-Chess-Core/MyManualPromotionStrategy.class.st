Class {
	#name : 'MyManualPromotionStrategy',
	#superclass : 'MyPromotionStrategy',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'as yet unclassified' }
MyManualPromotionStrategy >> promotePawn: aPawn [ [
    | pane window |
    window := BlSpace new.
    pane := ToPane horizontal.

    pane addChild: (aPawn createQueenButton).
    pane addChild: (aPawn createRookButton).
    pane addChild: (aPawn createBishopButton).
    pane addChild: (aPawn createKnightButton).

    window root addChild: pane.
    window show.
]

]
