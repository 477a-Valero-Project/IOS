//
//  SecondViewController.h
//  477aDexterityApp
//
//  Created by Grant Collins on 11/5/14.
//  Copyright (c) 2014 Grant Collins. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *patientTableView;
@property (nonatomic, retain) NSMutableArray *patientData;
@end

