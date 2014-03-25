//
//  Abacus.m
//  Abacus
//
//  Created by Anil K Nellutla on 3/24/14.
//  Copyright (c) 2014 Anil K Nellutla. All rights reserved.
//

#import "Abacus.h"

@implementation Abacus

-(instancetype)initWithNumOfColumns:(NSUInteger)numOfColumns beadsPerColumn:(NSUInteger)numOfBeadsPerColumn
{
    self = [super init];
    if(self) {
        self.numOfColumns = numOfColumns;
        self.numOfBeadsPerColumn = numOfBeadsPerColumn;
        int nextPlaceValue = 1;
        for(int i = 0; i < numOfColumns; i++) {
            Column *column = [[Column alloc] initWithPlaceValue:nextPlaceValue beadsPerColumn:numOfBeadsPerColumn];
            nextPlaceValue *= 10;
            [self.columns addObject:column];
        }
    }
    return self;
}

-(NSMutableArray *) columns {
    if(!_columns) {
        _columns = [[NSMutableArray alloc] init];
    }
    return _columns;
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
    
    return [[Column alloc]initWithPlaceValue:placeValue beadsPerColumn:[self numOfBeadsPerColumn]];
}

@end
