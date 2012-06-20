//
//  FieldTripViewController.h
//  FieldTrip
//
//  Created by Tim Breitkreutz on 12-06-07.
//  Copyright (c) 2012 Software Brewmasters Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FieldTripViewControllerDelegate <NSObject>
-(void) didPickSchool:(NSString *)school;
@end

@interface FieldTripViewController : UIViewController
@property (nonatomic, weak) id <FieldTripViewControllerDelegate> delegate;
@end
