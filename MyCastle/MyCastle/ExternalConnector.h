//
//  SocialConnector.h
//  MyCastle
//
//  Created by Joseph on 11/10/12.
//  Copyright (c) 2012 Pwn Industries. All rights reserved.
//

#import <Foundation/Foundation.h>
@class  ASIHTTPRequest;
@class  ASIFormDataRequest;
 
@interface ExternalConnector : NSObject <NSXMLParserDelegate>
{
    NSString* url;
    NSString* method;
    NSString* currentElement;
    
    NSMutableString* currentPhone;
    NSMutableString* currentStreet;
    NSMutableString* currentBusiness;
    NSMutableString* currentZip;
    NSMutableString* currentState;
    NSMutableString* currentRatingCount;
    
    NSMutableDictionary* item;
    
    BOOL error;
    
}@property(nonatomic, strong)NSMutableArray* items;

-(id)initWithUrl:(NSString*)urlString andMethod:(NSString*)methodString;
-(void)asynchronousUrlCall:(NSDictionary*)callDict;
-(ASIFormDataRequest*)setGetParameters:(ASIFormDataRequest*)request withParameters:(NSDictionary*)array;
-(void)handleError:(NSException*)exception;

@end
