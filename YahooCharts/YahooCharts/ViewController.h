//
//  ViewController.h
//  YahooCharts
//
//  Created by Ashish Agarwal on 2013-04-09.
//  Copyright (c) 2013 Ashish Agarwal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StockChart.h"

@interface ViewController : UIViewController <NSURLConnectionDelegate>{
    UIImageView *stockChartImageView;
    StockChart *chart;
}




@end
