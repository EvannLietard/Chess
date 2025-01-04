Class {
	#name : 'MyChessGameTest',
	#superclass : 'TestCase',
	#instVars : [
		'whitePlayer',
		'blackPlayer',
		'game'
	],
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'running' }
MyChessGameTest >> setUp [

	super setUp.
	game := MyChessGame freshGame .

	whitePlayer := MyPlayer new white game: self.
	blackPlayer := MyPlayer new black game: self.
	
]

{ #category : 'tests' }
MyChessGameTest >> testCheckIfStrategiesAreSet_BothStrategies [
    game whitePlayer setPromotionStrategy: MyManualPromotionStrategy new.
    game blackPlayer setPromotionStrategy: MyAutomaticPromotionStrategy new.
    self assert: game checkIfStrategiesAreSet equals: true.



]

{ #category : 'tests' }
MyChessGameTest >> testCheckIfStrategiesAreSet_NoStrategy [
	game whitePlayer setPromotionStrategy: nil.
    game blackPlayer setPromotionStrategy: nil.
    self deny: game checkIfStrategiesAreSet.


]

{ #category : 'tests' }
MyChessGameTest >> testCheckIfStrategiesAreSet_OneStrategy [
    blackPlayer setPromotionStrategy: nil. 
    whitePlayer setPromotionStrategy: MyManualPromotionStrategy new.
    self deny: game checkIfStrategiesAreSet. 


]

{ #category : 'tests' }
MyChessGameTest >> testChoosePromotionStrategies [
	self assert: (game promotionWindow class = BlSpace).
	self assert: game promotionWindow root children size equals: 1.
]

{ #category : 'tests' }
MyChessGameTest >> testCreateBlackPlayerPane [
    | blackPane blackManualButton blackAutoButton labelText |
    blackPane := game createBlackPlayerPane .
	 labelText := ((blackPane children at: 1)children at:1 ) text rope.
    self assert: labelText asString  equals: 'Strategy for Black:'.
    blackManualButton := blackPane children at: 2.
    blackAutoButton := blackPane children at: 3.
    self assert: blackManualButton labelText equals: 'Manual'.
    self assert: blackAutoButton labelText equals: 'Automatic'.

]

{ #category : 'tests' }
MyChessGameTest >> testCreateMainPane [
    | mainPane|
    mainPane := game createMainPane.
    self assert: mainPane children size equals: 2.  


]

{ #category : 'tests' }
MyChessGameTest >> testCreateStrategyButtonForBlackPlayerClickAutomatic [
    | strategyButton|
	 blackPlayer setPromotionStrategy: nil.
    strategyButton := game createStrategyButtonForPlayer: 'Black' strategy: 'Automatic'.
	 strategyButton dispatchEvent: BlMouseUpEvent primary asClickEvent.
	 self assert: strategyButton notNil.
	 self assert: game blackPlayer promotionStrategy class equals: MyAutomaticPromotionStrategy .
	

]

{ #category : 'tests' }
MyChessGameTest >> testCreateStrategyButtonForBlackPlayerClickManual [
    | strategyButton|
	 blackPlayer setPromotionStrategy: nil.
    strategyButton := game createStrategyButtonForPlayer: 'Black' strategy: 'Manual'.
	 strategyButton dispatchEvent: BlMouseUpEvent primary asClickEvent.
	 self assert: strategyButton notNil.
	 self assert: game blackPlayer promotionStrategy class equals: MyManualPromotionStrategy .
	

]

{ #category : 'tests' }
MyChessGameTest >> testCreateStrategyButtonForWhitePlayerClickAutomatic [
    | strategyButton |
    strategyButton := game createStrategyButtonForPlayer: 'White' strategy: 'Automatic'.
	 strategyButton dispatchEvent: BlMouseUpEvent primary asClickEvent.
	 self assert: strategyButton notNil.
	 self assert: game whitePlayer promotionStrategy class equals: MyAutomaticPromotionStrategy .

]

{ #category : 'tests' }
MyChessGameTest >> testCreateStrategyButtonForWhitePlayerClickManual [
    | strategyButton |
    strategyButton := game createStrategyButtonForPlayer: 'White' strategy: 'Manual'.
	 strategyButton dispatchEvent: BlMouseUpEvent primary asClickEvent.
	 self assert: strategyButton notNil.
	 self assert: game whitePlayer promotionStrategy class equals: MyManualPromotionStrategy .

]

{ #category : 'tests' }
MyChessGameTest >> testCreateWhitePlayerPane [
    | whitePane whiteManualButton whiteAutoButton labelText |
    whitePane := game createWhitePlayerPane.
	 labelText := ((whitePane children at: 1)children at:1 ) text rope.
    self assert: labelText asString  equals: 'Strategy for White:'.
    whiteManualButton := whitePane children at: 2.
    whiteAutoButton := whitePane children at: 3.
    self assert: whiteManualButton labelText equals: 'Manual'.
    self assert: whiteAutoButton labelText equals: 'Automatic'.

]

{ #category : 'tests' }
MyChessGameTest >> testStrategyForAutomatic [

	| tmp1 |
	tmp1 := game strategyForPlayer: whitePlayer strategy: 'Automatic'.
	self assert: tmp1 class equals: MyAutomaticPromotionStrategy
]

{ #category : 'tests' }
MyChessGameTest >> testStrategyForManual [

	| tmp1 |
	tmp1 := game strategyForPlayer: whitePlayer strategy: 'Manual'.
	self assert: tmp1 class equals: MyManualPromotionStrategy
]
