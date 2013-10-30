physicsDebugger
===
iOS 7 Sprite Kit PhysicsDebugger

Developing in iOS 7 Sprite Kit with physicsBodies is fun and easy. There are no debugging options for the physics engine. 
You will reach the point where you have to see the physicsBodies you created to expect their behaviour.
Include this PhysicsDebugger files (via CocoaPods or manually), make an init and a render call and all your physicsBodies will be displayed.
The Debugger will draw the real physicsBody, not just the shape dimensions.

![Valid XHTML] (http://www.ymc.ch/wp-content/uploads/2013/10/physics_debugger_small.png)

## Installation ##

### CocoaPods ###
The PhysicsDebugger can be easily included with CocoaPods into existing projects. Just add the line:
pod 'PhysicsDebugger' to your existing pod file in your workspace. 

### Manually installation ###
For those who don't use CocoaPods, a complete Xcode demo project can be downloaded on gitHub. Feel free to fork and contribute to this tool. Copy the files from the PhysicsDebugger/YMCPhysicsDebugger/* folder into your Sprite Kit project manually

* YMCPhysicsDebugger.h
* YMCPhysicsDebugger.m
* YMCPhysicsDebugProperties.h
* YMCPhysicsDebugProperties.m
* YMCSKNode+PhysicsDebug.h
* YMCSKNode+PhysicsDebug.m
* YMCSKPhysicsBody+Swizzle.h
* YMCSKPhysicsBody+Swizzle.m
* YMCSwizzler.h
* YMCSwizzler.m

That's it.

## Implementation ##

import the header files to your scene:

>**import "YMCPhysicsDebugger.h"**

Before your SKNodes are created init the debugger:  
>**[YMCPhysicsDebugger init];**

After your SKNodes are created call the physicsDeugger render method:
>**[self drawPhysicsBodies];**

See the YMCDemoScene.m in this xcode project for a live demo.

## Notices ##

Not all types of physicsBody are supported yet. PhysicsBody shapes will be attached to the following
PhysicsBody method calls:

* bodyWithCircleOfRadius
* bodyWithRectangleOfSize
* bodyWithPolygonFromPath
* bodyWithEdgeChainFromPath

Sprite Kit Nodes that will be added after the [self drawPhysicsBodies]; call will not be drawn.

## The way it works ##
![Valid XHTML] (http://www.ymc.ch/wp-content/uploads/2013/10/PhysicsDebugger-Architecture-New-Page.png)
