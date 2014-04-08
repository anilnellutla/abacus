//
//  AbacusTests.m
//  AbacusTests
//
//  Created by Anil K Nellutla on 3/17/14.
//  Copyright (c) 2014 Anil K Nellutla. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Util.h"

@interface AbacusTests : XCTestCase

@end

@implementation AbacusTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    //XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}

- (void)testLeftMostDigit
{
    NSInteger value = -345734534058340;
    NSInteger leftMostDigit = [Util leftMostDigit:value];
    NSLog(@"value = %ld leftMostDigit = %ld", value, leftMostDigit);
}

- (void)testDigits
{
    NSInteger value = 349898;
    NSArray *digits = [Util digits:value];
    for(NSNumber *digit in digits) {
        NSLog(@"digit %ld", [digit longValue]);
    }
}

@end
