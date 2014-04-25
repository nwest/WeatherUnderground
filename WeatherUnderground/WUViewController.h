//
//  WUViewController.h
//  WeatherUnderground
//
//  Created by Nate West on 4/25/14.
//  Copyright (c) 2014 Nate West. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WUService;
@interface WUViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *mylabel;
@property (strong, nonatomic) WUService *service;

- (void)updateViewWithTemp:(NSString *)temp;

@end
