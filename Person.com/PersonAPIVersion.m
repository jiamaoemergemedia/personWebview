//
//  PersonAPIVersion.m
//  Person.com
//
//  Created by Jiamao Zheng on 10/27/15.
//  Copyright (c) 2015 Emerge Media. All rights reserved.
//

#import "PersonAPIVersion.h"

@implementation PersonAPIVersion

-(void)getAppVersion: (void (^)(NSDictionary * dictionary))completionHandler{
    //Network checking
    if (![PersonInternetConnection isNetworkAvailable]) {
        return;
    }
    
    //Network connection
    NSString *body = [NSString stringWithFormat:@"https://dev.person.com/api/info/version"];
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    sessionConfiguration.HTTPAdditionalHeaders = @{ @"X-Api-Key": @"81dc9bdb52d04dc20036dbd8313ed055"};
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfiguration];
    NSURL *url = [NSURL URLWithString:body];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    //Authorization
    NSString *user = @"person";
    NSString *password = @"person123";
    NSString *authorizationString = [[[NSString stringWithFormat:@"%@:%@",user, password] dataUsingEncoding:NSUTF8StringEncoding] base64Encoding];
    [request setValue:[NSString stringWithFormat:@"Basic %@", authorizationString] forHTTPHeaderField:@"Authorization"];
    
    //GET
    request.HTTPMethod = @"GET";
    
    //data
    NSURLSessionDataTask *getDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        // The server answers with an error because it doesn't receive the params
        //handle response
        //        NSLog(@"Data:%@",data);
        //        NSLog(@"Response:%@",response);
        //        NSLog(@"Error:%@",[error localizedDescription]);
        
        NSHTTPURLResponse *httpResp = (NSHTTPURLResponse*) response;
        if (httpResp.statusCode == 200) {
            NSError *jsonError;
            
            self.dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];
            //            NSLog(@"interests/get_Interests:%@",self.dictionary);
            
            if (completionHandler) {
                completionHandler(self.dictionary);
            }
        } else {
            NSLog(@"Fail Not 200:");
            dispatch_async(dispatch_get_main_queue(), ^{
                //do something here
                [self showAlertWithTitle:@"" message:@"Person.com is currently unavailable. Please try back later."];
            });
        }
    }];
    [getDataTask resume];
    
}

-(void) showAlertWithTitle: (NSString *)title message:(NSString *)message
{
    [[[UIAlertView alloc] initWithTitle:title
                                message:message
                               delegate:self
                      cancelButtonTitle:@"OK"
                      otherButtonTitles:nil, nil] show];
}

@end
