//
//  WUViewControllerSpec.m
//  WeatherUnderground
//
//  Created by Nate West on 4/25/14.
//  Copyright (c) 2014 Nate West. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "WUViewController.h"
#import "WUService.h"
#import <objc/runtime.h>

SPEC_BEGIN(WUViewControllerSpec)

    describe(@"WUViewController", ^{
		
        it (@"should have a non-nil service property", ^{
            WUViewController *viewController = [WUViewController new];
            [[viewController.service shouldNot]beNil];
        });
        
        it(@"label is updated when updateTemp method is called", ^{
            WUViewController *viewController = [WUViewController new];
            viewController.mylabel = [UILabel nullMock];
            [[viewController.mylabel should] receive:@selector(setText:) withArguments:@"55"];
            [viewController updateViewWithTemp:@"55"];
        });
    });
	
SPEC_END
