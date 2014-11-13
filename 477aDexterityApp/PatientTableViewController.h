//
//  PatientTableViewController.h
//  477aDexterityApp
//
//  Created by Grant Collins on 11/5/14.
//  Copyright (c) 2014 Grant Collins. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PatientTableViewController : UITableViewController
@property (nonatomic, strong) NSMutableArray *patients;
@property (nonatomic, strong) NSMutableArray *resultsToShow;
@end
