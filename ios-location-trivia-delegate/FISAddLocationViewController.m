//
//  FISAddLocationViewController.m
//  ios-location-trivia-delegate
//
//  Created by Timothy Clem on 6/23/15.
//  Copyright (c) 2015 The Flatiron School. All rights reserved.
//

#import "FISAddLocationViewController.h"

@interface FISAddLocationViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;
@property (weak, nonatomic) IBOutlet UITextField *nameField;

@end

@implementation FISAddLocationViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.saveButton setEnabled:NO];
}

-(IBAction)cancelButtonTapped:(id)sender
{
    [self.delegate addLocationViewControllerDidCancel:self];
}

-(IBAction)saveButtonTapped:(id)sender
{
    [self.delegate addLocationViewController:self didAddLocationNamed:self.nameField.text];
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

- (IBAction)textFieldWasEdited:(UITextField *)textField
{
    [self.saveButton setEnabled:[self.delegate addLocationViewController:self shouldAllowLocationNamed:textField.text]];
}

@end
