//
//  Column.h
//  Abacus
//
//  Created by Anil K Nellutla on 3/24/14.
//  Copyright (c) 2014 Anil K Nellutla. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Bead.h"

@interface Column : NSObject

//designated initializer
-(instancetype)initWithPlaceValue:(NSUInteger)placeValue beadsPerColumn:(NSUInteger)numOfBeadsPerColumn;

@property (nonatomic) NSUInteger placeValue;
@property (nonatomic) NSUInteger numOfBeadsPerColumn;
@property (strong, nonatomic) NSMutableArray *beads;

@end
