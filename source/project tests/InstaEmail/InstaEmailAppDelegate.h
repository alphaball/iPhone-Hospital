//
//  InstaEmailAppDelegate.h
//  InstaEmail
//
//  Created by Rachan Utaikitwanit on 8/27/11.
//  Copyright 2011 rachan29@yahoo.com. All rights reserved.
//

#import <UIKit/UIKit.h>


@class InstaEmailViewController;

@interface InstaEmailAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet InstaEmailViewController *viewController;

@end
