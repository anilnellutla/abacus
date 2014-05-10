//
//  Calculator.m
//  Abacus
//
//  Created by Anil K Nellutla on 4/8/14.
//  Copyright (c) 2014 Anil K Nellutla. All rights reserved.
//

#import "Calculator.h"
#import "Util.h"
#import "Formulae.h"

@interface Calculator()
@property (strong, nonatomic) AddOperation *addOperation;
@property (strong, nonatomic) SubtractOperation *subtractOperation;
@end

@implementation Calculator

-(instancetype) initWithAbacus:(Abacus*)abacus
{
    self = [super init];
    if(self) {
        _abacus = abacus;
        _addOperation = [[AddOperation alloc] initWithAbacus:abacus];
        _subtractOperation = [[SubtractOperation alloc] initWithAbacus:abacus];
    }
    return self;
}

-(void)performAdd:(NSInteger)number
{
    [[self addOperation] add:number to:0];
}

-(void)performSubtract:(NSInteger)number
{
    [[self subtractOperation ]subtract:number];
}

-(void) performAdd:(NSInteger)number1 to:(NSInteger)number2
{
    [[self addOperation] add:number1 to:number2];    
}

-(void) performSubtract:(NSInteger)number1 from:(NSInteger)number2
{
    [[self subtractOperation]subtract:number2 from:number1];
}


@end
