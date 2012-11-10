//
//  SocialConnector.m
//  MyCastle
//
//  Created by Joseph on 11/10/12.
//  Copyright (c) 2012 Pwn Industries. All rights reserved.
//

#import "SocialConnector.h"

@implementation SocialConnector

-(id)initWithUrl:(NSString*)urlString andMethod:(NSString*)methodString
{
    self = [super init];
    url = urlString;
    method = methodString;
    return self;
}

//execture an asynchronous call to an external 
-(void)asynchronousUrlCall:(NSDictionary*)callDict
{
    ASIFormDataRequest* formDataRequest = [[ASIFormDataRequest alloc] init];
    formDataRequest=[ASIFormDataRequest requestWithURL:[NSURL URLWithString:url]];
    [formDataRequest setRequestMethod:method];
    if([formDataRequest.requestMethod isEqualToString:@"GET"])
    {
        [self setGetParameters:formDataRequest withParameters:[callDict objectForKey:@"parameters"]];
    }
    else
    {
        
    }
    __block ASIFormDataRequest* request = formDataRequest;
    [formDataRequest setCompletionBlock:^{
        NSLog(@"called.");
        //post notification
    
    }];
    [formDataRequest setFailedBlock:^{
        NSError *error = [request error];
        NSLog(@"Error: %@", error.localizedDescription);
    }];
    [formDataRequest startAsynchronous];
}

-(ASIFormDataRequest*)setGetParameters:(ASIFormDataRequest*)request withParameters:(NSDictionary*)dict
{
    NSString* getVars = @"?";
    for(NSString* key in dict)
    {
        NSString* value = [dict objectForKey:key];
        getVars = [NSString stringWithFormat:@"%@%@=%@&", getVars, key, value];
    }
    getVars = [getVars substringToIndex:[getVars length] - 1];
    request.url =  [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",[NSString stringWithFormat:@"%@",request.url], getVars]];
    return request;
}

@end