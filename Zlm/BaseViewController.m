//
//  BaseViewController.m
//  Zlm
//
//  Created by 曾亮敏 on 16/6/14.
//  Copyright © 2016年 zlm. All rights reserved.
//

#import "BaseViewController.h"
#import "ZlmSlideView.h"
@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    ZlmSlideView* slideView = [[ZlmSlideView alloc]init];
    [self.view addSubview:slideView];
    slideView.sd_layout.leftSpaceToView(self.view,20).topSpaceToView(self.view,60).heightRatioToView(self.view,0.5).rightSpaceToView(self.view,60);
    [slideView setBackgroundColor:[UIColor lightGrayColor]];
    
    UILabel* label = [UILabel new];
    [slideView addSubview:label];
    [label setSingleLineAutoResizeWithMaxWidth:4000];
    label.sd_layout.centerXEqualToView(slideView);
    [label setText:@"987654321小倩小9987654321小倩小9987654321小倩小9987654321小倩小9987654321小倩小9987654321小倩小9987654321小倩小9987654321小倩小9987654321小倩小9987654321小倩小9987654321小倩小9987654321小倩小9"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
