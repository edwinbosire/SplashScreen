//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

//Create our screen
let screenFrame = CGRectMake(0.0, 0.0, 375.0, 667.0)

let containerView = UIView(frame: screenFrame)
containerView.backgroundColor = UIColor(colorLiteralRed: 0.188, green: 0.557, blue: 0.937, alpha: 1.0)

//Set our containView as the liveView

XCPlaygroundPage.currentPage.liveView = containerView

// Too lazy to create an actual ViewController? No problem, use a screenshot

let tabbarViewController = UIImageView(frame: containerView.bounds)
tabbarViewController.image = UIImage(named: "twitterScreenShot.PNG")
containerView.addSubview(tabbarViewController)

//Mask with the twitter logo as the content, twitterLogo.png must have a transparent background, else the effect is pants. 

let splashScreenMask = CAShapeLayer()
splashScreenMask.contents = UIImage(named: "twitterLogo.png")?.CGImage
splashScreenMask.bounds = CGRectMake(0.0, 0.0, 100.0, 81.0)
splashScreenMask.anchorPoint = CGPointMake(0.5, 0.5)
splashScreenMask.position = CGPointMake(CGRectGetMidX(tabbarViewController.frame), CGRectGetMidY(tabbarViewController.frame))
tabbarViewController.layer.mask = splashScreenMask

/* Using KeyFrameAnimation to perform the 3 step animation Initial -> scaledDown-> blownUp*/
let birdieAnimation = CAKeyframeAnimation(keyPath: "bounds")
birdieAnimation.duration = 1
birdieAnimation.beginTime = CACurrentMediaTime() + 1
birdieAnimation.timingFunctions = [
	CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut),
	CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)]

let initalBounds = NSValue(CGRect: splashScreenMask.bounds)
let scaledDownBounds = NSValue(CGRect: CGRect(x: 0, y: 0, width: 80, height: 61))
let blownUpBounds = NSValue(CGRect: CGRect(x: 0, y: 0, width: 1850, height: 1500))
birdieAnimation.values = [initalBounds, scaledDownBounds, blownUpBounds]
birdieAnimation.keyTimes = [0.0, 0.5, 1.0]
birdieAnimation.fillMode = kCAFillModeForwards
birdieAnimation.removedOnCompletion = false
splashScreenMask.addAnimation(birdieAnimation, forKey: nil)

// How do you set a delegate in Playgrounds? Using the hack below
let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(2 * Double(NSEC_PER_SEC)))
dispatch_after(delayTime, dispatch_get_main_queue()) { 
	tabbarViewController.layer.mask = nil
	
}