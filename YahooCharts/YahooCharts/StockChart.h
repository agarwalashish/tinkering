//
//  StockChart.h
//  YahooCharts
//
//  Created by Ashish Agarwal on 2013-04-09.
//  Copyright (c) 2013 Ashish Agarwal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StockChart : UIView{
    NSURLConnection *connection;
    
    //collect the data as it is downloaded
    NSMutableData *data;
    
    UIActivityIndicatorView *activityIndicator;
    Boolean fill;
}
@property(nonatomic, assign)Boolean fill;

-(void)loadImagefromURL:(NSURL*)url;

@end
