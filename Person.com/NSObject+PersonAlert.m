//
//  NSObject+PersonAlert.m
//  Person
//
//  Created by Jiamao Zheng on 10/16/15.
//  Copyright (c) 2015 Emerge Media. All rights reserved.
//

#import "NSObject+PersonAlert.h"

@implementation NSObject (PersonAlert)

-(void) showAlertWithTitle: (NSString *)title message:(NSString *)message
{
    [[[UIAlertView alloc] initWithTitle:title
                                message:message
                               delegate:self
                      cancelButtonTitle:@"OK"
                      otherButtonTitles:nil, nil] show];
    return; 
}

@end
