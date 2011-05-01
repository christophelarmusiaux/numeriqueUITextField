//
//  TESTAppDelegate.h
//  TEST
//
//  Created by Christophe Larmusiaux on 13/04/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TESTViewController;

@interface TESTAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    TESTViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet TESTViewController *viewController;

@end

