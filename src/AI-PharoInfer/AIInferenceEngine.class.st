Class {
	#name : 'AIInferenceEngine',
	#superclass : 'Object',
	#instVars : [
		'modelManager',
		'backend'
	],
	#classInstVars : [
		'default'
	],
	#category : 'AI-PharoInfer',
	#package : 'AI-PharoInfer'
}

{ #category : 'accessing' }
AIInferenceEngine class >> default [

	^ default ifNil: [ default := self new ]
]

{ #category : 'accessing' }
AIInferenceEngine class >> reset [

	<script>
	default := nil
]

{ #category : 'accessing' }
AIInferenceEngine >> backend [

	^ backend ifNil: [ backend := self createDefaultBackend ]
]

{ #category : 'private' }
AIInferenceEngine >> createDefaultBackend [
	"Create the default backend. Prefer AILlamaCppBackend if llama.cpp is available."

	"Try to create AILlamaCppBackend first"
	[ ^ AILlamaCppBackend new ] on: Error do: [ :ex |
		"Fall back to local backend if llama.cpp not available" ].

	^ AILocalBackend new
]

{ #category : 'accessing' }
AIInferenceEngine >> backend: anObject [

	backend := anObject
]

{ #category : 'accessing' }
AIInferenceEngine >> complete: prompt model: modelName [

	"Generate text completion for the given prompt"
	^ self complete: prompt model: modelName options: AIGenerationOptions default
]

{ #category : 'accessing' }
AIInferenceEngine >> complete: prompt model: modelName options: options [

	"Generate text completion with custom options"
	| model result effectiveBackend |

	model := self resolveModelNamed: modelName.
	model ifNil: [
		Error signal: 'Model not found: ', modelName ].

	"Use model's backend if set, otherwise use engine's backend"
	effectiveBackend := model backend ifNil: [ self backend ].

	"Ensure backend is set on model for loading"
	model backend ifNil: [ model backend: effectiveBackend ].

	model isLoaded ifFalse: [
		model load ].

	"Use the same backend that loaded the model for generation"
	result := effectiveBackend generateText: prompt model: model options: options.

	^ result
]

{ #category : 'accessing' }
AIInferenceEngine >> embeddings: text model: modelName [

	"Generate embeddings for the given text"
	| model result effectiveBackend |

	model := self resolveModelNamed: modelName.
	model ifNil: [
		Error signal: 'Model not found: ', modelName ].

	"Use model's backend if set, otherwise use engine's backend"
	effectiveBackend := model backend ifNil: [ self backend ].

	"Ensure backend is set on model for loading"
	model backend ifNil: [ model backend: effectiveBackend ].

	model isLoaded ifFalse: [
		model load ].

	"Use the same backend that loaded the model for embeddings"
	result := effectiveBackend generateEmbeddings: text model: model.

	^ result
]

{ #category : 'accessing' }
AIInferenceEngine >> initialize [

	super initialize.
	modelManager := AIModelManager default
]

{ #category : 'accessing' }
AIInferenceEngine >> modelManager [

	^ modelManager
]

{ #category : 'accessing' }
AIInferenceEngine >> modelManager: anObject [

	modelManager := anObject
]

{ #category : 'private' }
AIInferenceEngine >> resolveModelNamed: modelName [

	| model defaultManager |
	model := self modelManager modelNamed: modelName.
	model ifNotNil: [ ^ model ].

	defaultManager := AIModelManager default.
	(defaultManager ~~ self modelManager)
		ifTrue: [
			model := defaultManager modelNamed: modelName.
			model ifNotNil: [
				self modelManager: defaultManager ] ].

	^ model
]

{ #category : 'accessing' }
AIInferenceEngine >> stream: prompt model: modelName onToken: aBlock [ 

	"Stream text generation, calling aBlock for each generated token"
	^ self stream: prompt model: modelName options: AIGenerationOptions default onToken: aBlock
]

{ #category : 'accessing' }
AIInferenceEngine >> stream: prompt model: modelName options: options onToken: aBlock [

	"Stream text generation with custom options"
	| model effectiveBackend |

	model := self resolveModelNamed: modelName.
	model ifNil: [
		Error signal: 'Model not found: ', modelName ].

	"Use model's backend if set, otherwise use engine's backend"
	effectiveBackend := model backend ifNil: [ self backend ].

	"Ensure backend is set on model for loading"
	model backend ifNil: [ model backend: effectiveBackend ].

	model isLoaded ifFalse: [
		model load ].

	"Use the same backend that loaded the model for streaming"
	effectiveBackend streamText: prompt model: model options: options onToken: aBlock
]
