"
I apply the attach point, then I return an array with the control points for the current edge.

- controlPointsFrom:to: is an abstract method, recives 2 points and it should return a collection of points
"
Class {
	#name : #RSAbstractCPAPController,
	#superclass : #RSAbstractCPController,
	#category : #'Roassal3-Shapes-ControlPoints'
}

{ #category : #hooks }
RSAbstractCPAPController >> controlPointsFor: anEdge [
	| ap |
	ap := anEdge attachPoint.
	^ self
		controlPointsFrom: (ap startingPointOf: anEdge)
		to: (ap endingPointOf: anEdge).
]

{ #category : #hooks }
RSAbstractCPAPController >> controlPointsFrom: fromPoint to: toPoint [
	^ self subclassResponsibility
]
