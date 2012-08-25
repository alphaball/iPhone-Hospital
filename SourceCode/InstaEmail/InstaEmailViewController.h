//
//  InstaEmailViewController.h
//  InstaEmail
//
//  Created by Rachan Utaikitwanit on 8/27/11.
//  Copyright 2011 rachan29@yahoo.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MFMailComposeViewController.h> 

@interface InstaEmailViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate,MFMailComposeViewControllerDelegate>
{
    IBOutlet UIPickerView *emailPicker;
    IBOutlet UITextField *noteTextField;
    NSArray *activities;
    NSArray *feelings;
}

@property (nonatomic,retain) IBOutlet UIPickerView *emailPicker;
@property(nonatomic,retain )IBOutlet UITextField *noteTextField;
-(IBAction)sendButtonTapped:(id)sender;
-(IBAction)textFieldDoneEditing:(id)sender;
@end
