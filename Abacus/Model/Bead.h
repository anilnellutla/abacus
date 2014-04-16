//
//  Bead.h
//  Abacus
//
//  Created by Anil K Nellutla on 3/17/14.
//  Copyright (c) 2014 Anil K Nellutla. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Bead : NSObject

@property (nonatomic) NSInteger beadIndex;
@property (nonatomic) NSInteger placeValue;
@property (nonatomic, getter = isSet) BOOL set;

//designated initializer
-(instancetype)initWithPlaceValue:(NSInteger)placeValue beadIndex:(NSInteger)beadIndex;

// values would be 0, 1, 5, 10, 50, 100, 500...
-(NSInteger) getValue;

@end
