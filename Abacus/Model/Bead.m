//
//  Bead.m
//  Abacus
//
//  Created by Anil K Nellutla on 3/17/14.
//  Copyright (c) 2014 Anil K Nellutla. All rights reserved.
//

#import "Bead.h"

@implementation Bead

-(instancetype)initWithPlaceValue:(NSInteger)placeValue beadIndex:(NSInteger)beadIndex
{
    self = [super init];
    if(self) {
        _placeValue = placeValue;
        _beadIndex = beadIndex;
        _set = NO;
    }
    return self;
}

-(NSInteger) getValue
{
    if([self isSet]) {
        if([self beadIndex] == 5) {
            return [self placeValue] * 5;
        }
        return [self placeValue] * 1;
    }
    return 0;
}

@end
