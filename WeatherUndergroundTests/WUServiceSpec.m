//
//  WUServiceTestSpec.m
//  WeatherUnderground
//
//  Created by Nate West on 4/25/14.
//  Copyright (c) 2014 Nate West. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "WUService.h"

SPEC_BEGIN(WUServiceSpec)

    describe(@"WUService", ^{
		it(@"responds to a weather update request", ^{
            WUService *service = [[WUService alloc] init];
            [[service should] respondToSelector:@selector(fetchTemperatureInDetroit:)];
        });
        
        it(@"when update request made, sends update to requesting view controller", ^{
            WUService *service = [[WUService alloc] init];
            WUViewController *viewController = [[WUViewController alloc] init];
            [[viewController should] receive:@selector(updateViewWithTemp:)];
            [service fetchTemperatureInDetroit:viewController];
        });
    });
	
SPEC_END
