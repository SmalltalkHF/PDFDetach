Class {
	#name : 'PDFDocumentTest',
	#superclass : 'TestCase',
	#category : 'PDFDetach-Tests',
	#package : 'PDFDetach-Tests'
}

{ #category : 'data' }
PDFDocumentTest class >> dictWithDateAndTime [
	^'<</Producer(DynaPDF 4.0.60.157)/Creator(DoXite)/CreationDate(D:20241021145748+02''00'')/ModDate(D:20241021145748+02''00'')>>'
]

{ #category : 'data' }
PDFDocumentTest class >> dictWithEscapedName [
	^#[60 60 47 84 121 112 101 47 69 109 98 101 100 100 101 100 70 105 108 101 47 83
117 98 116 121 112 101 47 116 101 120 116 35 50 70 120 109 108 47 68 76 32 57 49
48 50 47 80 97 114 97 109 115 60 60 47 67 104 101 99 107 83 117 109 40 178 156
53 63 218 138 144 213 56 54 239 246 25 156 37 72 41 47 67 114 101 97 116 105 111
110 68 97 116 101 40 68 58 50 48 50 52 49 48 50 49 49 52 53 55 52 54 43 48 50 39
48 48 39 41 47 77 111 100 68 97 116 101 40 68 58 50 48 50 52 49 48 50 49 49 52
53 55 52 54 43 48 50 39 48 48 39 41 47 83 105 122 101 32 57 49 48 50 62 62 47 76
101 110 103 116 104 32 57 49 48 50 62 62]
]

{ #category : 'data' }
PDFDocumentTest class >> filespec [
	^'<</Type/Filespec/EF<</F 15 0 R>>/F(Gewerbesteuer-XML-08008501-2014-02-10.xml)/UF(Gewerbesteuer-XML-08008501-2014-02-10.xml)/Desc(Mein Anhang)>>'
]

{ #category : 'data' }
PDFDocumentTest class >> komplexByteArray [
	^#[60 60 10 47 67 111 110 116 101 110 116 115 32 50 51 32 48 32 82 10 47 67 114 111 112 66 111 120 32 91 48 32 48 32 53 57 53 32 56 52 50 93 10 47 77 101 100 105 97 66 111 120 32 91 48 32 48 32 53 57 53 32 56 52 50 93 10 47 80 97 114 101 110 116 32 51 32 48 32 82 10 47 82 101 115 111 117 114 99 101 115 32 60 60 10 47 70 111 110 116 32 60 60 10 47 70 48 48 49 32 50 48 32 48 32 82 10 47 70 48 48 50 32 50 49 32 48 32 82 10 62 62 10 47 80 114 111 99 83 101 116 32 91 47 80 68 70 32 47 84 101 120 116 93 10 47 88 79 98 106 101 99 116 32 60 60 10 62 62 10 62 62 10 47 82 111 116 97 116 101 32 48 10 47 84 121 112 101 32 47 80 97 103 101 10 62 62 10 101 110 100 111 98 106 10]
]

{ #category : 'data' }
PDFDocumentTest class >> komplexDictWithDictsInArrays [
	^'<<
/Type /Catalog
/Pages 2 0 R
/Names <<
/EmbeddedFiles <<
/Names [ (EN16931\137Betriebskostenabrechnung\137Abrechnung\0402010\056pdf) 27 0 R (xrechnung\056xml) 25 0 R ]
>>
>>
/OutputIntents [ <<
/Type /OutputIntent
/S /GTS_PDFA1
/OutputConditionIdentifier (sRGB\040IEC61966\0552\0561)
/DestOutputProfile 21 0 R
>> ]
/Metadata 22 0 R
/AF 28 0 R
/PageMode /UseAttachments
>>'
]

{ #category : 'data' }
PDFDocumentTest class >> komplexObjectWithDicts [
	^'<<
/Resources <<
/Font <<
/F001 20 0 R
/F002 21 0 R
>>
/XObject <<
/00000008 22 0 R
>>
>>
/Rotate 0
/Type /Page
>>'
]

{ #category : 'data' }
PDFDocumentTest class >> moreComplexObjectWithDicts [
	^'<<
/Contents [12 0 R 13 0 R 14 0 R 15 0 R 16 0 R 17 0 R 18 0 R 19 0 R]
/CropBox [0 0 595 842]
/MediaBox [0 0 595 842]
/Parent 3 0 R
/Resources <<
/Font <<
/F001 20 0 R
/F002 21 0 R
>>
/ProcSet [/PDF /Text /ImageI]
/XObject <<
/00000008 22 0 R
>>
>>
/Rotate 0
/Type /Page
>>'
]

{ #category : 'data' }
PDFDocumentTest class >> oneRowDict [
	^'<</Type/XRef/Size 22/Root 18 0 R/Info 19 0 R/ID[<8FA0E1F480EF1765B00DFBD9C0099A9B><8FA0E1F480EF1765B00DFBD9C0099A9B>]/W[1 3 0]/Filter/FlateDecode/Length 89>>stream'
]

{ #category : 'data' }
PDFDocumentTest class >> simpleObject1 [
	^'<<
/Metadata 2 0 R
/PageMode /UseNone
/Pages 3 0 R
/Type /Catalog
/MarkInfo 4 0 R
/Names 5 0 R
>>'
]

{ #category : 'data' }
PDFDocumentTest class >> simpleObjectWithArrayWithNumbers [
	^'<<
/Contents [12 0 R 13 0 R 14 0 R 15 0 R 16 0 R 17 0 R 18 0 R 19 0 R]
/CropBox [0 0 595 842]
/MediaBox [0 0 595 842]
>>'
]

{ #category : 'data' }
PDFDocumentTest class >> simpleObjectWithArrays [
	^'<<
/Count 3
/Kids [8 0 R 9 0 R 10 0 R]
/Type /Pages
>>'
]

{ #category : 'data' }
PDFDocumentTest class >> simpleObjectWithEscapedStrings [
	^'<<
/Producer (PDF\\BOX)
/Author (\(treichling\))
>>'
]

{ #category : 'data' }
PDFDocumentTest class >> simpleObjectWithStrings [
	^'<<
/Producer (PDFBOX)
/Author (treichling)
>>'
]

{ #category : 'utilities' }
PDFDocumentTest >> newPDFObjectWithPDFDocWithEOL10 [
	| tDoc tObj |
	tDoc := PDFDocument new.
	tDoc pdfEOL: #[10].
	tObj := PDFObject new.
	tObj pdfDocument: tDoc.
	^tObj.
]

{ #category : 'utilities' }
PDFDocumentTest >> newPDFObjectWithPDFDocWithEOL13 [
	| tDoc tObj |
	tDoc := PDFDocument new.
	tDoc pdfEOL: #[13].
	tObj := PDFObject new.
	tObj pdfDocument: tDoc.
	^tObj.
]

{ #category : 'tests - reading' }
PDFDocumentTest >> testReadingComplexDict2 [
	| tObj tDict |
	tObj := self newPDFObjectWithPDFDocWithEOL13.
	tObj pdfDocument pdfStream: ( self class moreComplexObjectWithDicts asByteArray readStream ).
	tDict := tObj pdfDocument readData.
	self assert: [ tDict isKindOf: IdentityDictionary ].
	self assert: [ tDict size = 7 ].
	self assert: [ ((tDict at: #Resources) at: #ProcSet) size = 3 ].
	self assert: [ ((tDict at: #Resources) at: #ProcSet) includes: #ImageI ].



]

{ #category : 'tests - reading' }
PDFDocumentTest >> testReadingDateAndTime [
	| tDict tObj |
	tObj := self newPDFObjectWithPDFDocWithEOL13.
	tObj pdfDocument pdfStream: ( self class dictWithDateAndTime asByteArray readStream ).
	tDict := tObj pdfDocument readData.
	self assert: [ tDict isKindOf: IdentityDictionary ].
	self assert: [ (tDict at: #CreationDate ) isKindOf: DateAndTime ].
	self assert: [ (tDict at: #ModDate ) isKindOf: DateAndTime ].

	

]

{ #category : 'tests - reading' }
PDFDocumentTest >> testReadingDictWithArray [
	| tObj tDict |
	tObj := self newPDFObjectWithPDFDocWithEOL13.
	tObj pdfDocument pdfStream: ( self class simpleObjectWithArrays asByteArray readStream ).
	tDict := tObj pdfDocument readData.
	self assert: [ tDict isKindOf: IdentityDictionary ].
	self assert: [ tDict size = 3 ].
	self assert: [ (tDict at: #Kids ) isKindOf: OrderedCollection].
	self assert: [ (tDict at: #Kids ) size = 3].


]

{ #category : 'tests - reading' }
PDFDocumentTest >> testReadingDictWithDifferentArrays [
	| tObj tDict |
	tObj := self newPDFObjectWithPDFDocWithEOL13.
	tObj pdfDocument pdfStream: ( self class simpleObjectWithArrayWithNumbers asByteArray readStream ).
	tDict := tObj pdfDocument readData.
	self assert: [ tDict isKindOf: IdentityDictionary ].
	self assert: [ tDict size = 3 ].
	self assert: [ (tDict at: #CropBox ) isKindOf: OrderedCollection ].
	self assert: [ (tDict at: #CropBox ) size = 4].
	self assert: [ ((tDict at: #CropBox ) at: 4) = 842].



]

{ #category : 'tests - reading' }
PDFDocumentTest >> testReadingDictWithEscapedName [
	| tObj tDict |
	tObj := self newPDFObjectWithPDFDocWithEOL13.
	tObj pdfDocument pdfStream: ( self class dictWithEscapedName asByteArray readStream ).
	tDict := tObj pdfDocument readData.
	self assert: [ tDict isKindOf: IdentityDictionary ].
	self assert: [ (tDict at: #Subtype ) = #'text/xml' ].


]

{ #category : 'tests - reading' }
PDFDocumentTest >> testReadingDictWithEscapedString [
	| tObj tDict |
	tObj := self newPDFObjectWithPDFDocWithEOL13.
	tObj pdfDocument pdfStream: ( self class simpleObjectWithEscapedStrings asByteArray readStream ).
	tDict := tObj pdfDocument readData.
	self assert: [ tDict isKindOf: IdentityDictionary ].
	self assert: [ tDict size = 2 ].
	self assert: [ (tDict at: #Producer ) = 'PDF\BOX' ].
	self assert: [ (tDict at: #Author ) = '(treichling)' ].

]

{ #category : 'tests - reading' }
PDFDocumentTest >> testReadingDictWithNamesAndReference [
	| tObj tDict |
	tObj := self newPDFObjectWithPDFDocWithEOL13.
	tObj pdfDocument pdfStream: ( self class simpleObject1 asByteArray readStream ).
	tDict := tObj pdfDocument readData.
	self assert: [ tDict isKindOf: IdentityDictionary ].
	self assert: [ tDict size = 6 ].

]

{ #category : 'tests - reading' }
PDFDocumentTest >> testReadingDictWithString [
	| tObj tDict |
	tObj := self newPDFObjectWithPDFDocWithEOL13.
	tObj pdfDocument pdfStream: ( self class simpleObjectWithStrings asByteArray readStream ).
	tDict := tObj pdfDocument readData.
	self assert: [ tDict isKindOf: IdentityDictionary ].
	self assert: [ tDict size = 2 ].
	self assert: [ (tDict at: #Producer ) = 'PDFBOX' ].
	self assert: [ (tDict at: #Author ) = 'treichling' ].

]

{ #category : 'tests - reading' }
PDFDocumentTest >> testReadingEmptyDictionary [
	| tDict tObj |
	tObj := self newPDFObjectWithPDFDocWithEOL10 .
	tObj pdfDocument pdfStream: (self class komplexByteArray readStream).
	tDict := tObj pdfDocument readData.
	self assert: [ tDict isKindOf: IdentityDictionary ].
	self assert: [ tDict size = 7 ].
	



]

{ #category : 'tests - reading' }
PDFDocumentTest >> testReadingFilespec [
	| tDict tObj |
	tObj := self newPDFObjectWithPDFDocWithEOL13.
	tObj pdfDocument pdfStream: ( self class filespec asByteArray readStream ).
	tDict := tObj pdfDocument readData.
	self assert: [ tDict isKindOf: IdentityDictionary ].
	self assert: [ (tDict at: #Type ) = #Filespec ].
	self assert: [ (tDict at: #F) = 'Gewerbesteuer-XML-08008501-2014-02-10.xml'].
	self assert: [ (tDict at: #EF ) isKindOf: IdentityDictionary ].
	self assert: [ ((tDict at: #EF ) at: #F) isKindOf: PDFReferenceProxy ].
	
	

]

{ #category : 'tests - reading' }
PDFDocumentTest >> testReadingKomplexDict [
	| tObj tDict |
	tObj := self newPDFObjectWithPDFDocWithEOL13.
	tObj pdfDocument pdfStream: ( self class komplexObjectWithDicts asByteArray readStream ).
	tDict := tObj pdfDocument readData.
	self assert: [ tDict isKindOf: IdentityDictionary ].
	self assert: [ (tDict at: #Resources) isKindOf: IdentityDictionary ].
	self assert: [ ((tDict at: #Resources) at: #Font) isKindOf: IdentityDictionary ].
	self assert: [ ((tDict at: #Resources) at: #XObject ) isKindOf: IdentityDictionary ].
	self assert: [ (((tDict at: #Resources) at: #XObject ) at: #'00000008' ) isKindOf: PDFReferenceProxy ].
	self assert: [ (tDict at: #Rotate) = 0 ].
	
	

]

{ #category : 'tests - reading' }
PDFDocumentTest >> testReadingKomplexDictWithDictInArrays [
	| tObj tDict |
	tObj := self newPDFObjectWithPDFDocWithEOL13.
	tObj pdfDocument pdfStream: ( self class komplexDictWithDictsInArrays asByteArray readStream ).
	tDict := tObj pdfDocument readData.
	self assert: [ tDict isKindOf: IdentityDictionary ].
	self assert: [ (((tDict at: #Names) at: #EmbeddedFiles) at: #Names) isKindOf: OrderedCollection ].
	self assert: [ (((tDict at: #Names) at: #EmbeddedFiles) at: #Names) first = 'EN16931_Betriebskostenabrechnung_Abrechnung 2010.pdf' ].
	self assert: [ (tDict at: #OutputIntents ) isKindOf: OrderedCollection ].
	self assert: [ ((tDict at: #OutputIntents ) first ) isKindOf: IdentityDictionary ].
	
	

]

{ #category : 'tests - reading' }
PDFDocumentTest >> testReadingOneRowDict [
	| tObj tDict |
	tObj := self newPDFObjectWithPDFDocWithEOL13.
	tObj pdfDocument pdfStream: ( self class oneRowDict asByteArray readStream ).
	tDict := tObj pdfDocument readData.
	self assert: [ tDict isKindOf: IdentityDictionary ].
	self assert: [ (tDict at: #Type ) = #XRef ].
	self assert: [ (tDict at: #ID) size = 2 ].
	
	

]
