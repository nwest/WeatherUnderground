//
//  WUViewController.m
//  WeatherUnderground
//
//  Created by Nate West on 4/25/14.
//  Copyright (c) 2014 Nate West. All rights reserved.
//

#import "WUViewController.h"
#import "WUService.h"

@interface WUViewController ()

@end

@implementation WUViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.service = [[WUService alloc]init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)updateViewWithTemp:(NSString *)temp
{
    self.mylabel.text = temp;
}

@end
