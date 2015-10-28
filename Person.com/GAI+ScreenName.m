//
//  GAI+ScreenName.m
///  Person
//
//  Created by Jiamao Zheng on 09/29/15.
//  Copyright (c) 2015 Emerge Media. All rights reserved.
//

#import "GAI+ScreenName.h"
#import "GAIDictionaryBuilder.h"
#import "GAIFields.h"

@implementation GAI (ScreenName)

+ (void) defaultTrackerSendScreenName:(NSString *) screenName{
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:screenName];
    [tracker send:[[GAIDictionaryBuilder createAppView] build]];
}

@end
