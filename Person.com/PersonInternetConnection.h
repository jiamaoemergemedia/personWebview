//
//  PersonInternetConnection.h
//  Person
//
//  Created by Jiamao Zheng on 9/21/15.
//  Copyright (c) 2015 Emerge Media. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PersonInternetConnection : NSObject  <NSURLConnectionDataDelegate>

+(BOOL)isNetworkAvailable;

@end
