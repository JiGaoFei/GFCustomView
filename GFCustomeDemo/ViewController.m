//
//  ViewController.m
//  GFCustomeDemo
//
//  Created by 纪高飞 on 18/1/31.
//  Copyright © 2018年 纪高飞. All rights reserved.
//

#import "ViewController.h"
#import "GFCustomView.h"
#import <Masonry/Masonry.h>
@interface ViewController ()
@end
@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // 加载UI
    [self setUpUI];
}
- (void)setUpUI{
   // 创建标题和左副标题
    GFCustomView *titleAndLeftTiteView = [[GFCustomView alloc] init];
    titleAndLeftTiteView.titleLab.text = @"姓名";
    titleAndLeftTiteView.leftViceLab.text =@"GF";
    titleAndLeftTiteView.leftViceLab.textColor = [UIColor grayColor];
    titleAndLeftTiteView.gfCustomType = GFH_Title_LeftViceTitle;
    [self.view addSubview:titleAndLeftTiteView];
    
    // 布局标题和左副标题
    [titleAndLeftTiteView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.top.equalTo(self.view.mas_top).offset(64);
        make.right.equalTo(self.view.mas_right);
        make.height.equalTo(@50);
    }];
    
    // 创建标题和左副标题 右箭头
    GFCustomView *titleAndLeftTiteArrowView = [[GFCustomView alloc] init];
    titleAndLeftTiteArrowView .titleLab.text = @"姓名";
    titleAndLeftTiteArrowView .leftViceLab.text =@"GF";
    titleAndLeftTiteArrowView .leftViceLab.textColor = [UIColor grayColor];
    titleAndLeftTiteView.rightArrowImageView.image = [UIImage imageNamed:@"pub_ic_arrow"];
    titleAndLeftTiteArrowView.gfCustomType = GFH_Title_LeftViceTitleAndArrow;
    [self.view addSubview:titleAndLeftTiteArrowView ];
    
    // 布局标题和左副标题 右箭头
    [titleAndLeftTiteArrowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.top.equalTo(titleAndLeftTiteView.mas_bottom);
        make.right.equalTo(self.view.mas_right);
        make.height.equalTo(@50);
    }];
    
    
    // 创建标题和右副标题
    GFCustomView *titleAndRightTiteView = [[GFCustomView alloc] init];
    titleAndRightTiteView.titleLab.text = @"姓名";
    titleAndRightTiteView.rightViceLab.text =@"GF";
    titleAndRightTiteView.rightViceLab.textColor = [UIColor grayColor];
    titleAndRightTiteView.gfCustomType = GFH_Title_RightViceTitle;
    [self.view addSubview:titleAndRightTiteView];
    
    // 布局标题和右副标题
    [titleAndRightTiteView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.top.equalTo(titleAndLeftTiteArrowView.mas_bottom);
        make.right.equalTo(self.view.mas_right);
        make.height.equalTo(@50);
    }];
    
    // 创建标题和右副标题箭头
    GFCustomView *titleAndRightTiteArrowView = [[GFCustomView alloc] init];
    titleAndRightTiteArrowView .titleLab.text = @"姓名";
    titleAndRightTiteArrowView .rightViceLab.text =@"GF";
    titleAndRightTiteArrowView .rightViceLab.textColor = [UIColor grayColor];
    titleAndRightTiteArrowView.gfCustomType = GFH_Title_RightViceTitleAndArrow;
    [self.view addSubview:titleAndRightTiteArrowView ];
    
    // 布局标题和右副标题
    [titleAndRightTiteArrowView  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.top.equalTo(titleAndRightTiteView.mas_bottom);
        make.right.equalTo(self.view.mas_right);
        make.height.equalTo(@50);
    }];
    
    // 创建标题和左副输入框
    GFCustomView *titleAndleftTFView = [[GFCustomView alloc] init];
    titleAndleftTFView .titleLab.text = @"姓名";
    titleAndleftTFView .leftViceTextField.placeholder = @"请输入姓名";
    titleAndleftTFView .rightViceLab.textColor = [UIColor grayColor];
    titleAndleftTFView.gfCustomType = GFH_Title_LeftTextField;
    [self.view addSubview:titleAndleftTFView ];
    
    // 布局标题和左副输入框
    [titleAndleftTFView  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.top.equalTo(titleAndRightTiteArrowView.mas_bottom);
        make.right.equalTo(self.view.mas_right);
        make.height.equalTo(@50);
    }];
    
    // 创建标题和右副图  右箭头
    GFCustomView *titleAndRightImgeAndArrow= [[GFCustomView alloc] init];
    titleAndRightImgeAndArrow .titleLab.text = @"姓名";
    titleAndRightImgeAndArrow.gfCustomType = GFH_Title_RightViceimageViewAndArrow;
    titleAndRightImgeAndArrow.rightViceImageView.image = [UIImage imageNamed:@"my_ic_qrcard"];
    titleAndRightImgeAndArrow.rightArrowImageView.image = [UIImage imageNamed:@"pub_ic_arrow"];
    [self.view addSubview:titleAndRightImgeAndArrow ];
    
    // 布局标题和右副图 右箭头
    [titleAndRightImgeAndArrow  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.top.equalTo(titleAndleftTFView.mas_bottom);
        make.right.equalTo(self.view.mas_right);
        make.height.equalTo(@50);
    }];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
