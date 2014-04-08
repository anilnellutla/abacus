//
//  Util.h
//  Abacus
//
//  Created by Anil K Nellutla on 4/7/14.
//  Copyright (c) 2014 Anil K Nellutla. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Util : NSObject
+ (NSInteger) leftMostDigit:(NSInteger)value;
+ (NSInteger) leftMostDigitPlaceValue:(NSInteger)value;
+ (NSArray *) digits:(NSInteger)value;

@end
