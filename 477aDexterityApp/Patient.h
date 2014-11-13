//
//  Patient.h
//  477aDexterityApp
//
//  Created by Grant Collins on 11/5/14.
//  Copyright (c) 2014 Grant Collins. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TestResult.h"
@interface Patient : NSObject
@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, assign) int *pID;
@property (nonatomic, retain) NSMutableArray *trials;
@end
