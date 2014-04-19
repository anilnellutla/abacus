//
//  ContainerView.m
//  Abacus
//
//  Created by Anil K Nellutla on 4/10/14.
//  Copyright (c) 2014 Anil K Nellutla. All rights reserved.
//

#import "ContainerView.h"
#import "NumberView.h"
#import "AbacusView.h"
#import "UIConfig.h"

@implementation ContainerView

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


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGRect numberViewbounds = [UIConfig getNumberViewBounds:rect];
    NumberView *numberView = [[NumberView alloc] initWithFrame:numberViewbounds];
    [self addSubview:numberView];
    
    CGRect abacusViewbounds = [UIConfig getAbacusViewBounds:rect];
    AbacusView *abacusView = [[AbacusView alloc] initWithFrame:abacusViewbounds];
    [self addSubview:abacusView];
    
}


@end
