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
        _container = [[UIView alloc]init];
        [super addSubview:_container];
        _direction = ActionDirection_RightToLeft;
        _isContinue = NO;
        _rate = 1;
        [self setClipsToBounds:YES];
        return self;
    }
    return nil;
}
-(void)addSubview:(UIView *)view
{
    [_container addSubview:view];
}

-(void)onceAction
{
    _isContinue = YES;
    float duration = (_containerLayoutSize.width-self.frame.size.width)/100;
    
    CGAffineTransform changeTransform = CGAffineTransformMakeTranslation(-_containerLayoutSize.width+self.frame.size.width, 0);
    CGAffineTransform beginTransform = _container.transform;
    CGAffineTransform original;
    original.a = beginTransform.a;
    original.b = beginTransform.b;
    original.c = beginTransform.c;
    original.d = beginTransform.d;
    original.tx = beginTransform.tx;
    original.ty = beginTransform.ty;
    
    [UIView animateKeyframesWithDuration:duration delay:0 options:UIViewKeyframeAnimationOptionLayoutSubviews animations:^{
        [_container setTransform:changeTransform];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionLayoutSubviews animations:^{
            [_container setTransform:original];
        } completion:^(BOOL finished) {
            _isContinue = NO;
            [self onceAction];
        }];
    }];
}

-(void)layoutSubviews
{
    //计算子视图
    float maxWidth = self.frame.size.width;
    float maxHeight = self.frame.size.height;
    float minOriginX = 0;
    float minOriginY = 0;
    for (UIView* subView in _container.subviews)
    {
        CGRect frame = subView.frame;
        CGSize size = frame.size;
        CGPoint origin = frame.origin;
        minOriginX = minOriginX<origin.x?minOriginX:origin.x;
        minOriginY = minOriginY<origin.y?minOriginY:origin.y;
        maxWidth = maxWidth>origin.x+size.width?maxWidth:(origin.x+size.width);
        maxHeight = maxHeight>origin.y+size.height?maxHeight:(origin.y+size.height);
    }
    for (UIView* subView in _container.subviews)
    {
        [subView setCenterX_sd:subView.centerX_sd - minOriginX];
        [subView setCenterY_sd:subView.centerY_sd - minOriginY];
    }
    
    _containerLayoutSize = CGSizeMake(maxWidth, maxHeight);
    if (_isContinue == NO)[self onceAction];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
