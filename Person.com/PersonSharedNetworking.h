//
//  PersonSharedNetworking.h
//  Person.com
//
//  Created by Jiamao Zheng on 10/23/15.
//  Copyright (c) 2015 Emerge Media. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PersonInternetConnection.h"
#import "NSObject+PersonAlert.h"


@interface PersonSharedNetworking : NSObject  <NSURLConnectionDataDelegate>

+(id)sharedSharedNetWorking;

-(void)getFeedForURL: (NSString*)url
             success: (void (^) (NSDictionary *dicationary, NSError *error)) successCompletion
             failure: (void (^)(void))failureCompletion;

@end
