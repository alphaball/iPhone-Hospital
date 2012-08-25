//
//  InstaEmailViewController.m
//  InstaEmail
//
//  Created by Rachan Utaikitwanit on 8/27/11.
//  Copyright 2011 rachan29@yahoo.com. All rights reserved.
//

#import "InstaEmailViewController.h"


@implementation InstaEmailViewController
@synthesize emailPicker,noteTextField;

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

-(IBAction)textFieldDoneEditing:(id)sender
{
    [noteTextField resignFirstResponder];

}

-(IBAction)sendButtonTapped:(id)sender
{
    
    NSString *msg = [NSString stringWithFormat:@"%@I'm %@ and feeling %@ about it.",
                     [noteTextField text]?[noteTextField text]:@"",
                     [activities objectAtIndex:[emailPicker selectedRowInComponent:0]],
                     [feelings objectAtIndex:[emailPicker selectedRowInComponent:1]] ];
                     
    
        
    if([MFMailComposeViewController canSendMail]==YES)
    {
        NSArray *recipients = [[NSArray alloc] initWithObjects:@"rachan29@yahoo.com", nil];
        
        MFMailComposeViewController *mailController = [[MFMailComposeViewController alloc] init];
        [mailController setMailComposeDelegate:self];
        [mailController setSubject:@"Hello Renee!"];
        [mailController setToRecipients :recipients];
        [mailController setMessageBody:msg isHTML:NO];
        [self presentModalViewController:mailController animated:YES];
        [mailController release];
    }
    else{
    
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert Problem" message:@"You need to setup email first!" delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
    }
    
        
}

-(void)mailComposeController:(MFMailComposeViewController *)controller 
         didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{

    [self dismissModalViewControllerAnimated:YES];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    activities = [[NSArray alloc] initWithObjects:@"sleeping",@"eating",@"working",@"thinking",@"crying",@"begging",@"leaving",@"shopping",@"hello worlding", nil];
    feelings =  [[NSArray alloc] initWithObjects:@"awesome",@"sad",@"happy",@"ambivalent",@"nauseous",@"psyched",@"confused",@"hopeful",@"anxious", nil];
    
}


-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}


-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if(component==0){
        return [activities count];
    }
    else{
        return [feelings count];
    }
    

}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{

    if(component==0){
        return [activities objectAtIndex:row];
    }
    else{
        return [feelings objectAtIndex:row];
    }
 
}
 

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)dealloc
{
    [emailPicker release];
    [activities release];
    [feelings release];
    [super dealloc];
}

@end
