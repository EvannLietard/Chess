Class {
	#name : 'MyPlayerTest',
	#superclass : 'TestCase',
	#instVars : [
		'player'
	],
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'running' }
MyPlayerTest >> setUp [
	super setUp.
	player:= MyPlayer new.
	"Put here a common initialization logic for tests"
]

{ #category : 'tests' }
MyPlayerTest >> testHasNotPromotionStrategy [ 
self assert: (player hasPromotionStrategy not).
]

{ #category : 'tests' }
MyPlayerTest >> testHasPromotionStrategy [ 
player setPromotionStrategy: MyManualPromotionStrategy new.
self assert: (player hasPromotionStrategy).
]
