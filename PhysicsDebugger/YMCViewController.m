//
//  YMCViewController.m
//  PhysicsDebugger
//
//  Created by ymc-thzi on 14.10.13.
//  Copyright (c) 2013 YMC. All rights reserved.
//

#import "YMCViewController.h"
#import "YMCDemoScene.h"

@implementation YMCViewController

- (void)viewWillLayoutSubviews
{
    
    [super viewWillLayoutSubviews];
    
    // Configure the view.
    SKView * skView = (SKView *)self.view;
    
    //set the view only once, if the device orientation is
    //rotating viewWillLayoutSubviews will be called again
    if ( !skView.scene )
    {
        skView.showsFPS = YES;
        skView.showsNodeCount = NO;
        
        // Create and configure the scene.
        SKScene * scene = [YMCDemoScene sceneWithSize:skView.bounds.size];
        scene.scaleMode = SKSceneScaleModeAspectFit;
        
        // Present the scene.
        [skView presentScene:scene];
    }
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

@end
