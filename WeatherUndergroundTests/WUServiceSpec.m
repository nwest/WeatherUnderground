//
//  WUServiceTestSpec.m
//  WeatherUnderground
//
//  Created by Nate West on 4/25/14.
//  Copyright (c) 2014 Nate West. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import <AFNetworking.h>
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
            service.manager = [AFHTTPRequestOperationManager nullMock];
            [[viewController shouldEventually] receive:@selector(updateViewWithTemp:)];
            KWCaptureSpy *spy = [service.manager captureArgument:@selector(GET:parameters:success:failure:) atIndex:2];
            [service fetchTemperatureInDetroit:viewController];
            void (^block)(AFHTTPRequestOperation *operation, id responseObject) = spy.argument;
            block(nil, nil);
        });
        
        it(@"Has a request manager", ^{
            WUService *service = [[WUService alloc]init];
            [[service.manager shouldNot] beNil];
        });
        
        it(@"if update fails, updateViewWithTemp is not called", ^{
            WUService *service = [[WUService alloc] init];
            WUViewController *viewController = [[WUViewController alloc] init];
            
            service.manager = [AFHTTPRequestOperationManager nullMock];
            KWCaptureSpy *spy = [service.manager captureArgument:@selector(GET:parameters:success:failure:) atIndex:3];
            [[viewController shouldNotEventually] receive:@selector(updateViewWithTemp:)];
            [service fetchTemperatureInDetroit:viewController];
            void (^block)(AFHTTPRequestOperation *operation, NSError *error) = spy.argument;
            block(nil, nil);
        });
        
        it(@"uses the right URL for the temp request", ^{
            WUService *service = [[WUService alloc] init];
            service.manager = [AFHTTPRequestOperationManager nullMock];
            KWCaptureSpy *spy = [service.manager captureArgument:@selector(GET:parameters:success:failure:) atIndex:0];
            [service fetchTemperatureInDetroit:nil];
            NSString *URL = spy.argument;
            [[URL should] equal:@"http://api.wunderground.com/api/15fa62f52afda546/conditions/q/MI/Detroit.json"];
        });
        
        it(@"feeds the temp reading from the response object to the viewcontroller", ^{
            WUService *service = [[WUService alloc] init];
            WUViewController *viewController = [[WUViewController alloc] init];
            service.manager = [AFHTTPRequestOperationManager nullMock];
            KWCaptureSpy *spy = [service.manager captureArgument:@selector(GET:parameters:success:failure:) atIndex:2];
            
            NSDictionary *responseObject = @{@"current_observation": @{@"temp_f": @46.2}};
            [[viewController should] receive:@selector(updateViewWithTemp:) withArguments:@"46.2 degrees"];
            [service fetchTemperatureInDetroit:viewController];
            void (^block)(AFHTTPRequestOperation *operation, id responseObject) = spy.argument;
            block(nil, responseObject);
        });
    });
	
SPEC_END
