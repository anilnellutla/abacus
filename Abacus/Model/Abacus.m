//
//  Abacus.m
//  Abacus
//
//  Created by Anil K Nellutla on 3/24/14.
//  Copyright (c) 2014 Anil K Nellutla. All rights reserved.
//

#import "Abacus.h"
#import "Util.h"
#import "Formulae.h"

@interface Abacus()
@property (strong, nonatomic) NSMutableArray *columns;
@end

@implementation Abacus

-(NSMutableArray *)columns
{
    if(!_columns) {
        _columns = [[NSMutableArray alloc]initWithCapacity:10];
    }
    return _columns;
}

-(NSMutableArray *)expression
{
    if(!_expression) {
        _expression = [[NSMutableArray alloc]initWithCapacity:10];
    }
    return _expression;
}

-(void)addColumn:(Column *)column
{
    [self.columns addObject:column];
}

-(void)reset
{
    for(Column *column in self.columns) {
        [column reset];
    }
}

-(NSInteger)value
{
    NSInteger value = 0;
    for(Column *column in self.columns) {
        value += [column value];
    }
    return value;
}

-(Column *)column:(NSUInteger)placeValue
{
    for(Column *column in self.columns) {
        if([column placeValue] == placeValue) {
            return column;
        }
    }
    
    return nil;
}

-(void)setColumnValue:(NSInteger)value
{
    NSInteger placeValue = [Util leftMostDigitPlaceValue:value];
    [[self column:placeValue] setValue:value];
}

-(NSInteger) getColumnValue:(NSInteger)placeValue
{
    return [[self column:placeValue] value];
}

-(BOOL)isPartnerNeeded:(NSInteger)value
{
    NSInteger placeValue = [Util leftMostDigitPlaceValue:value];
    return [[self column:placeValue ] isPartnerNeeded:value];
}

-(void)add:(NSInteger)value
{
    [self setValue:value];
}

-(void)setValue:(NSInteger)value
{
    if ([self isPartnerNeeded:value]) {
        Partners *partners = [Formulae getPartners:value];
        if ([self isPartnerNeeded:[partners operand1]]) {
            [self setValue:[partners operand1]];
        } else {
            [[self expression] addObject:[[NSNumber alloc] initWithInteger:[partners operand1]]];
            [self setColumnValue:[partners operand1]];
        }
        
        if ([self isPartnerNeeded:[partners operand2]]) {
            [self setValue:[partners operand2]];
        } else {
            [[self expression] addObject:[[NSNumber alloc] initWithInteger:[partners operand2]]];
            [self setColumnValue:[partners operand2]];
        }
    } else {
        [[self expression] addObject:[[NSNumber alloc] initWithInteger:value]];
        [self setColumnValue:value];
    }
}

-(void) resetExpression
{
    [[self expression] removeAllObjects];
}
@end
