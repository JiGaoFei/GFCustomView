//
//  GFCustomView.h
//  GFCustomeDemo
//
//  Created by 纪高飞 on 18/1/31.
//  Copyright © 2018年 纪高飞. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM (NSInteger, GFCustomViewType)   {
    // 主标题和左副标题
    GFH_Title_LeftViceTitle,
    // 主标题和左副标题 和箭头
    GFH_Title_LeftViceTitleAndArrow,
    // 主标题和右副标题
    GFH_Title_RightViceTitle,
    // 主标题和右副标题 右箭头
    GFH_Title_RightViceTitleAndArrow,
    // 主标题和右副标题 右箭头
    GFH_Title_RightViceimageViewAndArrow,
    // 主标题和左输入框
    GFH_Title_LeftTextField,
};
@interface GFCustomView : UIView
/**主按钮*/
@property (nonatomic,strong) UIButton *mainBtn;
/**类型*/
@property (nonatomic,assign) GFCustomViewType gfCustomType;
/**标题*/
@property (nonatomic,strong) UILabel *titleLab;
/**左副标题*/
@property (nonatomic,strong) UILabel *leftViceLab;
/**左副输入框*/
@property (nonatomic,strong) UITextField *leftViceTextField;
/**右副标题*/
@property (nonatomic,strong) UILabel *rightViceLab;
/**右副图*/
@property (nonatomic,strong) UIImageView *rightViceImageView;
/**右箭头*/
@property (nonatomic,strong) UIImageView *rightArrowImageView;
/**左边间距*/
@property (nonatomic,assign) CGFloat leftMargin;
/**主标题距左副标题间隔*/
@property (nonatomic,assign) CGFloat leftAndViceMargin;
/**右边间距*/
@property (nonatomic,assign) CGFloat rightMargin;
@end
