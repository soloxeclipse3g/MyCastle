//
//  MainPage.h
//  MyCastle
//
//  Created by Brandon Salter on 11/10/12.
//  Copyright (c) 2012 Pwn Industries. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AppDelegate;
#import "FBPosterView.h"

@interface MainPage : UIViewController
{    
    NSArray* searchTermArray;
    
    FBPosterView* fb;
}

@property (nonatomic,retain) AppDelegate* theAppDel;

/*-(IBAction)loginFacebookButtonPressed;
-(IBAction)twitterButtonPressed:(id)sender;
-(IBAction)resultsButtonPressed:(id)sender;
-(IBAction)facebookLogoutButtonPressed;*/
-(IBAction)testButtonPressed;

-(IBAction)mainButtonPressed:(id)sender;

@end
