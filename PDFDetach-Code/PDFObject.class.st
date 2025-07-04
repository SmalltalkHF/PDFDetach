"
Represents a part of an pdf-file.
"
Class {
	#name : 'PDFObject',
	#superclass : 'Object',
	#instVars : [
		'fileOffset',
		'generation',
		'inUse',
		'objectValues',
		'pdfID',
		'nextByteToRead',
		'pdfDocument'
	],
	#category : 'PDFDetach-Code',
	#package : 'PDFDetach-Code'
}

{ #category : 'instance creation' }
PDFObject class >> newFor: pPDFDocument [
	^self new pdfDocument: pPDFDocument; yourself 
]

{ #category : 'constants' }
PDFObject class >> stopReadingBytes [
	^#[ 32 93 47 62 91 60 40]
]

{ #category : 'utilities' }
PDFObject >> decodeNumberFrom: pByteArray [
	| tRes |
	tRes := 0.
	pByteArray reversed withIndexDo: [ :bByte :bIdx | 
		tRes := tRes + (bByte * ( 256 raisedTo: (bIdx - 1)))
	].
	^tRes
]

{ #category : 'utilities' }
PDFObject >> encodeXML: pByteArray [
	| tRes tByte tStr tMatcher tEnc tErg |
	"determine encoding"
	tRes := ByteArray new writeStream.
	tStr := pByteArray readStream.
	tByte := tStr peek.
	[ tByte = 62 ] whileFalse: [ 
		tRes nextPut: tStr next.
		tByte := tStr peek.
	].
	tRes nextPut: tStr next.
	tMatcher := '.*encoding="([^"]*)".*' asRegex.
	tErg := (tMatcher matches: tRes contents asString).
	tErg ifTrue: [ 
		tEnc := tMatcher subexpression: 2
	].
	
	
	
	
]

{ #category : 'accessing' }
PDFObject >> fileOffset [

	^ fileOffset
]

{ #category : 'accessing' }
PDFObject >> fileOffset: anObject [

	fileOffset := anObject
]

{ #category : 'accessing' }
PDFObject >> generation [

	^ generation
]

{ #category : 'accessing' }
PDFObject >> generation: anObject [

	generation := anObject
]

{ #category : 'testing' }
PDFObject >> hasValueNamed: pName [
	^self objectValues isDictionary ifTrue: [
		(self objectValues at: pName ifAbsent: [ nil ]) isNil not 
	] ifFalse: [
		false
	].
	
]

{ #category : 'accessing' }
PDFObject >> inUse [

	^ inUse
]

{ #category : 'accessing' }
PDFObject >> inUse: anObject [

	inUse := anObject
]

{ #category : 'testing' }
PDFObject >> isTypeEmbeddedFile [

	self objectValues isDictionary ifTrue: [
		(self objectValues at: #Type ifAbsent: [ nil ]) ifNotNil: [ :bVal |
			^ bVal = #EmbeddedFile ] ].
	^ false
]

{ #category : 'accessing' }
PDFObject >> nextByteToRead [

	^ nextByteToRead
]

{ #category : 'accessing' }
PDFObject >> nextByteToRead: anObject [

	nextByteToRead := anObject
]

{ #category : 'accessing' }
PDFObject >> objectValues [
	objectValues ifNil: [ objectValues := OrderedCollection new ].
	^ objectValues
]

{ #category : 'accessing' }
PDFObject >> objectValues: anObject [

	objectValues := anObject
]

{ #category : 'accessing' }
PDFObject >> pdfDocument [

	^ pdfDocument
]

{ #category : 'accessing' }
PDFObject >> pdfDocument: anObject [

	pdfDocument := anObject
]

{ #category : 'accessing' }
PDFObject >> pdfID [

	^ pdfID
]

{ #category : 'accessing' }
PDFObject >> pdfID: anObject [

	pdfID := anObject
]

{ #category : 'utilities' }
PDFObject >> readCompressedCRTEntriesFrom: pByteArray [
	| tLengthArr tStr tRes |
	tLengthArr := (self valueNamed: #W).
	tStr := pByteArray readStream.
	tRes := OrderedCollection new.
	(self valueNamed: #Size) timesRepeat: [ 
		| tType tValB tValC|
		tType := tStr next.
		tValB := tStr next: (tLengthArr at: 2).
		tValC := tStr next: (tLengthArr at: 3).
		
		tType = 0 ifTrue: [ 
			"Nicht verwendete freie Objekte"
		] ifFalse: [ 
			tType = 1 ifTrue: [ 
				| tPDFObject |
				tPDFObject := self class new.
				tPDFObject inUse: true.
				tPDFObject fileOffset: (self decodeNumberFrom: tValB).
				tPDFObject generation: (self decodeNumberFrom: tValC).
				tPDFObject pdfDocument: self pdfDocument.
				tRes add: tPDFObject.
			] ifFalse: [ 
				
			]
	 	].
		
	].
	^tRes.

]

{ #category : 'utilities' }
PDFObject >> readObjectValues [
	self pdfDocument pdfStream position: (self fileOffset).
	self pdfID: (self pdfDocument readNumber).
	self pdfDocument skipToNewLine.
	objectValues := self pdfDocument readData.
	self nextByteToRead: self pdfDocument pdfStream position.
	
	
	
	

	
]

{ #category : 'utilities' }
PDFObject >> readStream [
	| tData |
	pdfDocument pdfStream position: (self nextByteToRead).
	tData := pdfDocument readStreamWithLength: (self valueNamed: #Length).
	^tData ifNotNil: [ :bByteArray | 
		((self hasValueNamed: #Filter) and: [ (self valueNamed: #Filter ) = #FlateDecode ]) ifTrue: [
			(ZLibReadStream on: bByteArray) upToEnd 
		] ifFalse: [ 
			bByteArray
		].
	] ifNil: [ nil ].
	
	
	
	
	

	
]

{ #category : 'accessing' }
PDFObject >> valueNamed: pName [
	^self objectValues isDictionary ifTrue: [
		(self objectValues at: pName ifAbsent: [ nil ])
	] ifFalse: [
		nil
	].
	
]
