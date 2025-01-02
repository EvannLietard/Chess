Class {
	#name : 'MyChessGameTest',
	#superclass : 'TestCase',
	#instVars : [
		'whitePlayer',
		'blackPlayer',
		'promotionWindow',
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
	whitePlayer setPromotionStrategy: MyManualPromotionStrategy new.
	blackPlayer setPromotionStrategy: MyAutomaticPromotionStrategy new.
]

{ #category : 'tests' }
MyChessGameTest >> testBlackPlayerHasAutomaticPromotionStrategy [

	self
		assert: blackPlayer promotionStrategy class
		equals: MyAutomaticPromotionStrategy
]

{ #category : 'tests' }
MyChessGameTest >> testStrategyForAutomatic [
	| strategy  |
	strategy := game strategyForPlayer: whitePlayer strategy: 'Automatic'.
	self assert: strategy class equals: MyAutomaticPromotionStrategy 
]

{ #category : 'tests' }
MyChessGameTest >> testStrategyForManual [
	| strategy  |
	strategy := game strategyForPlayer: whitePlayer strategy: 'Manual'.
	self assert: strategy class equals: MyManualPromotionStrategy
]

{ #category : 'tests' }
MyChessGameTest >> testWhitePlayerHasManualPromotionStrategy [

	self
		assert: whitePlayer promotionStrategy class
		equals: MyManualPromotionStrategy
]
