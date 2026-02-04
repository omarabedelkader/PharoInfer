Class {
	#name : 'AILlamaSamplerChainParams',
	#superclass : 'FFIExternalStructure',
	#category : 'AI-PharoInfer',
	#package : 'AI-PharoInfer'
}

{ #category : 'field definition' }
AILlamaSamplerChainParams class >> fieldsDesc [
	"struct llama_sampler_chain_params"

	^ #(
		bool no_perf;
	)
]
