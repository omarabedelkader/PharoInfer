Class {
	#name : 'AILlamaCppLibrary',
	#superclass : 'FFILibrary',
	#category : 'AI-PharoInfer',
	#package : 'AI-PharoInfer'
}

{ #category : 'accessing' }
AILlamaCppLibrary class >> default [
	"Return a shared instance"

	^ self uniqueInstance
]

{ #category : 'accessing - platform' }
AILlamaCppLibrary >> macLibraryName [
	"Library name for macOS"

	"Check common locations"
	#(
		'/usr/local/lib/libllama.dylib'
		'/opt/homebrew/lib/libllama.dylib'
		'libllama.dylib'
	) do: [ :path |
		path asFileReference exists ifTrue: [ ^ path ] ].

	^ 'libllama.dylib'
]

{ #category : 'accessing - platform' }
AILlamaCppLibrary >> unixLibraryName [
	"Library name for Linux"

	#(
		'/usr/local/lib/libllama.so'
		'/usr/lib/libllama.so'
		'libllama.so'
	) do: [ :path |
		path asFileReference exists ifTrue: [ ^ path ] ].

	^ 'libllama.so'
]

{ #category : 'accessing - platform' }
AILlamaCppLibrary >> win32LibraryName [
	"Library name for Windows"

	^ 'llama.dll'
]
