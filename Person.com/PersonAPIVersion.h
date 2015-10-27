//
//  PersonAPIVersion.h
//  Person.com
//
//  Created by Jiamao Zheng on 10/27/15.
//  Copyright (c) 2015 Emerge Media. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PersonInternetConnection.h"

@interface PersonAPIVersion : NSObject
@property (nonatomic, strong) NSDictionary *dictionary;

-(void)getAppVersion: (void (^)(NSDictionary * dictionary))completionHandler;
@end
