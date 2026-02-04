Class {
	#name : 'AILlamaBatch',
	#superclass : 'FFIExternalStructure',
	#category : 'AI-PharoInfer',
	#package : 'AI-PharoInfer'
}

{ #category : 'field definition' }
AILlamaBatch class >> fieldsDesc [
	"struct llama_batch"

	^ #(
		int32 n_tokens;
		void* token;
		void* embd;
		void* pos;
		void* n_seq_id;
		void* seq_id;
		void* logits;
	)
]

{ #category : 'accessing' }
AILlamaBatch >> nTokens [

	^ self n_tokens
]

{ #category : 'accessing' }
AILlamaBatch >> nTokens: aValue [

	self n_tokens: aValue
]

{ #category : 'accessing' }
AILlamaBatch >> nSeqId [

	^ self n_seq_id
]

{ #category : 'accessing' }
AILlamaBatch >> seqId [

	^ self seq_id
]
