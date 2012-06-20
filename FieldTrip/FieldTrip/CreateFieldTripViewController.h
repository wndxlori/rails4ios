//
//  CreateFieldTripViewController.h
//  FieldTrip
//
//  Created by Tim Breitkreutz on 12-06-20.
//  Copyright (c) 2012 Software Brewmasters Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateFieldTripViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *fieldTripName;
@property (weak, nonatomic) IBOutlet UIButton *createFieldTrip;


@property (weak, nonatomic) IBOutlet UILabel *schoolName;

@end
