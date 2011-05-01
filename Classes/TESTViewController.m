//
//  TESTViewController.m
//  TEST
//
//  Created by Christophe Larmusiaux on 13/04/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TESTViewController.h"
#import <Foundation/Foundation.h>

@implementation TESTViewController


// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		
	}
    return self;
}


/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

- (void)awakeFromNib {
	myDecimaleFormatter = [[NSNumberFormatter alloc] init];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];
	textContent = [[NSMutableString alloc] initWithString:@""];
	[mylabel setDelegate:self];
	mylabel.text = [self formatDecimale:[textContent floatValue]];
	[textContent setString:mylabel.text];
	[mylabel setKeyboardType:UIKeyboardTypeDecimalPad];
	mylabel.clearButtonMode = UITextFieldViewModeWhileEditing;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField {
	[textContent setString:@""];
	return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
	if ([textField tag] == 22) {
		[textContent replaceCharactersInRange:range withString:string];
		NSRange aRange = NSMakeRange(0, [textContent length]);
		[textContent replaceOccurrencesOfString:@"," withString:@"." options:NSLiteralSearch range:aRange];
		[textContent replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:aRange];
		/*
		 // alternative si on ne set pas le grouping separator
		NSArray *parts = [textContent componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
		[self.textContent setString:@""];
		NSEnumerator *enumerator = [parts objectEnumerator];
		id valide;
		while (valide = [enumerator nextObject]) {
			[self.textContent appendString:valide];
		}
		*/
		
		if ([textContent hasSuffix:@"."] || [textContent hasSuffix:@".0"]) {
			[myDecimaleFormatter setAlwaysShowsDecimalSeparator:YES];
		}
		if ([textContent hasSuffix:@".0"]) {
			[myDecimaleFormatter setMinimumFractionDigits:1];
		}
		else if([textContent hasSuffix:@".00"]) {
			[myDecimaleFormatter setMinimumFractionDigits:2];
		}
		
		[textContent setString:[self formatDecimale:[textContent doubleValue]]];
		[myDecimaleFormatter setAlwaysShowsDecimalSeparator:NO];
		[myDecimaleFormatter setMinimumFractionDigits:0];
		if ([textContent hasPrefix:@","]) {
			[textContent insertString:@"0" atIndex:0];
		}
		[mylabel setText:textContent];
		return NO;
    }
    return YES;
}

- (NSString*)formatDecimale:(double)value {
	[myDecimaleFormatter setNumberStyle:NSNumberFormatterNoStyle];
	[myDecimaleFormatter setUsesGroupingSeparator:YES];
	[myDecimaleFormatter setGroupingSize:3];
	[myDecimaleFormatter setSecondaryGroupingSize:3];
	[myDecimaleFormatter setGroupingSeparator:@" "];
	[myDecimaleFormatter setMaximumFractionDigits:2];
	[myDecimaleFormatter setRoundingMode:NSNumberFormatterRoundFloor];
	[myDecimaleFormatter setMaximum:nil];
	return [myDecimaleFormatter stringFromNumber:[NSNumber numberWithDouble:value]];
}
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	//self.mylabel = nil;
	//self.textContent = nil;
}


- (void)dealloc {
	[titre release];
	[mylabel release];
	[textContent release];
	[myDecimaleFormatter release];
    [super dealloc];
}

@end
