//
//  VizViewController.h
//  477aDexterityApp
//
//  Created by Grant Collins on 11/13/14.
//  Copyright (c) 2014 Grant Collins. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CorePlot-CocoaTouch.h"

@interface VizViewController : UIViewController <CPTPlotDataSource>
@property (nonatomic, strong) CPTGraphHostingView *hostView;
//@property (nonatomic, retain) NSArray * patientData;
//@property (nonatomic, retain) NSArray * referenceData;
//@property (nonatomic, strong) NSDictionary * plotData;
@property (nonatomic, strong) NSArray * plotData;
@end
