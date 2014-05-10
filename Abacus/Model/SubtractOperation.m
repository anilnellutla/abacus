//
//  SubtractOperation.m
//  Abacus
//
//  Created by Anil K Nellutla on 5/10/14.
//  Copyright (c) 2014 Anil K Nellutla. All rights reserved.
//

#import "SubtractOperation.h"

@implementation SubtractOperation

-(void)subtract:(NSInteger)number
{
    [self add:-1*number to:0];
}

-(void)subtract:(NSInteger)number1 from:(NSInteger)number2
{
    [self add:number2 to:-1*number1];
}
@end
