//
//  DigitView.h
//  Abacus
//
//  Created by Anil K Nellutla on 4/23/14.
//  Copyright (c) 2014 Anil K Nellutla. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DigitView : UIView
@property (nonatomic) NSInteger placeValue;
@property (nonatomic) NSInteger digit;
// designated initializer
- (id)initWithFrame:(CGRect)frame placeValue:(NSInteger)placeValue;

@end
