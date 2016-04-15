#CoreAnimation SplashScreen

I've always been intrigued by Twitter's splash screen. I also wanted to prototype something quickly using Playground. I reckon this is the best time to do all this.

## How to run.

1. Clone the project
`git clone https://github.com/edwinbosire/SplashScreen.git`

2. Show the assistant editor **⌥⌘⏎ (Option + Command + Enter)**

3. Execute playground **⌥⌘⇧ (Alt+CMD+Shift)**

![image of execute playground](https://github.com/edwinbosire/SplashScreen/blob/master/Resources/screenshot-executePlayGrounds.png)


##About the Code

The concept is very simple, we apply a mask to a view, we set the mask's content to the twitter logo and scale animate the twitter logo.

We use key frame animation to animate the layer in three steps, set initial size, downscale it followed by blown up scale.

We finally add the animation to the mask.

Create a keyframe animation, set beginTime to delay the animation to simulate real app loading behaviour
```c
let birdieAnimation = CAKeyframeAnimation(keyPath: "bounds")
birdieAnimation.duration = 1
birdieAnimation.beginTime = CACurrentMediaTime() + 1
```
Use EaseInEaseOut timing function
```c
birdieAnimation.timingFunctions = [
	CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut),
	CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)]
```
Set the values you want the animation to have
```c
let initalBounds = NSValue(CGRect: splashScreenMask.bounds)
let scaledDownBounds = NSValue(CGRect: CGRect(x: 0, y: 0, width: 80, height: 61))
let blownUpBounds = NSValue(CGRect: CGRect(x: 0, y: 0, width: 1850, height: 1500))
birdieAnimation.values = [initalBounds, scaledDownBounds, blownUpBounds]
```
Importantly, don't forget to include the key times to define when the segments are executed
```c
birdieAnimation.keyTimes = [0.0, 0.5, 1.0]
birdieAnimation.fillMode = kCAFillModeForwards
birdieAnimation.removedOnCompletion = false
splashScreenMask.addAnimation(birdieAnimation, forKey: nil)

```

Need any help? Give me a shout on twitter [@edwinbosire](http://www.twitter.com/edwinbosire)

###The MIT License (MIT)
Copyright (c) 2016 Edwin Bosire

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
