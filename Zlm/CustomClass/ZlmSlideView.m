//
//  ZlmSlideView.m
//  videoTest
//
//  Created by 曾亮敏 on 16/6/14.
//  Copyright © 2016年 zlm. All rights reserved.
//

#import "ZlmSlideView.h"

@implementation ZlmSlideView
-(instancetype)init
{
    self = [super init];
    if (self)
    {
        _container = [UIView new];
        [self addSubview:_container];
        _direction = ActionDirection_RightToLeft;
        return self;
    }
    return nil;
}
-(void)addSubview:(UIView *)view
{
    [_container addSubview:view];
}
-(void)beginAction
{
    
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
