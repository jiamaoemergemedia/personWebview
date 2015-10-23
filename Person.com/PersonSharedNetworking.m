//
//  PersonSharedNetworking.m
//  Person.com
//
//  Created by Jiamao Zheng on 10/23/15.
//  Copyright (c) 2015 Emerge Media. All rights reserved.
//

#import "PersonSharedNetworking.h"

@implementation PersonSharedNetworking

#pragma mark - sharedSharedNetWorking
+(id)sharedSharedNetWorking
{
    static dispatch_once_t pred;
    static PersonSharedNetworking *shared = nil;
    
    dispatch_once(&pred, ^{
        shared = [[self alloc] init];
    });
    return shared;
}

- (id)init
{
    if ( self = [super init] ) {
        
    }
    return self;
}


#pragma mark - getFeedForURL
-(void)getFeedForURL: (NSString*)url
             success: (void (^) (NSDictionary *dicationary, NSError *error)) successCompletion
             failure: (void (^)(void))failureCompletion
{
    //Google API url
    NSString *gURL = @"https://beta.person.com";
    
    //Creat NSUrlSession
    NSURLSession *session = [NSURLSession sharedSession];
    
    //create data download task
    [[session dataTaskWithURL:[NSURL URLWithString:gURL]
            completionHandler:^(NSData *data,
                                NSURLResponse *response,
                                NSError *error) {
                // handle response
                NSLog(@"Data:%@",data);
                NSLog(@"Response:%@",response);
                NSLog(@"Error:%@",[error localizedDescription]);
                
                NSHTTPURLResponse *httpResp = (NSHTTPURLResponse*) response;
                if (httpResp.statusCode == 200) {
                    NSError *jsonError;
                    
                    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];
                    NSLog(@"DownloadeData:%@",dictionary);
                    successCompletion(dictionary,nil);
                } else {
                    NSLog(@"Fail Not 200:");
                    dispatch_async(dispatch_get_main_queue(), ^{
                    [self showAlertWithTitle:@"" message:@"Person.com is currently unavailable. Please try back later."];
                    });
                }
            }] resume];
}


@end
