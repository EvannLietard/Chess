Class {
	#name : 'MyPieceTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyPieceTest >> testColor [

	| king |
	king := MyKing new.
	king color: Color pink.
	
	self assert: king color equals: Color pink.
]
