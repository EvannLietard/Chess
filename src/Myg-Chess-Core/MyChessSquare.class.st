Class {
	#name : 'MyChessSquare',
	#superclass : 'BlElement',
	#instVars : [
		'name',
		'label',
		'piece',
		'contents',
		'board',
		'target'
	],
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'arithmetic' }
MyChessSquare >> + aPoint [

	| column file |
	column := (self column asciiValue + aPoint x) asCharacter asString.
	file := (self file asciiValue + aPoint y) asCharacter asString.

	^ board at: column , file ifAbsent: [ ^ nil ]
]

{ #category : 'accessing' }
MyChessSquare >> board [
	^ board
]

{ #category : 'accessing' }
MyChessSquare >> board: aMyChessBoard [ 
	
	board := aMyChessBoard
]

{ #category : 'initialization' }
MyChessSquare >> click [

	board click: self
]

{ #category : 'accessing' }
MyChessSquare >> column [
	
	^ name first
]

{ #category : 'accessing' }
MyChessSquare >> contents [
	^ contents
]

{ #category : 'accessing' }
MyChessSquare >> contents: aPiece [

	| text |
	contents := aPiece.

	text := contents
		        ifNil: [ self emptySquareRepresentation ]
		        ifNotNil: [ contents renderPieceOn: self ].
	piece text: (text asRopedText
			 fontSize: 48;
			 foreground: self foreground;
			 fontName: MyOpenChessDownloadedFont new familyName)
]

{ #category : 'api - configuration' }
MyChessSquare >> down [

	^ self + (0 @ -1)
]

{ #category : 'asd' }
MyChessSquare >> emptyContents [
	
	self contents: nil
]

{ #category : 'as yet unclassified' }
MyChessSquare >> emptySquareRepresentation [

	self subclassResponsibility 
]

{ #category : 'accessing' }
MyChessSquare >> file [
	
	^ name second
]

{ #category : 'accessing' }
MyChessSquare >> foreground [
			
	self subclassResponsibility
]

{ #category : 'testing' }
MyChessSquare >> hasPiece [
	
	^ contents isNil not
]

{ #category : 'highlighting' }
MyChessSquare >> highlightTarget [

	self addChild: target
]

{ #category : 'initialization' }
MyChessSquare >> initialize [

	super initialize.
	target := BlElement new
		  geometry: BlCircleGeometry new;
		  background: (Color gray alpha: 0.3).

	self layout: BlFrameLayout new.

	label := BlTextElement new.
	label constraintsDo: [ :c | c padding: (BlInsets all: 3) ].

	piece := BlTextElement new.
	piece text: '' asRopedText.
	piece constraintsDo: [ :c |
		c frame horizontal alignCenter.
		c frame vertical alignCenter ].

	self
		addChild: label;
		addChild: piece.
	self
		background: Color white;
		geometry: BlSquareGeometry new.

	self addEventHandlerOn: BlClickEvent do: [ :e | self click ]
]

{ #category : 'accessing' }
MyChessSquare >> left [

	^ self + (-1 @ 0)
]

{ #category : 'accessing' }
MyChessSquare >> name [
	^ name
]

{ #category : 'accessing' }
MyChessSquare >> name: aString [

	name := aString.
	label text: (name asRopedText foreground: self negatedColor)
]

{ #category : 'as yet unclassified' }
MyChessSquare >> negatedColor [

	self subclassResponsibility 
]

{ #category : 'printing' }
MyChessSquare >> printOn: aStream [
	"Generate a string representation of the receiver based on its instance variables."

	super printOn: aStream.
	aStream
		nextPutAll: ' name: ';
		print: name
]

{ #category : 'rendering' }
MyChessSquare >> renderBlackBishop [

	self subclassResponsibility
]

{ #category : 'rendering' }
MyChessSquare >> renderBlackKing [

	self subclassResponsibility
]

{ #category : 'rendering' }
MyChessSquare >> renderBlackKnight [

	self subclassResponsibility
]

{ #category : 'rendering' }
MyChessSquare >> renderBlackPawn [

	self subclassResponsibility
]

{ #category : 'rendering' }
MyChessSquare >> renderBlackQueen [

	self subclassResponsibility
]

{ #category : 'rendering' }
MyChessSquare >> renderBlackRook [

	self subclassResponsibility
]

{ #category : 'rendering' }
MyChessSquare >> renderWhiteBishop [

	self subclassResponsibility
]

{ #category : 'rendering' }
MyChessSquare >> renderWhiteKing [

	self subclassResponsibility
]

{ #category : 'rendering' }
MyChessSquare >> renderWhiteKnight [

	self subclassResponsibility
]

{ #category : 'rendering' }
MyChessSquare >> renderWhitePawn [

	self subclassResponsibility
]

{ #category : 'rendering' }
MyChessSquare >> renderWhiteQueen [

	self subclassResponsibility
]

{ #category : 'rendering' }
MyChessSquare >> renderWhiteRook [

	self subclassResponsibility
]

{ #category : 'accessing' }
MyChessSquare >> right [
	
	^ self + (1@0)
]

{ #category : 'initialization' }
MyChessSquare >> select [
	
	self border: Color green
]

{ #category : 'highlighting' }
MyChessSquare >> unhighlightTarget [

	self removeChild: target
]

{ #category : 'initialization' }
MyChessSquare >> unselect [

	self border: BlBorder empty
]

{ #category : 'instance creation' }
MyChessSquare >> up [
	
	^ self + (0@1)
]
