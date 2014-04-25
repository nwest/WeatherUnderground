//
//  WUService.h
//  WeatherUnderground
//
//  Created by Nate West on 4/25/14.
//  Copyright (c) 2014 Nate West. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WUViewController.h"

@interface WUService : NSObject

- (void)fetchTemperatureInDetroit:(WUViewController *) requester;

@end
