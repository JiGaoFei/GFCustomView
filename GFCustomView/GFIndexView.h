//==============================
//代码规范：美，简洁，高内聚，低耦合
//要        点：编码认真，切记心浮气躁
//==============================
// @abstract 类的描述
// @discussion 类的功能


#import <UIKit/UIKit.h>
//字体变化率
#define FONT_RATE 1/8.000
//透明度变化率
#define ALPHA_RATE 1/80.0000
//初始状态索引颜色
#define STR_COLOR [UIColor orangeColor]
//选中状态索引颜色
#define MARK_COLOR [UIColor blackColor]
//初始状态索引大小
#define FONT_SIZE [UIFont systemFontOfSize:10]
//索引label的tag值(防止冲突)
#define TAG 233333
//圆的半径
#define ANIMATION_HEIGHT 80
typedef void  (^GFIndexBlock)(NSInteger);
@interface GFIndexView : UIView
/**动画视图*/
@property (nonatomic,strong) UILabel *animationLabel;
/**索引数组*/
@property (nonatomic,strong) NSMutableArray *indexTitleArray;
/**滑动回调*/
@property (nonatomic,copy) GFIndexBlock selectedBlock;
/**初始数值(计算用到)*/
@property (nonatomic,unsafe_unretained) CGFloat number;
/** 滑动反馈*/
- (void)gf_selecctIndexBlock:(GFIndexBlock)block;
/**
 *  初始化
 */
- (instancetype)initWithFrame:(CGRect)frame indexTitleArray:(NSMutableArray *)array;
@end
