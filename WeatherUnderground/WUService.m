//
//  WUService.m
//  WeatherUnderground
//
//  Created by Nate West on 4/25/14.
//  Copyright (c) 2014 Nate West. All rights reserved.
//

#import "WUService.h"

@implementation WUService

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.manager = [[AFHTTPRequestOperationManager alloc] init];
    }
    return self;
}

- (void)fetchTemperatureInDetroit:(WUViewController *) requester {
    
    NSString *undergroundURL = @"http://api.wunderground.com/api/15fa62f52afda546/conditions/q/MI/Detroit.json";
    
    [self.manager GET:undergroundURL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString *temp = [NSString stringWithFormat:@"%@ degrees",[self getTemp:responseObject]];
        [requester updateViewWithTemp:temp];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        // it failed
    }];
}

- (NSNumber *)getTemp:(id)responseObject {
    return responseObject[@"current_observation"][@"temp_f"];
}
    
@end
