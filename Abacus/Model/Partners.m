//
//  Partners.m
//  Abacus
//
//  Created by Anil K Nellutla on 4/7/14.
//  Copyright (c) 2014 Anil K Nellutla. All rights reserved.
//

#import "Partners.h"
@implementation Partners

-(instancetype)initWithOperands:(NSInteger)operand1 and:(NSInteger)operand2
{
    self = [super init];
    if(self) {
        _operand1 = operand1;
        _operand2 = operand2;
    }
    return self;
}
@end
