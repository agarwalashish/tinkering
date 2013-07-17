//
//  StockChart.m
//  YahooCharts
//
//  Created by Ashish Agarwal on 2013-04-09.
//  Copyright (c) 2013 Ashish Agarwal. All rights reserved.
//

#import "StockChart.h"

@implementation StockChart
@synthesize fill;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        activityIndicator.frame = CGRectMake(((frame.size.width)-20)/2, ((frame.size.height)-20/2), 20, 20);
        
        //Hide the activity indicator when download is complete
        activityIndicator.hidesWhenStopped = YES;
        [activityIndicator startAnimating];
        [self addSubview:activityIndicator];
    }
    return self;
}

-(void)loadImagefromURL:(NSURL *)url{
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLCacheStorageAllowed timeoutInterval:1.0];
    connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
}

-(void)connection:(NSURLConnection*)theConnection didReceiveData:(NSData *)incrementalData{
    if (data == nil) {
        //Create NSMutableData to hold the downloaded data
        data = [[NSMutableData alloc] initWithCapacity:2048];
    }
    [data appendData:incrementalData];
}

-(void)connectionDidFinishLoading:(NSURLConnection*)theConnection{
    //data will now have the entire image
    [activityIndicator stopAnimating];
    connection = nil;
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    imageView.image = [UIImage imageWithData:data];
    
    if (fill) {
        imageView.contentMode = UIViewContentModeScaleAspectFill;
    } else{
        imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    
    [self addSubview:imageView];
    data = nil;
    
}

-(void)connection:(NSURLConnection*)connection didFailWithError:(NSError *)error{
    [activityIndicator stopAnimating];
}


@end
