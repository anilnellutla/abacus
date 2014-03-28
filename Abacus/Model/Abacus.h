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

-(void)addColumn:(Column *)column;
-(void)reset;
-(NSInteger)value;
-(Column *)column:(NSUInteger)placeValue;
@end
