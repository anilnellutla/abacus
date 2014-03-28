//
//  Abacus.m
//  Abacus
//
//  Created by Anil K Nellutla on 3/24/14.
//  Copyright (c) 2014 Anil K Nellutla. All rights reserved.
//

#import "Abacus.h"
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

@end
