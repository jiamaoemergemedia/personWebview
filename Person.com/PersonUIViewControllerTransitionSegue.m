//
//  PersonUIViewControllerTransitionSegue.m
//  Person
//
//  Created by Jiamao Zheng on 10/9/15.
//  Copyright (c) 2015 Emerge Media. All rights reserved.
//

#import "PersonUIViewControllerTransitionSegue.h"

@implementation PersonUIViewControllerTransitionSegue

-(void)perform
{
    UIViewController *sourceViewController = [self sourceViewController];
    UIViewController *destinationViewController = [self destinationViewController];
    
    CATransition *transition = [CATransition animation];
    transition.duration = 0.001;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromRight;
//    [sourceViewController.view.layer addAnimation:transition forKey:kCATransition];
    [sourceViewController presentViewController:destinationViewController animated:NO completion:nil];
}

@end
