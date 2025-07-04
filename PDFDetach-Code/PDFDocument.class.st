"
Liest PDF Dokumente ein 
"
Class {
	#name : 'PDFDocument',
	#superclass : 'Object',
	#instVars : [
		'pdfData',
		'pdfVersion',
		'pdfEOL',
		'pdfObjects',
		'pdfStream'
	],
	#category : 'PDFDetach-Code',
	#package : 'PDFDetach-Code'
}

{ #category : 'constants' }
PDFDocument class >> eolBytes [
	^ByteArray with: 10 with: 13.
]

{ #category : 'constants' }
PDFDocument class >> escapeByte [
	^47
]

{ #category : 'constants' }
PDFDocument class >> inUseByte [
	^110
]

{ #category : 'constants' }
PDFDocument class >> nameEscapeByte [
	^35
]

{ #category : 'instance creation' }
PDFDocument class >> readFrom: pFilename [
	| tObj |
	tObj := self new.
	tObj readFrom: pFilename.
	^tObj.
]

{ #category : 'constants' }
PDFDocument class >> startArrayByte [
	^91
]

{ #category : 'constants' }
PDFDocument class >> startBooleanBytes [
	^ByteArray with: 102 with: 116.
]

{ #category : 'constants' }
PDFDocument class >> startDictionaryBytes [
	^ByteArray with: 60 with: 60.
]

{ #category : 'constants' }
PDFDocument class >> startNameByte [
	^47
]

{ #category : 'constants' }
PDFDocument class >> startNumericBytes [
	^#[48 49 50 51 52 53 54 55 56 57 ]
]

{ #category : 'constants' }
PDFDocument class >> startStringByte [
	^40
]

{ #category : 'constants' }
PDFDocument class >> stopArrayByte [
	^93
]

{ #category : 'constants' }
PDFDocument class >> stopDictionaryBytes [
	^ByteArray with: 62 with: 62.
]

{ #category : 'constants' }
PDFDocument class >> stopReadingBytes [
	^#[ 32 93 47 62 91 60 40]
]

{ #category : 'constants' }
PDFDocument class >> stopRreferenceByte [
	"Kennzeichen für eine Referenz ist ein R"
	^82
]

{ #category : 'constants' }
PDFDocument class >> stopStringByte [
	^41
]

{ #category : 'constants' }
PDFDocument class >> stringEscapeByte [
	^92
]

{ #category : 'accessing-files' }
PDFDocument >> getEmbeddedFile [
	^self pdfObjects select: [ :bPDFObject | bPDFObject isTypeEmbeddedFile ].
]

{ #category : 'accessing-files' }
PDFDocument >> getEmbeddedFile: pIdx [
	^((self pdfObjects select: [ :bPDFObject | bPDFObject isTypeEmbeddedFile ]) at: pIdx) readStream.
]

{ #category : 'accessing-files' }
PDFDocument >> getEmbeddedFiles [
	^self pdfObjects select: [ :bPDFObject | bPDFObject isTypeEmbeddedFile ].
]

{ #category : 'accessing' }
PDFDocument >> getObjectWithID: pID [
	^self pdfObjects detect: [ :bPDFObj | bPDFObj pdfID = pID ] ifNone: [ nil ]
]

{ #category : 'accessing' }
PDFDocument >> getObjectsWithValueNamed: pName [
	^self pdfObjects select: [ :bPDFObj | bPDFObj hasValueNamed: pName ]
]

{ #category : 'testing' }
PDFDocument >> isEOLByte: pByte [
	^self pdfEOL includes: pByte
]

{ #category : 'testing' }
PDFDocument >> isNameEscapeByte: pByte [
	^pByte = self class nameEscapeByte
]

{ #category : 'testing' }
PDFDocument >> isStartArray: pByte [
	^self class startArrayByte = pByte
]

{ #category : 'testing' }
PDFDocument >> isStartBoolean: pByte [
	^self class startBooleanBytes includes: pByte
]

{ #category : 'testing' }
PDFDocument >> isStartDictionary: pByte [
	^self class startDictionaryBytes includes: pByte
]

{ #category : 'testing' }
PDFDocument >> isStartName: pByte [
	^self class startNameByte = pByte
]

{ #category : 'testing' }
PDFDocument >> isStartNumeric: pByte [
	^self class startNumericBytes includes: pByte
]

{ #category : 'testing' }
PDFDocument >> isStartString: pByte [
	^self class startStringByte = pByte
]

{ #category : 'testing' }
PDFDocument >> isStopArray: pByte [
	^self class stopArrayByte = pByte
]

{ #category : 'testing' }
PDFDocument >> isStopDictionaryByte: pByte [
	^self class stopDictionaryBytes includes: pByte
]

{ #category : 'testing' }
PDFDocument >> isStopReadingByte: pByte [
	^pByte isNil or: [ (self class stopReadingBytes includes: pByte) or: [ (self isEOLByte: pByte) ]]
]

{ #category : 'testing' }
PDFDocument >> isStopString: pByte [
	^self class stopStringByte = pByte
]

{ #category : 'testing' }
PDFDocument >> isStringEscapeByte: pByte [
	^pByte = self class stringEscapeByte
]

{ #category : 'accessing' }
PDFDocument >> pdfEOL [

	^ pdfEOL
]

{ #category : 'accessing' }
PDFDocument >> pdfEOL: anObject [

	pdfEOL := anObject
]

{ #category : 'accessing' }
PDFDocument >> pdfObjects [

	^ pdfObjects ifNil: [ pdfObjects := OrderedCollection new ]
]

{ #category : 'accessing' }
PDFDocument >> pdfObjects: anObject [

	pdfObjects := anObject
]

{ #category : 'accessing' }
PDFDocument >> pdfStream [

	^ pdfStream
]

{ #category : 'accessing' }
PDFDocument >> pdfStream: anObject [

	pdfStream := anObject
]

{ #category : 'read PDFObjects' }
PDFDocument >> readArray [
	| tRes |
	tRes := OrderedCollection new.
	[ self isStopArray: pdfStream peek ] whileFalse: [ 
		"Werte sind immer durch ein Leerzeichen getrennt"
		pdfStream peek = 32 ifTrue: [ pdfStream next ].
		tRes add: (self readData).
		pdfStream peek = 32 ifTrue: [ pdfStream next ].
	].
	^tRes
	
	

]

{ #category : 'read PDFObjects' }
PDFDocument >> readBoolean [
	| tRes tByte tVal |
	tRes := String new writeStream.
	tByte := pdfStream peek.
	[ self isStopReadingByte: tByte ] whileFalse: [ 
		tRes nextPut: ( Character codePoint: (pdfStream next)).
		tByte := pdfStream peek.
	].
	tVal := tRes contents.
	self assert: [ #('true' 'false') includes: tVal ].
	^tVal = 'true'
]

{ #category : 'utilities' }
PDFDocument >> readCRTEntriesFrom: pStartPos [
	| tCRTHeader tPDFObject |
	pdfStream position: pStartPos.
	tCRTHeader := pdfStream next: 4.
	pdfStream skip: -4.
	tCRTHeader = ('xref' asByteArray) 
		ifTrue: [ self readCRTEntriesUndecoded ]
		ifFalse: [
			| tStr |
			tPDFObject := PDFObject new.
			tPDFObject fileOffset: pStartPos.
			tPDFObject pdfDocument: self.
			tPDFObject readObjectValues.
			tStr := tPDFObject readStream.
			self pdfObjects: (tPDFObject readCompressedCRTEntriesFrom: tStr) ]
]

{ #category : 'utilities' }
PDFDocument >> readCRTEntriesUndecoded [
	| pStartPos tStopLine tLine |
	tStopLine := 'trailer' asByteArray.
	pStartPos  := pdfStream position.
	pdfStream next: 4 + (self pdfEOL size).
	tLine := self readLineWithoutEOL.
	[ tLine = tStopLine ] whileFalse: [ 
		|  tNum tCount |
		tNum := (tLine copyFrom: 1 to: (tLine indexOf: 32) - 1) asString asNumber.	
		tCount := (tLine copyFrom: (tLine indexOf: 32) + 1 to: tLine size) asString asNumber.
		self skipToNewLine.
		1 to: tCount do: [ :bIdx |
			| tPDFObject |
			tPDFObject := PDFObject new.
			tPDFObject fileOffset: self readNumber.
			pdfStream next.
			tPDFObject generation: self readNumber.
			pdfStream next.
			tPDFObject inUse: (pdfStream next = self class inUseByte).
			pdfStream next: 2.
			tPDFObject pdfDocument: self.
			self pdfObjects add: tPDFObject
		].
		tLine := self readLineWithoutEOL.
	].


]

{ #category : 'utilities' }
PDFDocument >> readCrossReferenceTable [
	| tStartCRT |
	self skipAfter: 'startxref' asByteArray upFrom: pdfStream contents size.
	pdfStream next: (pdfEOL size).
	tStartCRT := self readNumber.
	self readCRTEntriesFrom: tStartCRT.
	
]

{ #category : 'read PDFObjects' }
PDFDocument >> readData [
	| tByte |
	[ pdfStream atEnd ] whileFalse: [ 
		tByte := pdfStream next.
		(self isStartDictionary: tByte ) ifTrue: [ 
			^self readDictionary.
		].
		(self isStartName: tByte) ifTrue: [ 
			^self readName.
	 	].
		(self isStartNumeric: tByte) ifTrue: [
			pdfStream skip: -1. 
			^self readReference.
		].
		(self isStartString: tByte) ifTrue: [
			^self readString.
		].
		(self isStartArray: tByte) ifTrue: [
			^self readArray.
		].
		(self isStartBoolean: tByte) ifTrue: [
			pdfStream skip: -1. 
			^self readBoolean.
		].
	] 
	
	

]

{ #category : 'read PDFObjects' }
PDFDocument >> readDateAndTime [
	"Lese alle Zeichen bis ), es sei denn ) wurde escaped"
	| tRes tByte |
	tRes := String new writeStream.
	tByte := pdfStream peek.
	[ self isStopString: tByte ] whileFalse: [ 
		tRes nextPut: ( Character codePoint: (pdfStream next)).
		tByte := pdfStream peek.
	].
	pdfStream next.
	^tRes contents.
]

{ #category : 'read PDFObjects' }
PDFDocument >> readDictionary [
	"Liest Key-Value Paare - Key ist immer ein Name"
	| tDict |
	(self isStartDictionary: pdfStream peek) ifFalse: [ 
		"IN diesem Fall handelt es sich um einen Hex-String"
		^self readHexString.
	].
	pdfStream next.
	tDict := IdentityDictionary new.
	[ self isStopDictionaryByte: pdfStream peek ] whileFalse: [ 
		| tKey tVal |
		(self isStartName: pdfStream peek) ifTrue: [  
			tKey := self readData.
			"Werte sind evtl. durch ein Leerzeichen getrennt"
			pdfStream peek = 32 ifTrue: [ pdfStream next ]. 
			tVal := self readData.
			tDict at: tKey put: tVal.
		] ifFalse: [ 
			pdfStream next
		]
	].
	pdfStream next; next.
	^tDict.
	
	

]

{ #category : 'instance creation' }
PDFDocument >> readFrom: pFilename [
	pdfStream := pFilename asFileReference binaryReadStream contents readStream.
	self readHeader.
	self readCrossReferenceTable.
	self readObjectValues.
	
]

{ #category : 'utilities' }
PDFDocument >> readHeader [
	| tByte |
	(self skipAfter: 'PDF-' asByteArray downFrom: 0) ifTrue: [
		pdfVersion := (self pdfStream next: 3) asString.
		pdfEOL := ByteArray new.
		tByte := pdfStream peek.
		[ self class eolBytes includes: tByte ] whileTrue: [ 
			pdfEOL := pdfEOL, (ByteArray with: pdfStream next).
			tByte := pdfStream peek.
		]
	] ifFalse: [
		self error: 'Header not found'
	]. 

]

{ #category : 'read PDFObjects' }
PDFDocument >> readHexString [
	"Lese alle Zeichen bis ), es sei denn ) wurde escaped"
	| tRes tByte |
	tRes := String new writeStream.
	tByte := pdfStream peek.
	[ self isStopDictionaryByte: tByte ] whileFalse: [ 
		tRes nextPut: ( Character codePoint: (pdfStream next)).
		tByte := pdfStream peek.
	].
	pdfStream next.
	^tRes contents.
]

{ #category : 'utilities' }
PDFDocument >> readLineWithoutEOL [
	| tRes tByte |
	tRes := WriteStream on: ByteArray new.
	tByte := pdfStream peek.
	[ pdfEOL includes: tByte ] whileFalse: [ 
		tRes nextPut: pdfStream next.
		tByte := pdfStream peek.
	].
	^tRes contents.
]

{ #category : 'read PDFObjects' }
PDFDocument >> readName [
	| tRes tByte |
	tRes := String new writeStream.
	tByte := pdfStream peek.
	[ self isStopReadingByte: tByte ] whileFalse: [
		tRes nextPut: ((self isNameEscapeByte: tByte) ifTrue: [ 
			pdfStream next.
			Character codePoint: (Integer readHexByteFrom: ((pdfStream next: 2) asString) readStream)	
		] ifFalse: [ 
			Character codePoint: (pdfStream next)
		]).
		tByte := pdfStream peek.
	].
	^tRes contents asSymbol.
	
	

]

{ #category : 'read PDFObjects' }
PDFDocument >> readNumber [
	| tRes tByte |
	tRes := String new writeStream.
	tByte := self pdfStream peek.
	[ self isStopReadingByte: tByte ] whileFalse: [ 
		tRes nextPut: ( Character codePoint: (self pdfStream next)).
		tByte := self pdfStream peek.
	].
	^tRes contents asNumber.
]

{ #category : 'utilities' }
PDFDocument >> readObjectValues [

	self pdfObjects do: [ :bPDFObject |
		bPDFObject inUse ifTrue: [ bPDFObject readObjectValues ] ]
]

{ #category : 'read PDFObjects' }
PDFDocument >> readReference [
	| tFirstNum tSecNum |
	tFirstNum := self readNumber.
	( pdfStream peek = 32 and: [ tFirstNum isInteger ]) ifFalse: [ 
		^tFirstNum
	].
	pdfStream next.
	(self isStartNumeric: pdfStream peek) ifFalse: [ 
		^tFirstNum
	].
	tSecNum := self readNumber.
	(tSecNum isInteger and: [ pdfStream peek = 32 ]) ifFalse: [ 
		pdfStream skip: (tSecNum asString size) * -1.
		^tFirstNum		
	].
	pdfStream next.
	(pdfStream peek = self class stopRreferenceByte ) ifFalse: [ 
		pdfStream skip: ((tSecNum asString size) + 1) * -1.
		^tFirstNum.
	].
	pdfStream next.
	^PDFReferenceProxy new handler: [ self getObjectWithID: tFirstNum ]; yourself. 
]

{ #category : 'read PDFObjects' }
PDFDocument >> readStreamWithLength: pLength [
	[ self isEOLByte: pdfStream peek ] whileTrue: [ 
		pdfStream next 
	].
	^(pdfStream peek = 115 ifTrue: [ 
		pdfStream next: 6.
		(pdfStream peek = 13) ifTrue: [ pdfStream next ].
		pdfStream next.
		pdfStream next: pLength.
		
	] ifFalse: [ 
		nil
	]) 
]

{ #category : 'read PDFObjects' }
PDFDocument >> readString [
	"Lese alle Zeichen bis ), es sei denn ) wurde escaped"
	| tRes tByte |
	tRes := String new writeStream.
	tByte := pdfStream peek.
	[ self isStopString: tByte ] whileFalse: [ 
		tRes nextPut: (( self isStringEscapeByte: tByte ) ifTrue: [ 
			pdfStream next.
			tByte := pdfStream next.
			self translateEscapedByte: tByte.
		] ifFalse: [ 
			Character codePoint: (pdfStream next).
		]).
		tByte := pdfStream peek.
	].
	pdfStream next.
	"Strings können auch DateAndTime Objekte sein"
	^( 'D:####*' match: tRes contents) ifTrue: [ 
		self translateIntoDateAndTime: tRes contents 
	] ifFalse: [ 
		tRes contents
	]
]

{ #category : 'accessing' }
PDFDocument >> skipAfter: pTarget downFrom: pStartPos [
	| tEnd |
	tEnd := false.
	self pdfStream position: pStartPos.
	[ tEnd or: [ (self pdfStream next: (pTarget size)) = pTarget ]  ] whileFalse: [ 
		self pdfStream atEnd ifTrue: [ 
			tEnd := true 
		] ifFalse: [ 
			self pdfStream skip: (pTarget size * -1) + 1.
		]
	].
	^tEnd not.
		
	
]

{ #category : 'accessing' }
PDFDocument >> skipAfter: pTarget upFrom: pStartPos [
	| tEnd |
	tEnd := false.
	pdfStream position: pStartPos.
	[ tEnd or: [ (pdfStream next: (pTarget size)) = pTarget ]  ] whileFalse: [ 
		pdfStream position < pTarget size ifTrue: [ 
			tEnd := true 
		] ifFalse: [ 
			pdfStream skip: ((pTarget size) + 1) * -1.
		]
	].
	^tEnd not
		
	
]

{ #category : 'utilities' }
PDFDocument >> skipToNewLine [
	| tEOL |
	tEOL := pdfStream next: (self pdfEOL size).
	[ tEOL = self pdfEOL ] whileFalse: [ 
		pdfStream skip: (self pdfEOL size -1).
		tEOL := pdfStream next: (self pdfEOL size).
	].
]

{ #category : 'read PDFObjects' }
PDFDocument >> translateEscapedByte: pByte [
	pByte = 110 ifTrue: [ ^Character lf ].
	pByte = 114 ifTrue: [ ^Character cr ].
	pByte = 116 ifTrue: [ ^Character tab ].
	(#[92 40 41] includes: pByte) ifTrue: [ ^Character codePoint: pByte ].
	pByte = 98 ifTrue: [ ^Character codePoint: 8 ].
	pByte = 102 ifTrue: [ ^Character codePoint: 255 ].
	^ self translateOctalCharacterCode: pByte.

]

{ #category : 'read PDFObjects' }
PDFDocument >> translateIntoDateAndTime: pString [
	"Tries to read a DateAndTime object from the given string, example: '20241021145748+02''00'''"
	| tStr tYear tMonth tDay tHour tMinute tSecond tOffset |
	tStr := pString readStream.
	tStr next: 2.
	tOffset := Duration seconds: 0.
	tYear := (tStr next: 4) asNumber.
	tMonth := (tStr next: 2) asNumber.
	tDay := (tStr next: 2) asNumber.
	tHour := (tStr next: 2) asNumber.
	tMinute := (tStr next: 2) asNumber.
	tSecond := (tStr next: 2) asNumber.	
	('Z+-' includes: tStr peek) ifTrue: [ 
		| tOffsetDir tOffsetHour tOffsetMinutes tFaktor |
		tOffsetDir := tStr next.
		tFaktor := (tOffsetDir = $+) ifTrue: [ 1 ] ifFalse: [ (tOffsetDir = $- ) ifTrue: [-1] ifFalse: [ 0 ]]. 
		tOffsetHour := (tStr next:2) asNumber.
		tOffsetMinutes  := (tStr peek = $') ifTrue: [ 
			tStr next.
			(tStr next: 2) asNumber
		] ifFalse: [ 0 ].
		tOffset := Duration seconds: ((tOffsetHour * 3600) + (tOffsetMinutes * 60)) * tFaktor.
		
	].
	^[ DateAndTime year: tYear month: tMonth day: tDay hour: tHour minute: tMinute second: tSecond offset: tOffset ] on: Error do: [ 
		pString
	].
	

]

{ #category : 'read PDFObjects' }
PDFDocument >> translateOctalCharacterCode: pByte [
	| tChar tRes tCharCode |
	tChar := (Character codePoint: pByte ).
	tRes := String new writeStream.
	tChar isDecimalDigit ifTrue: [ 
		[ tChar isDecimalDigit and: [ tRes size < 3 ]] whileTrue: [ 
			tRes nextPut: tChar.
			tChar := (Character codePoint: pdfStream next).
		].
		pdfStream skip: -1.	
	] ifFalse: [ tRes := '0' readStream ].
	tCharCode := Integer readFrom: tRes contents base: 8.
	"at this time - only 1-byte characters are supported"
	^Character codePoint: (tCharCode > 255 ifTrue: [ 0 ] ifFalse: [ tCharCode ]).
]
