//
//  WUService.m
//  WeatherUnderground
//
//  Created by Nate West on 4/25/14.
//  Copyright (c) 2014 Nate West. All rights reserved.
//

#import "WUService.h"

@implementation WUService

- (void)fetchTemperatureInDetroit:(WUViewController *) requester {
    [requester updateViewWithTemp:@"57.0 degrees"];
    
}

@end
