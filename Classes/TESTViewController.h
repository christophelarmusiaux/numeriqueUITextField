//
//  TESTViewController.h
//  TEST
//
//  Created by Christophe Larmusiaux on 13/04/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TESTViewController : UIViewController <UITextFieldDelegate> {
	IBOutlet UILabel *titre;
	IBOutlet UITextField *mylabel;
	NSMutableString *textContent;
	NSNumberFormatter *myDecimaleFormatter;
}

- (NSString*)formatDecimale:(double)value;

@end

