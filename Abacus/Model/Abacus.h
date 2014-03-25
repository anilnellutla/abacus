//
//  Abacus.h
//  Abacus
//
//  Created by Anil K Nellutla on 3/24/14.
//  Copyright (c) 2014 Anil K Nellutla. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Column.h"

@interface Abacus : NSObject

//designated initializer
-(instancetype)initWithNumOfColumns:(NSUInteger)numOfColumns beadsPerColumn:(NSUInteger)numOfBeadsPerColumn;

@property (nonatomic) NSUInteger numOfColumns;
@property (nonatomic) NSUInteger numOfBeadsPerColumn;
@property (strong, nonatomic) NSMutableArray *columns;

-(void)reset;
-(NSInteger)value;
-(Column *)column:(NSUInteger)placeValue;
@end
