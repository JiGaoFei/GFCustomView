//
//  GFSignatureView.h
//  GFCustomeDemo
//
//  Created by 孙行者网络 on 2018/3/3.
//  Copyright © 2018年 纪高飞. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol GFSignatureViewDelegate<NSObject>
/**提交传出生成的图片*/
- (void)gf_submitAction:(UIImage *)gfSignatureImage;
@end
@interface GFSignatureView : UIView
/**撤销*/
@property (nonatomic,strong) UIButton *undoButton;
/**重新签*/
@property (nonatomic,strong) UIButton *redrawButton;
/**标题*/
@property (nonatomic,strong) UILabel *titleLabel;
/**提交按钮*/
@property (nonatomic,strong) UIButton *submitButton;
@property (nonatomic,weak) id<GFSignatureViewDelegate> delegate;
/**展示*/
-(void)gf_showSignatureView;
/**销毁*/
-(void)gf_dismissSignatureView;
@end

#pragma mark - 签名视图
@interface GFSignatureCutomeView : UIView
/**画笔颜色*/
@property (nonatomic, strong) UIColor *lineColor;
/**画笔宽度*/
@property (nonatomic, assign) CGFloat lineWidth;
/**背景图片*/
@property (nonatomic, strong) UIImage *backgroundImage;
/**获取签名后的图片*/
- (UIImage *)signatureImage;
/**撤销上一步绘制 */
- (void)gf_undoLastDraw;
/** 恢复上次撤销操作*/
- (void)gf_redoLastDraw;
/**清除所有绘制*/
- (void)gf_clearSignature;
/**保存签名后的图片*/
- (void)gf_saveSignature;
@end;
