Extension { #name : #Number }

{ #category : #'*Roassal3-Chart' }
Number >> to: step count: count [
	"Answer an Interval from the receiver up to the argument, stop, 
	incrementing by step."

	^ self to: step by: (step - self) / (count - 1)
]
