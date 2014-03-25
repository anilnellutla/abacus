//
//  Bead.m
//  Abacus
//
//  Created by Anil K Nellutla on 3/17/14.
//  Copyright (c) 2014 Anil K Nellutla. All rights reserved.
//

#import "Bead.h"

@implementation Bead

-(instancetype)initWithValue:(NSUInteger)value
{
    self = [super init];
    if(self) {
        self.value = value;
    }
    return self;
}

-(BOOL)isSet
{    
    return (_value == 0) ? NO : YES;
}
@end
