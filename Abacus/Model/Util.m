//
//  Util.m
//  Abacus
//
//  Created by Anil K Nellutla on 4/7/14.
//  Copyright (c) 2014 Anil K Nellutla. All rights reserved.
//

#import "Util.h"

@implementation Util

+ (NSInteger)leftMostDigit:(NSInteger)value
{
    NSInteger inputValue = ABS(value);
    while (inputValue >= 10) {
        inputValue /= 10;
    }
    if(value >= 0) {
        return inputValue;
    } else {
        return -1 * inputValue;
    }
}

+ (NSInteger)leftMostDigitPlaceValue:(NSInteger)value
{
    NSInteger inputValue = ABS(value);
    NSInteger placeValue = 1;
    while (inputValue >= 10) {
        inputValue /= 10;
        placeValue *= 10;
    }
    return placeValue;
}

+ (NSArray *)digits:(NSInteger)value
{
    NSInteger inputValue = ABS(value);
    int numOfDigits = 1;
    while (inputValue >= 10) {
        inputValue /= 10;
        numOfDigits++;
    }
    inputValue = ABS(value);
    NSMutableArray *digits = [[NSMutableArray alloc] initWithCapacity:numOfDigits];
    NSInteger placeValue = 1;
    while (inputValue != 0) {
        NSInteger digit = (inputValue % 10) * placeValue;
        if (value >= 0) {
            [digits addObject:[[NSNumber alloc] initWithLong:digit]];
        } else {
            [digits addObject:[[NSNumber alloc] initWithLong:-1 * digit]];
        }
        inputValue /= 10;
        placeValue *= 10;
    }
    return [[digits reverseObjectEnumerator] allObjects];
}
@end
