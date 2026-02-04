Class {
	#name : 'AILlamaCppBackend',
	#superclass : 'AIBackend',
	#instVars : [
		'loadedModels',
		'initialized'
	],
	#category : 'AI-PharoInfer',
	#package : 'AI-PharoInfer'
}

{ #category : 'ffi' }
AILlamaCppBackend >> ffiLibrary [

	^ AILlamaCppLibrary
]

{ #category : 'ffi - llama' }
AILlamaCppBackend >> ffiLlamaBackendFree [
	"void llama_backend_free(void)"

	^ self ffiCall: #(void llama_backend_free())
]

{ #category : 'ffi - llama' }
AILlamaCppBackend >> ffiLlamaBackendInit [
	"void llama_backend_init(void)"

	^ self ffiCall: #(void llama_backend_init())
]

{ #category : 'ffi - llama' }
AILlamaCppBackend >> ffiLlamaContextDefaultParams [
	"struct llama_context_params llama_context_default_params(void)"

	^ self ffiCall: #(AILlamaContextParams llama_context_default_params())
]

{ #category : 'ffi - llama' }
AILlamaCppBackend >> ffiLlamaDecode: ctx batch: batch [
	"int32_t llama_decode(struct llama_context * ctx, struct llama_batch batch)"

	^ self ffiCall: #(int32 llama_decode(void* ctx, AILlamaBatch batch))
]

{ #category : 'ffi - llama' }
AILlamaCppBackend >> ffiLlamaFree: ctx [
	"void llama_free(struct llama_context * ctx)"

	^ self ffiCall: #(void llama_free(void* ctx))
]

{ #category : 'ffi - llama' }
AILlamaCppBackend >> ffiLlamaFreeModel: model [
	"void llama_free_model(struct llama_model * model)"

	^ self ffiCall: #(void llama_free_model(void* model))
]

{ #category : 'ffi - llama' }
AILlamaCppBackend >> ffiLlamaGetLogits: ctx [
	"float * llama_get_logits(struct llama_context * ctx)"

	^ self ffiCall: #(void* llama_get_logits(void* ctx))
]

{ #category : 'ffi - llama' }
AILlamaCppBackend >> ffiLlamaLoadModelFromFile: pathString params: params [
	"struct llama_model * llama_load_model_from_file(const char * path_model, struct llama_model_params params)"

	^ self ffiCall: #(void* llama_load_model_from_file(String pathString, AILlamaModelParams params))
]

{ #category : 'ffi - llama' }
AILlamaCppBackend >> ffiLlamaModelDefaultParams [
	"struct llama_model_params llama_model_default_params(void)"

	^ self ffiCall: #(AILlamaModelParams llama_model_default_params())
]

{ #category : 'ffi - llama' }
AILlamaCppBackend >> ffiLlamaNCtx: ctx [
	"uint32_t llama_n_ctx(const struct llama_context * ctx)"

	^ self ffiCall: #(uint32 llama_n_ctx(void* ctx))
]

{ #category : 'ffi - llama' }
AILlamaCppBackend >> ffiLlamaNVocab: model [
	"int32_t llama_n_vocab(const struct llama_model * model)"

	^ self ffiCall: #(int32 llama_n_vocab(void* model))
]

{ #category : 'ffi - llama' }
AILlamaCppBackend >> ffiLlamaNewContextWithModel: model params: params [
	"struct llama_context * llama_new_context_with_model(struct llama_model * model, struct llama_context_params params)"

	^ self ffiCall: #(void* llama_new_context_with_model(void* model, AILlamaContextParams params))
]

{ #category : 'ffi - llama' }
AILlamaCppBackend >> ffiLlamaSamplerChainAdd: chain sampler: sampler [
	"void llama_sampler_chain_add(struct llama_sampler * chain, struct llama_sampler * smpl)"

	^ self ffiCall: #(void llama_sampler_chain_add(void* chain, void* sampler))
]

{ #category : 'ffi - llama' }
AILlamaCppBackend >> ffiLlamaSamplerChainInit: params [
	"struct llama_sampler * llama_sampler_chain_init(struct llama_sampler_chain_params params)"

	^ self ffiCall: #(void* llama_sampler_chain_init(AILlamaSamplerChainParams params))
]

{ #category : 'ffi - llama' }
AILlamaCppBackend >> ffiLlamaSamplerChainDefaultParams [
	"struct llama_sampler_chain_params llama_sampler_chain_default_params(void)"

	^ self ffiCall: #(AILlamaSamplerChainParams llama_sampler_chain_default_params())
]

{ #category : 'ffi - llama' }
AILlamaCppBackend >> ffiLlamaSamplerFree: sampler [
	"void llama_sampler_free(struct llama_sampler * smpl)"

	^ self ffiCall: #(void llama_sampler_free(void* sampler))
]

{ #category : 'ffi - llama' }
AILlamaCppBackend >> ffiLlamaSamplerInitDist: seed [
	"struct llama_sampler * llama_sampler_init_dist(uint32_t seed)"

	^ self ffiCall: #(void* llama_sampler_init_dist(uint32 seed))
]

{ #category : 'ffi - llama' }
AILlamaCppBackend >> ffiLlamaSamplerInitTemp: temp [
	"struct llama_sampler * llama_sampler_init_temp(float temp)"

	^ self ffiCall: #(void* llama_sampler_init_temp(float temp))
]

{ #category : 'ffi - llama' }
AILlamaCppBackend >> ffiLlamaSamplerInitTopK: k [
	"struct llama_sampler * llama_sampler_init_top_k(int32_t k)"

	^ self ffiCall: #(void* llama_sampler_init_top_k(int32 k))
]

{ #category : 'ffi - llama' }
AILlamaCppBackend >> ffiLlamaSamplerInitTopP: p minKeep: minKeep [
	"struct llama_sampler * llama_sampler_init_top_p(float p, size_t min_keep)"

	^ self ffiCall: #(void* llama_sampler_init_top_p(float p, size_t minKeep))
]

{ #category : 'ffi - llama' }
AILlamaCppBackend >> ffiLlamaSamplerSample: sampler ctx: ctx idx: idx [
	"llama_token llama_sampler_sample(struct llama_sampler * smpl, struct llama_context * ctx, int32_t idx)"

	^ self ffiCall: #(int32 llama_sampler_sample(void* sampler, void* ctx, int32 idx))
]

{ #category : 'ffi - llama' }
AILlamaCppBackend >> ffiLlamaTokenBos: model [
	"llama_token llama_token_bos(const struct llama_model * model)"

	^ self ffiCall: #(int32 llama_token_bos(void* model))
]

{ #category : 'ffi - llama' }
AILlamaCppBackend >> ffiLlamaTokenEos: model [
	"llama_token llama_token_eos(const struct llama_model * model)"

	^ self ffiCall: #(int32 llama_token_eos(void* model))
]

{ #category : 'ffi - llama' }
AILlamaCppBackend >> ffiLlamaTokenToPiece: model token: token buf: buf length: length special: special [
	"int32_t llama_token_to_piece(const struct llama_model * model, llama_token token, char * buf, int32_t length, int32_t special)"

	^ self ffiCall: #(int32 llama_token_to_piece(void* model, int32 token, void* buf, int32 length, int32 special))
]

{ #category : 'ffi - llama' }
AILlamaCppBackend >> ffiLlamaTokenize: model text: text textLen: textLen tokens: tokens nMaxTokens: nMaxTokens addSpecial: addSpecial parseSpecial: parseSpecial [
	"int32_t llama_tokenize(const struct llama_model * model, const char * text, int32_t text_len, llama_token * tokens, int32_t n_max_tokens, bool add_special, bool parse_special)"

	^ self ffiCall: #(int32 llama_tokenize(void* model, String text, int32 textLen, void* tokens, int32 nMaxTokens, bool addSpecial, bool parseSpecial))
]

{ #category : 'ffi - llama' }
AILlamaCppBackend >> ffiLlamaBatchInit: nTokens embd: embd nSeqMax: nSeqMax [
	"struct llama_batch llama_batch_init(int32_t n_tokens, int32_t embd, int32_t n_seq_max)"

	^ self ffiCall: #(AILlamaBatch llama_batch_init(int32 nTokens, int32 embd, int32 nSeqMax))
]

{ #category : 'ffi - llama' }
AILlamaCppBackend >> ffiLlamaBatchFree: batch [
	"void llama_batch_free(struct llama_batch batch)"

	^ self ffiCall: #(void llama_batch_free(AILlamaBatch batch))
]

{ #category : 'ffi - llama' }
AILlamaCppBackend >> ffiLlamaKvCacheClear: ctx [
	"void llama_kv_cache_clear(struct llama_context * ctx)"

	^ self ffiCall: #(void llama_kv_cache_clear(void* ctx))
]

{ #category : 'operations' }
AILlamaCppBackend >> generateEmbeddings: text model: aModel [
	"Generate embeddings for the given text"

	self error: 'Embeddings not yet implemented for llama.cpp backend'
]

{ #category : 'operations' }
AILlamaCppBackend >> generateText: prompt model: aModel options: options [
	"Generate text from a prompt using llama.cpp"

	| modelData llamaModel ctx tokens nTokens generatedText token eosToken sampler batch buf bufSize nWritten piece |

	self ensureInitialized.
	self ensureModelLoaded: aModel.

	modelData := loadedModels at: aModel name.
	llamaModel := modelData at: 'model'.
	ctx := modelData at: 'ctx'.

	"Tokenize prompt"
	tokens := self tokenizeText: prompt model: llamaModel addBos: true.
	nTokens := tokens size.

	"Get EOS token"
	eosToken := self ffiLlamaTokenEos: llamaModel.

	"Create sampler chain"
	sampler := self createSamplerWithOptions: options.

	"Clear KV cache before generation"
	self ffiLlamaKvCacheClear: ctx.

	"Initialize batch"
	batch := self ffiLlamaBatchInit: 512 embd: 0 nSeqMax: 1.

	"Process prompt tokens"
	self addTokensToBatch: batch tokens: tokens nTokens: nTokens.

	"Decode prompt"
	(self ffiLlamaDecode: ctx batch: batch) ~= 0 ifTrue: [
		self ffiLlamaSamplerFree: sampler.
		self error: 'Failed to decode prompt' ].

	"Generate tokens"
	generatedText := String streamContents: [ :stream |
		| nGenerated maxTokens |
		nGenerated := 0.
		maxTokens := options maxTokens.

		[ nGenerated < maxTokens ] whileTrue: [
			"Sample next token"
			token := self ffiLlamaSamplerSample: sampler ctx: ctx idx: (nTokens + nGenerated - 1).

			"Check for EOS"
			token = eosToken ifTrue: [
				nGenerated := maxTokens "Exit loop" ].

			token ~= eosToken ifTrue: [
				"Decode token to text"
				bufSize := 64.
				buf := ByteArray new: bufSize.
				nWritten := self ffiLlamaTokenToPiece: llamaModel token: token buf: buf length: bufSize special: 0.

				nWritten > 0 ifTrue: [
					piece := (buf copyFrom: 1 to: nWritten) utf8Decoded.
					stream nextPutAll: piece ].

				"Prepare batch for next token"
				self clearBatch: batch.
				self addSingleTokenToBatch: batch token: token pos: nTokens + nGenerated.

				"Decode"
				(self ffiLlamaDecode: ctx batch: batch) ~= 0 ifTrue: [
					self ffiLlamaSamplerFree: sampler.
					self error: 'Failed to decode token' ].

				nGenerated := nGenerated + 1 ] ] ].

	"Cleanup"
	self ffiLlamaSamplerFree: sampler.

	^ generatedText
]

{ #category : 'private' }
AILlamaCppBackend >> addTokensToBatch: batch tokens: tokens nTokens: nTokens [
	"Add tokens to batch for initial prompt processing"

	| tokenPtr seqIdPtr logitsPtr |

	"Access batch fields via external address"
	tokenPtr := batch token.
	seqIdPtr := batch seqId.
	logitsPtr := batch logits.

	1 to: nTokens do: [ :i |
		| token |
		token := tokens at: i.
		tokenPtr signedLongAt: ((i - 1) * 4 + 1) put: token.
		"pos"
		batch pos signedLongAt: ((i - 1) * 4 + 1) put: i - 1.
		"n_seq_id"
		batch nSeqId signedLongAt: ((i - 1) * 4 + 1) put: 1.
		"seq_id - need to handle pointer to pointer"
		"logits - only compute for last token"
		logitsPtr signedByteAt: i put: (i = nTokens ifTrue: [ 1 ] ifFalse: [ 0 ]) ].

	batch nTokens: nTokens
]

{ #category : 'private' }
AILlamaCppBackend >> addSingleTokenToBatch: batch token: token pos: pos [
	"Add a single token to batch"

	batch token signedLongAt: 1 put: token.
	batch pos signedLongAt: 1 put: pos.
	batch nSeqId signedLongAt: 1 put: 1.
	batch logits signedByteAt: 1 put: 1.
	batch nTokens: 1
]

{ #category : 'private' }
AILlamaCppBackend >> clearBatch: batch [
	"Clear the batch for reuse"

	batch nTokens: 0
]

{ #category : 'private' }
AILlamaCppBackend >> createSamplerWithOptions: options [
	"Create a sampler chain with the given options"

	| chainParams chain tempSampler topKSampler topPSampler distSampler seed |

	chainParams := self ffiLlamaSamplerChainDefaultParams.
	chain := self ffiLlamaSamplerChainInit: chainParams.

	"Add temperature sampler"
	tempSampler := self ffiLlamaSamplerInitTemp: options temperature asFloat.
	self ffiLlamaSamplerChainAdd: chain sampler: tempSampler.

	"Add top-k sampler"
	topKSampler := self ffiLlamaSamplerInitTopK: options topK.
	self ffiLlamaSamplerChainAdd: chain sampler: topKSampler.

	"Add top-p sampler"
	topPSampler := self ffiLlamaSamplerInitTopP: options topP asFloat minKeep: 1.
	self ffiLlamaSamplerChainAdd: chain sampler: topPSampler.

	"Add distribution sampler for final selection"
	seed := options seed ifNil: [ Time millisecondClockValue \\ 16rFFFFFFFF ].
	distSampler := self ffiLlamaSamplerInitDist: seed.
	self ffiLlamaSamplerChainAdd: chain sampler: distSampler.

	^ chain
]

{ #category : 'private' }
AILlamaCppBackend >> ensureInitialized [
	"Initialize llama.cpp backend if needed"

	initialized ifTrue: [ ^ self ].

	self ffiLlamaBackendInit.
	initialized := true
]

{ #category : 'private' }
AILlamaCppBackend >> ensureModelLoaded: aModel [
	"Ensure model is loaded"

	(loadedModels includesKey: aModel name) ifFalse: [
		Error signal: 'Model not loaded: ' , aModel name ]
]

{ #category : 'initialization' }
AILlamaCppBackend >> initialize [

	super initialize.
	loadedModels := Dictionary new.
	initialized := false
]

{ #category : 'operations' }
AILlamaCppBackend >> loadModel: aModel [
	"Load a model using llama.cpp"

	| modelParams ctxParams llamaModel ctx modelData pathString |

	self ensureInitialized.

	(loadedModels includesKey: aModel name) ifTrue: [ ^ self ].

	pathString := aModel path fullName.

	"Get default params"
	modelParams := self ffiLlamaModelDefaultParams.
	ctxParams := self ffiLlamaContextDefaultParams.

	"Set context size"
	ctxParams nCtx: (aModel contextLength ifNil: [ 2048 ]).

	"Load model from file"
	llamaModel := self ffiLlamaLoadModelFromFile: pathString params: modelParams.
	llamaModel isNull ifTrue: [
		Error signal: 'Failed to load model from: ' , pathString ].

	"Create context"
	ctx := self ffiLlamaNewContextWithModel: llamaModel params: ctxParams.
	ctx isNull ifTrue: [
		self ffiLlamaFreeModel: llamaModel.
		Error signal: 'Failed to create context for model' ].

	"Store model data"
	modelData := Dictionary new.
	modelData at: 'model' put: llamaModel.
	modelData at: 'ctx' put: ctx.
	modelData at: 'path' put: pathString.

	loadedModels at: aModel name put: modelData
]

{ #category : 'operations' }
AILlamaCppBackend >> streamText: prompt model: aModel options: options onToken: aBlock [
	"Stream text generation, calling aBlock for each token"

	| modelData llamaModel ctx tokens nTokens token eosToken sampler batch buf bufSize nWritten piece |

	self ensureInitialized.
	self ensureModelLoaded: aModel.

	modelData := loadedModels at: aModel name.
	llamaModel := modelData at: 'model'.
	ctx := modelData at: 'ctx'.

	"Tokenize prompt"
	tokens := self tokenizeText: prompt model: llamaModel addBos: true.
	nTokens := tokens size.

	"Get EOS token"
	eosToken := self ffiLlamaTokenEos: llamaModel.

	"Create sampler chain"
	sampler := self createSamplerWithOptions: options.

	"Clear KV cache"
	self ffiLlamaKvCacheClear: ctx.

	"Initialize batch"
	batch := self ffiLlamaBatchInit: 512 embd: 0 nSeqMax: 1.

	"Process prompt"
	self addTokensToBatch: batch tokens: tokens nTokens: nTokens.
	(self ffiLlamaDecode: ctx batch: batch) ~= 0 ifTrue: [
		self ffiLlamaSamplerFree: sampler.
		self error: 'Failed to decode prompt' ].

	"Generate and stream tokens"
	[ | nGenerated maxTokens |
		nGenerated := 0.
		maxTokens := options maxTokens.

		[ nGenerated < maxTokens ] whileTrue: [
			token := self ffiLlamaSamplerSample: sampler ctx: ctx idx: (nTokens + nGenerated - 1).

			token = eosToken ifTrue: [
				nGenerated := maxTokens ].

			token ~= eosToken ifTrue: [
				bufSize := 64.
				buf := ByteArray new: bufSize.
				nWritten := self ffiLlamaTokenToPiece: llamaModel token: token buf: buf length: bufSize special: 0.

				nWritten > 0 ifTrue: [
					piece := (buf copyFrom: 1 to: nWritten) utf8Decoded.
					aBlock value: piece ].

				self clearBatch: batch.
				self addSingleTokenToBatch: batch token: token pos: nTokens + nGenerated.

				(self ffiLlamaDecode: ctx batch: batch) ~= 0 ifTrue: [
					self ffiLlamaSamplerFree: sampler.
					self error: 'Failed to decode token' ].

				nGenerated := nGenerated + 1 ] ] ]
		ensure: [ self ffiLlamaSamplerFree: sampler ]
]

{ #category : 'private' }
AILlamaCppBackend >> tokenizeText: text model: llamaModel addBos: addBos [
	"Tokenize text using llama.cpp"

	| maxTokens tokenBuffer nTokens tokens |

	maxTokens := text size + 128.
	tokenBuffer := ByteArray new: (maxTokens * 4).

	nTokens := self
		ffiLlamaTokenize: llamaModel
		text: text
		textLen: text size
		tokens: tokenBuffer
		nMaxTokens: maxTokens
		addSpecial: addBos
		parseSpecial: true.

	nTokens < 0 ifTrue: [
		"Need more space"
		maxTokens := nTokens negated.
		tokenBuffer := ByteArray new: (maxTokens * 4).
		nTokens := self
			ffiLlamaTokenize: llamaModel
			text: text
			textLen: text size
			tokens: tokenBuffer
			nMaxTokens: maxTokens
			addSpecial: addBos
			parseSpecial: true ].

	"Convert buffer to array of tokens"
	tokens := Array new: nTokens.
	1 to: nTokens do: [ :i |
		tokens at: i put: (tokenBuffer signedLongAt: ((i - 1) * 4 + 1)) ].

	^ tokens
]

{ #category : 'operations' }
AILlamaCppBackend >> unloadModel: aModel [
	"Unload a model from memory"

	| modelData |

	(loadedModels includesKey: aModel name) ifFalse: [ ^ self ].

	modelData := loadedModels at: aModel name.

	"Free context first, then model"
	self ffiLlamaFree: (modelData at: 'ctx').
	self ffiLlamaFreeModel: (modelData at: 'model').

	loadedModels removeKey: aModel name
]
