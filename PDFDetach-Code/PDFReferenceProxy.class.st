"
Proxy for References to other PDFObjects
"
Class {
	#name : 'PDFReferenceProxy',
	#superclass : 'Object',
	#instVars : [
		'target',
		'handler'
	],
	#category : 'PDFDetach-Code',
	#package : 'PDFDetach-Code'
}

{ #category : 'reflective operations' }
PDFReferenceProxy >> doesNotUnderstand: pMethod [
	target ifNil: [ target := handler value ].
	^target ifNil: [
		super doesNotUnderstand: pMethod 
	] ifNotNil: [ :bObj | 
		pMethod sendTo: bObj.
	]
	
]

{ #category : 'accessing' }
PDFReferenceProxy >> handler [

	^ handler
]

{ #category : 'accessing' }
PDFReferenceProxy >> handler: anObject [

	handler := anObject
]

{ #category : 'accessing' }
PDFReferenceProxy >> target [

	^ target
]

{ #category : 'accessing' }
PDFReferenceProxy >> target: anObject [

	^ target := anObject
]
