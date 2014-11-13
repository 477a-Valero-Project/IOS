//
//  TestResult.h
//  477aDexterityApp
//
//  Created by Grant Collins on 11/5/14.
//  Copyright (c) 2014 Grant Collins. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestResult : NSObject
@property (nonatomic, copy) NSString * date;
@property (nonatomic, assign) double Subject;
@property (nonatomic, assign) double TrialNum;
@property (nonatomic, assign) double CoeV;
@property (nonatomic, assign) double Age;
@property (nonatomic, assign) double LED;
@property (nonatomic, assign) double Std;
@property (nonatomic, assign) double TimeHold;
@property (nonatomic, assign) double TimeToMin;
@property (nonatomic, assign) double RateofRelease;
@property (nonatomic, assign) double MTIMedTot;
@property (nonatomic, assign) double MTIMed;
@property (nonatomic, assign) double Start;
@property (nonatomic, assign) double Finish;
@property (nonatomic, assign) double MaxHold;
@property (nonatomic, assign) double AttemptStart;
@property (nonatomic, assign) double AttemptEnd;
@property (nonatomic, assign) double Fprime;
@property (nonatomic, assign) double Fdblprime;
@property (nonatomic, assign) double RMSE;
@end
