//
//  MyCastleCell.m
//  MyCastle
//
//  Created by Joseph on 11/10/12.
//  Copyright (c) 2012 Pwn Industries. All rights reserved.
//

#import "MyCastleCell.h"
#import "FacebookConnector.h"

@implementation MyCastleCell
@synthesize bbbLink, email;

- (id)init
{
    self = [[[NSBundle mainBundle] loadNibNamed:@"MyCastleCell" owner:self options:nil] objectAtIndex:0];
    if (self) {
        // Initialization code        
    }
    return self;
}

#pragma mark IBActions

-(IBAction)phoneButtonPressed
{
    NSString* string = [@"tel://" stringByAppendingString:self.phoneNumber];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:string]];
}

-(IBAction)emailButtonPressed
{
    parentController = [self firstAvailableUIViewController];

    if ([MFMailComposeViewController canSendMail])
    {
        MFMailComposeViewController *mailer = [[MFMailComposeViewController alloc] init];
        mailer.mailComposeDelegate = self;
        [mailer setSubject:@"I found you on MyCastle!"];
        NSArray *toRecipients = [NSArray arrayWithObjects:email, nil];
        [mailer setToRecipients:toRecipients];
        //UIImage *myImage = [UIImage imageNamed:@"mobiletuts-logo.png"];
        //NSData *imageData = UIImagePNGRepresentation(myImage);
        //[mailer addAttachmentData:imageData mimeType:@"image/png" fileName:@"mobiletutsImage"];
        NSString *emailBody = @"I have a electrical problem at my home. Please contact me as soon as possible.";
        [mailer setMessageBody:emailBody isHTML:NO];
    
        //[parentController presentModalViewController:mailer animated:YES];
        [parentController presentViewController:mailer animated:YES completion:nil];

    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failure"
                                                        message:@"Your device doesn't support the composer sheet"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
}

- (id) traverseResponderChainForUIViewController:(id)responder {
    if ([responder isKindOfClass:[UIViewController class]]) {
        return responder;
    } else if ([responder isKindOfClass:[UIView class]]) {
        return [self traverseResponderChainForUIViewController:[responder nextResponder]];
    } else if ([responder isKindOfClass:[UITableView class]]) {
        return [self traverseResponderChainForUIViewController:[responder nextResponder]];
    } else {
        return nil;
    }
}

- (UIViewController *) firstAvailableUIViewController {
    // convenience function for casting and to "mask" the recursive function
    return (UIViewController *)[self traverseResponderChainForUIViewController:[self nextResponder]];
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled: you cancelled the operation and no email message was queued.");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved: you saved the email message in the drafts folder.");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail send: the email message is queued in the outbox. It is ready to send.");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail failed: the email message was not saved or queued, possibly due to an error.");
            break;
        default:
            NSLog(@"Mail not sent.");
            break;
    }
    // Remove the mail view
    //[parentController dismissModalViewControllerAnimated:YES];
    [parentController dismissViewControllerAnimated:NO completion:nil];

}

-(IBAction)bbbButtonPressed
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:bbbLink]];
}

-(IBAction)fbButtonPressed
{
    //post to facebook.
    /*if([FacebookConnector isLoggedInToFacebook])
    {
        
    }*/
}

-(IBAction)twitterButtonPressed
{
    //tweet
    
}

@end
