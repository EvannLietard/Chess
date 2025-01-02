Class {
	#name : 'MyChessGameTest',
	#superclass : 'TestCase',
	#instVars : [
		'whitePlayer',
		'blackPlayer',
		'game',
		'promotionWindow'
	],
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'running' }
MyChessGameTest >> setUp [ [
    super setUp.
    whitePlayer := MyPlayer new white game: self.
    blackPlayer := MyPlayer new black game: self.
    whitePlayer setPromotionStrategy: MyManualPromotionStrategy new.
    blackPlayer setPromotionStrategy: MyAutomaticPromotionStrategy new.
]
]

{ #category : 'tests' }
MyChessGameTest >> testBlackPlayerHasAutomaticPromotionStrategy [ 
    self assert: blackPlayer promotionStrategy class equals: MyAutomaticPromotionStrategy .

]

{ #category : 'tests' }
MyChessGameTest >> testWhitePlayerHasManualPromotionStrategy [ 
    self assert: whitePlayer promotionStrategy class equals: MyManualPromotionStrategy .

]
