//
//  VizViewController.m
//  477aDexterityApp
//
//  Created by Grant Collins on 11/13/14.
//  Copyright (c) 2014 Grant Collins. All rights reserved.
//

#import "VizViewController.h"
#import "TestResult.h"

@interface VizViewController ()

@end

@implementation VizViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
    //NSArray * patientData = [[NSArray alloc]initWithObjects:res.CoeV, nil];
    //NSArray * parkinsonData = [[NSArray alloc]initWithObjects:, ..., nil]
    //_plotData = [NSDictionary alloc] initWithObjects:<#(NSArray *)#> forKeys:<#(NSArray *)#>
    _plotData = [[NSArray alloc] initWithObjects:[NSNumber numberWithDouble: 10.186118], [NSNumber numberWithDouble:7.180000], [NSNumber numberWithDouble:12.675000], [NSNumber numberWithDouble:10.995000], [NSNumber numberWithDouble:10.675000], nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIViewController lifecycle methods
-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self initPlot];
}

#pragma mark - Chart behavior
-(void)initPlot {
    [self configureHost];
    [self configureGraph];
    [self configurePlots];
    [self configureAxes];
}

-(void)configureHost {
    self.hostView = [(CPTGraphHostingView *) [CPTGraphHostingView alloc] initWithFrame:self.view.bounds];
    self.hostView.allowPinchScaling = YES;
    [self.view addSubview:self.hostView];
}

-(void)configureGraph {
    // 1 - Create the graph
    CPTGraph *graph = [[CPTXYGraph alloc] initWithFrame:self.hostView.bounds];
    [graph applyTheme:[CPTTheme themeNamed:kCPTDarkGradientTheme]];
    self.hostView.hostedGraph = graph;
    // 2 - Set graph title
    NSString *title = @"Patient v. Standards";
    graph.title = title;
    // 3 - Create and set text style
    CPTMutableTextStyle *titleStyle = [CPTMutableTextStyle textStyle];
    titleStyle.color = [CPTColor whiteColor];
    titleStyle.fontName = @"Helvetica-Bold";
    titleStyle.fontSize = 16.0f;
    graph.titleTextStyle = titleStyle;
    graph.titlePlotAreaFrameAnchor = CPTRectAnchorTop;
    graph.titleDisplacement = CGPointMake(0.0f, 10.0f);
    // 4 - Set padding for plot area
    [graph.plotAreaFrame setPaddingLeft:30.0f];
    [graph.plotAreaFrame setPaddingBottom:30.0f];
    // 5 - Enable user interactions for plot space
    CPTXYPlotSpace *plotSpace = (CPTXYPlotSpace *) graph.defaultPlotSpace;
    plotSpace.allowsUserInteraction = YES;
}

-(void)configurePlots {
    // 1 - Get graph and plot space
    CPTGraph *graph = self.hostView.hostedGraph;
    CPTXYPlotSpace *plotSpace = (CPTXYPlotSpace *) graph.defaultPlotSpace;
    // 2 - Create the three plots
    CPTScatterPlot *patientPlot = [[CPTScatterPlot alloc] init];
    patientPlot.dataSource = self;
    patientPlot.identifier = @"PatientData";
    CPTColor *patientColor = [CPTColor redColor];
    [graph addPlot: patientPlot toPlotSpace:plotSpace];
    
    // 3 - Set up plot space
    [plotSpace scaleToFitPlots:[NSArray arrayWithObjects:patientPlot, nil]];
    CPTMutablePlotRange *xRange = [plotSpace.xRange mutableCopy];
    [xRange expandRangeByFactor:CPTDecimalFromCGFloat(1.1f)];
    plotSpace.xRange = xRange;
    CPTMutablePlotRange *yRange = [plotSpace.yRange mutableCopy];
    [yRange expandRangeByFactor:CPTDecimalFromCGFloat(1.2f)];
    plotSpace.yRange = yRange;
    
    // 4 - Create styles and symbols
    CPTMutableLineStyle *pLineStyle = [patientPlot.dataLineStyle mutableCopy];
    pLineStyle.lineWidth = 2.5;
    pLineStyle.lineColor = patientColor;
    patientPlot.dataLineStyle = pLineStyle;
    CPTMutableLineStyle *pSymbolLineStyle = [CPTMutableLineStyle lineStyle];
    pSymbolLineStyle.lineColor = patientColor;
    CPTPlotSymbol *pSymbol = [CPTPlotSymbol ellipsePlotSymbol];
    pSymbol.fill = [CPTFill fillWithColor:patientColor];
    pSymbol.lineStyle = pSymbolLineStyle;
    pSymbol.size = CGSizeMake(6.0f, 6.0f);
    patientPlot.plotSymbol = pSymbol;
}

-(void)configureAxes {
}

#pragma mark - CPTPlotDataSource methods
-(NSUInteger)numberOfRecordsForPlot:(CPTPlot *)plot {
    return 5;
}

-(NSNumber *)numberForPlot:(CPTPlot *)plot field:(NSUInteger)fieldEnum recordIndex:(NSUInteger)index {
    
    switch (fieldEnum) {
        case CPTScatterPlotFieldX:
            if (index < 8) {
                return [NSNumber numberWithUnsignedInteger:index];
            }
            break;
            
        case CPTScatterPlotFieldY:
            return [_plotData objectAtIndex:index];
            break;
    }
    return [NSDecimalNumber zero];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
