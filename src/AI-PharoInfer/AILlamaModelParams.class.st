Class {
	#name : 'AILlamaModelParams',
	#superclass : 'FFIExternalStructure',
	#category : 'AI-PharoInfer',
	#package : 'AI-PharoInfer'
}

{ #category : 'field definition' }
AILlamaModelParams class >> fieldsDesc [
	"struct llama_model_params - simplified version with common fields"

	^ #(
		int32 n_gpu_layers;
		int32 split_mode;
		int32 main_gpu;
		void* tensor_split;
		void* rpc_servers;
		void* progress_callback;
		void* progress_callback_user_data;
		void* kv_overrides;
		bool vocab_only;
		bool use_mmap;
		bool use_mlock;
		bool check_tensors;
	)
]
