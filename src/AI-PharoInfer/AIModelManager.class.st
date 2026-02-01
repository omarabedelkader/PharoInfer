Class {
	#name : 'AIModelManager',
	#superclass : 'Object',
	#instVars : [
		'models',
		'modelsDirectory',
		'currentBackend'
	],
	#classInstVars : [
		'default'
	],
	#category : 'AI-PharoInfer',
	#package : 'AI-PharoInfer'
}

{ #category : 'accessing' }
AIModelManager class >> default [

	^ default ifNil: [ default := self new ]
]

{ #category : 'accessing' }
AIModelManager class >> reset [

	default := nil
]

{ #category : 'as yet unclassified' }
AIModelManager >> allModels [

	"Return all registered models"
	^ models values
]

{ #category : 'as yet unclassified' }
AIModelManager >> currentBackend [

	^ currentBackend ifNil: [ currentBackend := AILocalBackend new ]
]

{ #category : 'as yet unclassified' }
AIModelManager >> currentBackend: aBackend [

	currentBackend := aBackend
]

{ #category : 'as yet unclassified' }
AIModelManager >> discoverModelsInDirectory: aFileReference [

	"Discover and register all models in the given directory"
	| discovered |
	discovered := OrderedCollection new.

	aFileReference exists ifFalse: [ ^ discovered ].

	aFileReference allChildrenMatching: '*.gguf' do: [ :file |
		| model |
		model := AIModel fromFile: file.
		model backend: self currentBackend.
		self registerModel: model.
		discovered add: model ].

	aFileReference allChildrenMatching: '*.safetensors' do: [ :file |
		| model |
		model := AIModel fromFile: file.
		model backend: self currentBackend.
		self registerModel: model.
		discovered add: model ].

	^ discovered
]

{ #category : 'as yet unclassified' }
AIModelManager >> initialize [

	super initialize.
	models := Dictionary new.
	modelsDirectory := FileLocator home / 'pharo-models'
]

{ #category : 'as yet unclassified' }
AIModelManager >> listModels [

	"Return a collection of all model names"
	^ models keys
]
