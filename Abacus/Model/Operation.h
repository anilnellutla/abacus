//
//  Operation.h
//  Abacus
//
//  Created by Anil K Nellutla on 5/10/14.
//  Copyright (c) 2014 Anil K Nellutla. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Abacus.h"

@interface Operation : NSObject

@property (strong, nonatomic) NSMutableArray *expression;
@property (strong, nonatomic) Abacus *abacus;

-(void)resetExpression;


@end
