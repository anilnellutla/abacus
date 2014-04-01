//
//  Bead.m
//  Abacus
//
//  Created by Anil K Nellutla on 3/17/14.
//  Copyright (c) 2014 Anil K Nellutla. All rights reserved.
//

#import "Bead.h"

@implementation Bead

-(instancetype)initWithValue:(NSInteger)value index:(NSUInteger)index
{
    self = [super init];
    if(self) {
        _value = value;
        _index = index;
    }
    return self;
}

-(BOOL)isSet
{    
    return (_value == 0) ? NO : YES;
}
@end
