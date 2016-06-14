//
//  ZlmSlideView.h
//  videoTest
//
//  Created by 曾亮敏 on 16/6/14.
//  Copyright © 2016年 zlm. All rights reserved.
//  滑动视图

#import <UIKit/UIKit.h>
typedef enum
{
    ActionDirection_RightToLeft,
    
    
}SlideActionDirection;
@interface ZlmSlideView : UIView
{
    
    
}
@property UIView* container;
@property CGSize containerLayoutSize;
@property SlideActionDirection direction;
@property float rate;
@property BOOL isContinue;
//-(void)
-(void)addSubview:(UIView *)view;
//-(void)beginAction;
@end
