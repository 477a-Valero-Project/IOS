//
//  PatientTableViewController.m
//  477aDexterityApp
//
//  Created by Grant Collins on 11/5/14.
//  Copyright (c) 2014 Grant Collins. All rights reserved.
//

#import "PatientTableViewController.h"
#import "PatientTrialsTableViewController.h"
#import "Patient.h"
#import "TestResult.h"

@interface PatientTableViewController ()

@end

@implementation PatientTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Patient *p = [[Patient alloc] init];
    p.firstName = @"Grant ";
    p.lastName = @"Collins";
    p.pID = 0;
    
    TestResult *res = [[TestResult alloc]init];
    res.date = @"11/12/2014";
    res.Subject = 2021.0000;
    res.TrialNum = 0;
    res.CoeV = 0.092688;
    res.Age = 68.000000;
    res.LED = 109.896325;
    res.Std = 10.186118;
    res.TimeHold = 10.980000;
    res.TimeToMin = 0.010000;
    res.RateofRelease = 0.000000;
    res.MTIMedTot = 106.129644;
    res.MTIMed = 109.403398;
    res.Start = 4904.000000;
    res.Finish = 7100.000000;
    res.MaxHold = 137.953466;
    res.AttemptStart = 4904.000000;
    res.AttemptEnd = 7100.000000;
    res.Fprime = 0.017910;
    res.Fdblprime = 0.000110;
    res.RMSE = 0.075222;
    p.trials = [[NSMutableArray alloc] initWithObjects:res, nil];
    _patients = [[NSMutableArray alloc] initWithObjects: p, nil];
    _resultsToShow = [[NSMutableArray alloc]init];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [_patients count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PatientCell" forIndexPath:indexPath];
    Patient *patient = (_patients)[indexPath.row];
    cell.textLabel.text = [patient.firstName stringByAppendingString: patient.lastName];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //will eventually hit server for JSON test data to create objects
    //for now wil manually create one to pass to graphview

    //UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    //NSString *cellText = cell.textLabel.text;
    
    [self performSegueWithIdentifier:@"SegToTrialsView" sender:tableView];
    
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

//In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString:@"SegToTrialsView"])
    {
        NSLog(@"Handing off patient / trial data");
        /*PatientTrialsTableViewController *pttvc = [[PatientTrialsTableViewController alloc ]init];
        Patient *p = [_patients objectAtIndex:0];
        pttvc.patientName = [p.firstName stringByAppendingString: p.lastName];;
        pttvc.trials = [[NSArray alloc] initWithArray:p.trials];
        [self.navigationController pushViewController: pttvc animated:YES];*/
        //int size = [pttvc.trials count];
        //NSLog(@"there are %d objects in the array", size);
    }
}


@end
