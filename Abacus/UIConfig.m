//
//  UIConstraints.m
//  Abacus
//
//  Created by Anil K Nellutla on 4/15/14.
//  Copyright (c) 2014 Anil K Nellutla. All rights reserved.
//

#import "UIConfig.h"

@implementation UIConfig

#define NUMBER_VIEW_ORIGIN_X_OFFSET 3
#define NUMBER_VIEW_ORIGIN_Y_OFFSET 3
#define NUMBER_VIEW_WIDTH_SCALE_FACTOR 0.95
#define NUMBER_VIEW_HEIGHT_SCALE_FACTOR 0.08

#define ABACUS_VIEW_ORIGIN_X_OFFSET 3
#define ABACUS_VIEW_ORIGIN_Y_OFFSET 3
#define ABACUS_VIEW_WIDTH_SCALE_FACTOR 0.95

#define NUM_OF_COLUMNS 10


+(CGRect) getNumberViewBounds:(CGRect)containerViewBounds
{
    return CGRectMake(NUMBER_VIEW_ORIGIN_X_OFFSET,
                      NUMBER_VIEW_ORIGIN_Y_OFFSET,
                      NUMBER_VIEW_WIDTH_SCALE_FACTOR * containerViewBounds.size.width,
                      NUMBER_VIEW_HEIGHT_SCALE_FACTOR * containerViewBounds.size.height);

}

+(CGRect) getAbacusViewBounds:(CGRect)containerViewBounds
{
    return CGRectMake(ABACUS_VIEW_ORIGIN_X_OFFSET,
                      NUMBER_VIEW_ORIGIN_Y_OFFSET +
                      NUMBER_VIEW_HEIGHT_SCALE_FACTOR * containerViewBounds.size.height +
                      ABACUS_VIEW_ORIGIN_Y_OFFSET,
                      ABACUS_VIEW_WIDTH_SCALE_FACTOR * containerViewBounds.size.width,
                      containerViewBounds.size.height - NUMBER_VIEW_HEIGHT_SCALE_FACTOR * containerViewBounds.size.height);
}

+(CGRect)getRowViewBounds:(CGRect)abacusViewBounds
{
    return CGRectMake(abacusViewBounds.origin.x,
                      abacusViewBounds.origin.y + ((abacusViewBounds.size.height/7) * 2),
                      abacusViewBounds.size.width,
                      3);
}

+(NSInteger)getNumOfColumns
{
    return NUM_OF_COLUMNS;
}

+(CGFloat)getColumnViewWidth:(CGRect)abacusViewBounds
{
    return abacusViewBounds.size.width/(NUM_OF_COLUMNS + 1);
}

+(CGFloat)getColumnViewGap:(CGRect)abacusViewBounds
{
    return [self getColumnViewWidth:abacusViewBounds]/(NUM_OF_COLUMNS);
}

+(CGFloat)getColumnViewHeight:(CGRect)abacusViewBounds
{
    return abacusViewBounds.size.height;
}

+(CGRect)getColumnViewBounds:(CGRect)abacusViewBounds forColumn:(NSInteger)columnNumber
{
    CGFloat columnViewWidth = [self getColumnViewWidth:abacusViewBounds];
    CGFloat columnViewGap = [self getColumnViewGap:abacusViewBounds];
    CGFloat columnnViewHeight = [self getColumnViewHeight:abacusViewBounds];
    
    CGFloat originX = abacusViewBounds.size.width - columnNumber * columnViewWidth - columnNumber * columnViewGap;
    CGFloat originY = abacusViewBounds.origin.y;
    return CGRectMake(originX,
                      originY,
                      columnViewWidth,
                      columnnViewHeight);
}

+(CGRect)getColumnBounds:(CGRect)columnViewBounds
{
    CGFloat columnWidth = 2;
    CGFloat originX = columnViewBounds.origin.x + (columnViewBounds.size.width - columnWidth)/2;
    return CGRectMake(originX, columnViewBounds.origin.y, columnWidth, columnViewBounds.size.height);
}


@end
