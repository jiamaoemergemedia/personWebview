//
//  PersonInternetConnection.m
//  Person
//
//  Created by Jiamao Zheng on 9/21/15.
//  Copyright (c) 2015 Emerge Media. All rights reserved.
//

#import "PersonInternetConnection.h"

@implementation PersonInternetConnection

+(BOOL)isNetworkAvailable
{
    NSURL *url = [NSURL URLWithString:@"http://google.com/m"];
    NSData *data = [NSData dataWithContentsOfURL:url];
    if (data) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        return TRUE;
    } else{
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@""
                                                        message:@"Please re-connect to the internet to continue using the Person.com app"
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        return FALSE;
    }
}

@end
