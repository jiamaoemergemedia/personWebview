//
//  GAI+ScreenName.h
//
//  Person
//
//  Created by Jiamao Zheng on 09/29/15.
//  Copyright (c) 2015 Emerge Media. All rights reserved.
//

#import "GAI.h"

@interface GAI (ScreenName)

/**
 * @brief A convenience method to send a screen name to google analytics
 * using the default tracker
 *
 * @param screenName A meaningful and unique representation of where the user is at in the application. 
 */
+ (void) defaultTrackerSendScreenName:(NSString *) screenName;

@end
