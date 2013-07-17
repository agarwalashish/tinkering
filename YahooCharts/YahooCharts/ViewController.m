//
//  ViewController.m
//  YahooCharts
//
//  Created by Ashish Agarwal on 2013-04-09.
//  Copyright (c) 2013 Ashish Agarwal. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    chart = [[StockChart alloc] initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, 320)];
    [chart loadImagefromURL:[NSURL URLWithString:@"http://chart.finance.yahoo.com/z?s=abt.to&t=1d"]];
    [self.view addSubview:chart];
    
    //Initialize the labels. Touching the label will open the chart corresponding to the label
    
    //Label for 1 day chart
    UILabel *OneDay = [[UILabel alloc] initWithFrame:CGRectMake(15, 10, 30, 20)];
    OneDay.text = @"1d";
    OneDay.tag = 1;
    OneDay.userInteractionEnabled = YES;
    [self.view addSubview:OneDay];
    
    //Label for 5 day chart
    UILabel *FiveDay = [[UILabel alloc] initWithFrame:CGRectMake(45, 10, 30, 20)];
    FiveDay.text = @"5d";
    FiveDay.tag = 2;
    FiveDay.userInteractionEnabled = YES;
    [self.view addSubview:FiveDay];
    
    //Label for 30 day chart
    UILabel *OneMonth = [[UILabel alloc] initWithFrame:CGRectMake(75, 10, 30, 20)];
    OneMonth.text = @"1m";
    OneMonth.tag = 3;
    OneMonth.userInteractionEnabled = YES;
    [self.view addSubview:OneMonth];
    
    //Label for 90 day chart
    UILabel *ThreeMonth = [[UILabel alloc] initWithFrame:CGRectMake(105, 10, 30, 20)];
    ThreeMonth.text = @"3m";
    ThreeMonth.tag = 4;
    ThreeMonth.userInteractionEnabled = YES;
    [self.view addSubview:ThreeMonth];
    
    //Label for 6 month chart
    UILabel *SixMonth = [[UILabel alloc] initWithFrame:CGRectMake(135, 10, 30, 20)];
    SixMonth.text = @"6m";
    SixMonth.tag = 5;
    SixMonth.userInteractionEnabled = YES;
    [self.view addSubview:SixMonth];
    
    //Label for 1 year chart
    UILabel *OneYear = [[UILabel alloc] initWithFrame:CGRectMake(165, 10, 30, 20)];
    OneYear.text = @"1y";
    OneYear.tag = 6;
    OneYear.userInteractionEnabled = YES;
    [self.view addSubview:OneYear];
    
    //Label for 5 year chart
    UILabel *FiveYear = [[UILabel alloc] initWithFrame:CGRectMake(195, 10, 30, 20)];
    FiveYear.text = @"5y";
    FiveYear.tag = 7;
    FiveYear.userInteractionEnabled = YES;
    [self.view addSubview:FiveYear];
    
    //Label for all time chart
    UILabel *allTime = [[UILabel alloc] initWithFrame:CGRectMake(225, 10, 35, 20)];
    allTime.text = @"max";
    allTime.tag = 8;
    allTime.userInteractionEnabled = YES;
    [self.view addSubview:allTime];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    //Detect the tag of the label that was touched, download the stock chart corresponding to that label and display it
    UITouch *touch = [touches anyObject];
    if (touch.view.tag == 1) {
        chart = [[StockChart alloc] initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, 320)];
        //Download 1 day chart
        [chart loadImagefromURL:[NSURL URLWithString:@"http://chart.finance.yahoo.com/z?s=abt.to&t=1d"]];
        [self.view addSubview:chart];
    }
    else if (touch.view.tag == 2) {
        chart = [[StockChart alloc] initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, 320)];
        //Download 5 day chart
        [chart loadImagefromURL:[NSURL URLWithString:@"http://chart.finance.yahoo.com/z?s=abt.to&t=5d"]];
        [self.view addSubview:chart];
    }
    else if (touch.view.tag == 3){
        chart = [[StockChart alloc] initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, 320)];
        //Download 30 day chart
        [chart loadImagefromURL:[NSURL URLWithString:@"http://chart.finance.yahoo.com/z?s=abt.to&t=1m"]];
        [self.view addSubview:chart];
    }
    else if (touch.view.tag == 4) {
        chart = [[StockChart alloc] initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, 320)];
        //Download 90 day chart
        [chart loadImagefromURL:[NSURL URLWithString:@"http://chart.finance.yahoo.com/z?s=abt.to&t=3m"]];
        [self.view addSubview:chart];
    }
    else if (touch.view.tag == 5) {
        chart = [[StockChart alloc] initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, 320)];
        //Download 6 month chart
        [chart loadImagefromURL:[NSURL URLWithString:@"http://chart.finance.yahoo.com/z?s=abt.to&t=6m"]];
        [self.view addSubview:chart];
    }
    else if (touch.view.tag == 6) {
        chart = [[StockChart alloc] initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, 320)];
        //Download 1 year chart
        [chart loadImagefromURL:[NSURL URLWithString:@"http://chart.finance.yahoo.com/z?s=abt.to&t=1y"]];
        [self.view addSubview:chart];
    }
    else if (touch.view.tag == 7) {
        chart = [[StockChart alloc] initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, 320)];
        //Download 5 year chart
        [chart loadImagefromURL:[NSURL URLWithString:@"http://chart.finance.yahoo.com/z?s=abt.to&t=5y"]];
        [self.view addSubview:chart];
    }
    else if (touch.view.tag == 8) {
        chart = [[StockChart alloc] initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, 320)];
        //Download all time chart
        [chart loadImagefromURL:[NSURL URLWithString:@"http://chart.finance.yahoo.com/z?s=abt.to&t=my"]];
        [self.view addSubview:chart];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
