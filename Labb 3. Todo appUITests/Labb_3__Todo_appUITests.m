//
//  Labb_3__Todo_appUITests.m
//  Labb 3. Todo appUITests
//
//  Created by Victor Jonasson on 2021.
//  Copyright © 2021 Victor Jonasson. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface Labb_3__Todo_appUITests : XCTestCase

@end

@implementation Labb_3__Todo_appUITests

- (void)setUp {

    self.continueAfterFailure = NO;

}

- (void)tearDown {

}

- (void)testExample {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app launch];

}

- (void)testLaunchPerformance {
    if (@available(macOS 10.15, iOS 13.0, tvOS 13.0, *)) {
        [self measureWithMetrics:@[XCTOSSignpostMetric.applicationLaunchMetric] block:^{
            [[[XCUIApplication alloc] init] launch];
        }];
    }
}

@end
