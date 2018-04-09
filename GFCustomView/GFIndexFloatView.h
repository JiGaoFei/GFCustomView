//==============================
//代码规范：美，简洁，高内聚，低耦合
//要        点：编码认真，切记心浮气躁
//==============================
// @abstract 类的描述
// @discussion 类的功能

#import <UIKit/UIKit.h>
typedef void  (^GFIndexBlock)(NSInteger);
@interface GFIndexFloatView : UIView
/**索引数组*/
@property (nonatomic,strong) NSMutableArray *indexTitleArray;
/**滑动回调*/
@property (nonatomic,copy) GFIndexBlock selectedBlock;
/**初始数值(计算用到)*/
@property (nonatomic,unsafe_unretained) CGFloat number;
/** 滑动反馈*/
- (void)gf_selecctIndexBlock:(GFIndexBlock)block;
/** 初始化*/
- (instancetype)initWithFrame:(CGRect)frame indexTitleArray:(NSMutableArray *)array fontSize:(CGFloat)fontSize textNomorColor:(UIColor *)textNomorColor textSelectColor:(UIColor *)selectColor;
@end
