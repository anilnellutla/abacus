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

@property (strong, nonatomic) NSMutableArray *expression;

-(void)addColumn:(Column *)column;

-(void)reset;

-(NSInteger)value;

-(void)add:(NSInteger)value;

@end
