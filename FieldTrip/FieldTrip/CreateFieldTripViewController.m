//
//  CreateFieldTripViewController.m
//  FieldTrip
//
//  Created by Tim Breitkreutz on 12-06-20.
//  Copyright (c) 2012 Software Brewmasters Inc. All rights reserved.
//

#import "CreateFieldTripViewController.h"
#import "FieldTripViewController.h"
#import "AFHTTPClient.h"
#import "AFJSONRequestOperation.h"

@interface CreateFieldTripViewController () <FieldTripViewControllerDelegate, UITextFieldDelegate>
@property (strong, nonatomic) NSString *theSchool;

@end

@implementation CreateFieldTripViewController
@synthesize fieldTripName = _fieldTripName;
@synthesize createFieldTrip = _createFieldTrip;
@synthesize schoolName = _schoolName;
@synthesize theSchool = _theSchool;

- (IBAction)callCreate:(id)sender {
    [self.fieldTripName resignFirstResponder];
    NSLog(@"Creating %@ at %@", self.fieldTripName.text, self.schoolName.text);
    
    NSURL *url = [NSURL URLWithString:@"http://boiling-spire-7767.herokuapp.com/schools"];
    AFHTTPClient *client= [AFHTTPClient clientWithBaseURL:url];
    [client setAuthorizationHeaderWithUsername:@"course" password:@"password"];
    NSDictionary *createParameters = [NSDictionary dictionaryWithObjectsAndKeys: self.fieldTripName.text, @"name", self.schoolName.text, @"school", nil];
    NSMutableURLRequest *request = [client requestWithMethod:@"POST" path:@"/api/field_trips/create.json" parameters:createParameters];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        NSLog(@"Field Trip Created: %@", JSON);
    } failure:nil];
    [operation start];
    
}

-(void)textFieldDidEndEditing:(UITextField *)textField {

    NSString *fieldTripName = [textField text];
    NSLog(@"fieldTripName: %@", fieldTripName); 
}

// enter key pressed
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    // if something was typed
    if ([[textField text] length]) {
        
        // give up control of the caret (blinking cursor)
        [textField resignFirstResponder];
        
        // and dismiss the keyboard
        return YES;
    } else {
        // Keep on typing
        return NO;
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void) didPickSchool:(NSString *)school
{
        NSLog(@"didPickSchool 1: %@", school);
    self.schoolName.text = school;
    self.theSchool = school;
    NSLog(@"didPickSchool 2: %@", school);
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.schoolName.text = self.theSchool;
    // register for fieldTripName
    self.fieldTripName.delegate = self;
    self.fieldTripName.placeholder = @"Enter Field Trip Name";
}

- (void)viewDidUnload
{
    [self setSchoolName:nil];
    [self setCreateFieldTrip:nil];
    [self setFieldTripName:nil];
    [self setCreateFieldTrip:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
