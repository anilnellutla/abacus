//
//  AbacusView.m
//  Abacus
//
//  Created by Anil K Nellutla on 3/18/14.
//  Copyright (c) 2014 Anil K Nellutla. All rights reserved.
//

#import "AbacusView.h"
#import "ColumnView.h"
#import "RowView.h"
#import "Column.h"

@implementation AbacusView

static const NSUInteger NUM_OF_COLUMNS = 10;


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    UIBezierPath *backgroundRect = [UIBezierPath bezierPathWithRect:self.bounds];
    [backgroundRect addClip];
    
    //[[UIColor whiteColor] setFill];
    
    //UIRectFill(self.bounds);
    //[backgroundRect fill];
    
    [self drawAbacus:rect];
    
}

-(void)drawAbacus:(CGRect)rect
{    
    UIBezierPath *abacusRect = [UIBezierPath bezierPathWithRect:rect];
    
    //[[UIColor whiteColor] setFill];
    //[abacusRect fill];
    
    //[[UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0] setStroke];
    [[UIColor blackColor] setStroke];
    [abacusRect stroke];
    
    _abacus = [[Abacus alloc] init];
    
    [self drawRow:rect];

    [self drawColumns:rect];
    
    NSLog(@"drawAbacus completed");
    
}

-(void)drawColumns:(CGRect)rect
{
    CGFloat columnWidth = rect.size.width/(NUM_OF_COLUMNS + 1);
    CGFloat columnGap = columnWidth / (NUM_OF_COLUMNS);
    CGFloat pathX = rect.size.width - columnWidth - columnGap;
    int placeValue = 1;
    for(int i = 0; i < NUM_OF_COLUMNS; i++) {
        CGRect columnFrame = CGRectMake(pathX, rect.origin.y, columnWidth, rect.size.height);
        ColumnView *columnView = [[ColumnView alloc] initWithFrame:columnFrame];
        Column *column = [[Column alloc] initWithPlaceValue:placeValue];
        columnView.column = column;
        [self addSubview:columnView];
        
        [self.abacus addColumn:column];
        
        pathX = pathX - columnWidth - columnGap;
        placeValue *= 10;
    }
}

-(void)drawRow:(CGRect)rect
{
    CGFloat columnHeight = rect.size.height/7;
    CGRect rowFrame = CGRectMake(rect.origin.x, rect.origin.y + (columnHeight * 2), rect.size.width, 1);
    RowView *rowView = [[RowView alloc] initWithFrame:rowFrame];
    [self addSubview:rowView];
}

#pragma mark - Initialization

- (void)setUp
{
    //self.backgroundColor = nil;
    self.opaque = NO;
    self.contentMode = UIViewContentModeRedraw;
}

- (void)awakeFromNib
{
    [self setUp];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

@end
