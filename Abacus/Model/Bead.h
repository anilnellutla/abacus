//
//  Bead.h
//  Abacus
//
//  Created by Anil K Nellutla on 3/17/14.
//  Copyright (c) 2014 Anil K Nellutla. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Bead : NSObject

//designated initializer
-(instancetype)initWithValue:(NSUInteger)value;

@property (nonatomic) NSUInteger value;
@end
