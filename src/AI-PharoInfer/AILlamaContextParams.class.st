Class {
	#name : 'AILlamaContextParams',
	#superclass : 'FFIExternalStructure',
	#category : 'AI-PharoInfer',
	#package : 'AI-PharoInfer'
}

{ #category : 'field definition' }
AILlamaContextParams class >> fieldsDesc [
	"struct llama_context_params - simplified version"

	^ #(
		uint32 n_ctx;
		uint32 n_batch;
		uint32 n_ubatch;
		uint32 n_seq_max;
		int32 n_threads;
		int32 n_threads_batch;
		int32 rope_scaling_type;
		int32 pooling_type;
		int32 attention_type;
		float rope_freq_base;
		float rope_freq_scale;
		float yarn_ext_factor;
		float yarn_attn_factor;
		float yarn_beta_fast;
		float yarn_beta_slow;
		uint32 yarn_orig_ctx;
		float defrag_thold;
		void* cb_eval;
		void* cb_eval_user_data;
		int32 type_k;
		int32 type_v;
		bool logits_all;
		bool embeddings;
		bool offload_kqv;
		bool flash_attn;
		bool no_perf;
		void* abort_callback;
		void* abort_callback_data;
	)
]

{ #category : 'accessing' }
AILlamaContextParams >> nCtx [

	^ self n_ctx
]

{ #category : 'accessing' }
AILlamaContextParams >> nCtx: aValue [

	self n_ctx: aValue
]
