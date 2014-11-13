//
//  PatientTrialsTableViewController.h
//  477aDexterityApp
//
//  Created by Grant Collins on 11/13/14.
//  Copyright (c) 2014 Grant Collins. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Patient.h"
@interface PatientTrialsTableViewController : UITableViewController
@property (nonatomic, assign) NSString * patientName;
@property (nonatomic, assign) NSString * patientID;
@property (nonatomic, strong) NSArray *trials;
@end
