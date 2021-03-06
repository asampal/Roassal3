"
I am a special case to drag elements with the draggable interaction and the RSForceBasedLayout
"
Class {
	#name : #RSDraggableForce,
	#superclass : #RSInteraction,
	#instVars : [
		'layout'
	],
	#category : #'Roassal3-Layouts-Interactions'
}

{ #category : #hooks }
RSDraggableForce >> layout [
	^ layout
]

{ #category : #hooks }
RSDraggableForce >> layout: aForceLayout [
	layout := aForceLayout
]

{ #category : #hooks }
RSDraggableForce >> onShape: aShape [
	| mock |
	aShape removeInteractionIfPresent: RSDraggable.
	aShape 
		when: RSMouseDragStart do: [ :evt | 
			mock := layout mockElementAt: evt shape.
			mock isFixed: true. ];
		when: RSMouseDragging do: [ :evt |
			| d |
			d := evt shape parent camera distanceFromPixelToSpace: evt step.
			evt shape translateBy: d.
			mock fixPosition: evt shape position.
			evt shape signalUpdate ];
		when: RSMouseDragEnd do:[:evt | 
			mock isFixed: false.
			mock := nil ].
]
