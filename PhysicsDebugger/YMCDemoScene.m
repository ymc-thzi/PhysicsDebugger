//
//  YMCDemoScene.m
//  PhysicsDebugger
//
//  Created by ymc-thzi on 14.10.13.
//  Copyright (c) 2013 YMC. All rights reserved.
//

#import "YMCDemoScene.h"

//import the physics debugger and the drawing category
#import "YMCPhysicsDebugger.h"


@implementation YMCDemoScene

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        
        
        //Init the PhysicsDebugger
        [YMCPhysicsDebugger init];
        
        
        //Setting up Demo Physic bodies
        
        //Drawing a nice background sprite
        SKSpriteNode *background = [SKSpriteNode spriteNodeWithImageNamed:@"background"];
        background.anchorPoint = CGPointMake(0, 0);
        background.position = CGPointMake(0, 0);
        [self addChild:background];
        
        //Set the physics edges to the frame
        self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
        
        //a sprite with a rectangle physicsBody
        SKSpriteNode* box = [SKSpriteNode spriteNodeWithImageNamed:@"box"];
        box.name = @"box";
        box.position = CGPointMake(self.size.width/2,self.size.height-10);
        box.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(80, 80)];
        box.physicsBody.mass = 0.1;
        [self addChild:box];
        
        //a sprite with a rectangle physicsBody
        SKSpriteNode* box2 = [SKSpriteNode spriteNodeWithImageNamed:@"box"];
        box2.name = @"box2";
        box2.position = CGPointMake(self.size.width/2,self.size.height-1);
        box2.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:box.size];
        [self addChild:box2];
        
        //a sprite with a circle physicsBody
        SKSpriteNode* ball = [SKSpriteNode spriteNodeWithImageNamed:@"ball"];
        ball.name = @"ball";
        ball.position = CGPointMake(self.size.width/2,self.size.height-1);
        ball.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:ball.size.width/2];
        [self addChild:ball];
        
        SKSpriteNode* ball2 = [SKSpriteNode spriteNodeWithImageNamed:@"ball"];
        ball2.name = @"ball2";
        ball2.position = CGPointMake(self.size.width/2,self.size.height-1);
        ball2.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:50];
        [self addChild:ball2];
        
        //a shape with a polygon physicsBody
        UIBezierPath* polygonPath = [UIBezierPath bezierPath];
        [polygonPath moveToPoint: CGPointMake(0, 0)];
        [polygonPath addLineToPoint: CGPointMake(50, 0)];
        [polygonPath addLineToPoint: CGPointMake(50, 20)];
        [polygonPath addLineToPoint: CGPointMake(20, 60)];
        [polygonPath addLineToPoint: CGPointMake(0, 20)];
        [polygonPath addLineToPoint: CGPointMake(0, 0)];
        
        UIBezierPath* polygonPathPhysicsBody = [UIBezierPath bezierPath];
        [polygonPathPhysicsBody moveToPoint: CGPointMake(0, 0)];
        [polygonPathPhysicsBody addLineToPoint: CGPointMake(50, 0)];
        [polygonPathPhysicsBody addLineToPoint: CGPointMake(50, 50)];
        [polygonPathPhysicsBody addLineToPoint: CGPointMake(20, 60)];
        [polygonPathPhysicsBody addLineToPoint: CGPointMake(0, 20)];
        [polygonPathPhysicsBody addLineToPoint: CGPointMake(0, 0)];
        
        SKShapeNode* polygon = [[SKShapeNode alloc]init];
        polygon.path = CGPathCreateMutableCopy(polygonPath.CGPath);
        polygon.name = @"polygon";
        
        polygon.zRotation = 2.5;
        polygon.position = CGPointMake(self.size.width/2,self.size.height-1);
        polygon.lineWidth = 0.01;
        polygon.fillColor = [SKColor blueColor];
        polygon.lineWidth = 0;
        polygon.physicsBody = [SKPhysicsBody
                             bodyWithPolygonFromPath:CGPathCreateMutableCopy(polygonPathPhysicsBody.CGPath)];
        polygon.physicsBody.mass = 0.1;
        [self addChild:polygon];
        
        //load the box
        SKSpriteNode* ground = [SKSpriteNode spriteNodeWithImageNamed:@"box"];
        ground.size = CGSizeMake(self.size.width*2, 20);
        ground.name = @"ground";
        ground.anchorPoint = CGPointMake(0, 0);
        ground.position = CGPointMake(0, 0);
        
        //// Bezier Drawing
        UIBezierPath* bezierPath = [UIBezierPath bezierPath];
        [bezierPath moveToPoint: CGPointMake(0, 60)];
        [bezierPath addLineToPoint: CGPointMake(31.5, 25)];
        [bezierPath addLineToPoint: CGPointMake(102.5, 80)];
        [bezierPath addLineToPoint: CGPointMake(149.5, 35)];
        [bezierPath addLineToPoint: CGPointMake(171.5, 40)];
        [bezierPath addLineToPoint: CGPointMake(276, 10)];
        [bezierPath addLineToPoint: CGPointMake(349, 40)];
        [bezierPath addLineToPoint: CGPointMake(419, 10)];
        [bezierPath addLineToPoint: CGPointMake(485, 80)];
        [bezierPath addLineToPoint: CGPointMake(546, 35)];
        [bezierPath addLineToPoint: CGPointMake(566, 60)];
        CGPathRef cgPath = bezierPath.CGPath;
        CGMutablePathRef  path = CGPathCreateMutableCopy(cgPath);
        ground.physicsBody = [SKPhysicsBody bodyWithEdgeChainFromPath:path];
        [self addChild:ground];
        
        
        //draw all physicsBodies in the scene
        [self drawPhysicsBodies];

    
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    //just for fun moving the bodies
    [[self childNodeWithName:@"ball"].physicsBody applyImpulse:CGVectorMake(20, 50)];
    [[self childNodeWithName:@"ball2"].physicsBody applyImpulse:CGVectorMake(20, 50)];
    [[self childNodeWithName:@"ball3"].physicsBody applyImpulse:CGVectorMake(-20, 50)];
    [[self childNodeWithName:@"box"].physicsBody applyImpulse:CGVectorMake(20, 50)];
    [[self childNodeWithName:@"box2"].physicsBody applyImpulse:CGVectorMake(-20, 50)];
    [[self childNodeWithName:@"polygon"].physicsBody applyImpulse:CGVectorMake(-20, 50)];
}

@end
