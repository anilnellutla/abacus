//
//  ColumnView.h
//  Abacus
//
//  Created by Anil K Nellutla on 3/23/14.
//  Copyright (c) 2014 Anil K Nellutla. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Column.h"

@interface ColumnView : UIView

@property (nonatomic) NSInteger placeValue;
// designated initializer
- (id)initWithFrame:(CGRect)frame placeValue:(NSInteger)placeValue;

@end
