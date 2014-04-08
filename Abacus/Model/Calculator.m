//
//  Calculator.m
//  Abacus
//
//  Created by Anil K Nellutla on 4/8/14.
//  Copyright (c) 2014 Anil K Nellutla. All rights reserved.
//

#import "Calculator.h"
#import "Util.h"

@interface Calculator()
@property (strong, nonatomic) Abacus *abacus;
@end

@implementation Calculator

-(instancetype) initWithAbacus:(Abacus*)abacus
{
    self = [super init];
    if(self) {
        _abacus = abacus;
    }
    return self;
}

-(NSInteger) add:(NSInteger)number
{
    return [self add:number to:0];
}

-(NSInteger) add:(NSInteger)number1 to:(NSInteger)number2
{
    NSArray *digits = [Util digits:number1];
    for(NSNumber *digit in digits) {
        [[self abacus] add:digit.longValue];
    }
    
    digits = [Util digits:number2];
    for(NSNumber *digit in digits) {
        [[self abacus] add:digit.longValue];
    }
    
    return [[self abacus] value];
}

-(NSInteger) subtract:(NSInteger)number1 from:(NSInteger)number2
{
    return [self add:number2 to:-1*number1];
}


@end
