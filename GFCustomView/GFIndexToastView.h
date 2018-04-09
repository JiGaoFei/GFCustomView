
#import <UIKit/UIKit.h>
typedef void  (^GFIndexBlock)(NSInteger);
typedef NS_ENUM(NSUInteger, GFIndexToastViewType) {
    /**正方形*/
    GFIndexToastRectangularType,
    /**水滴形*/
    GFIndexToastWarerType,
};
@interface GFIndexToastView : UIView
/**索引数组*/
@property (nonatomic,strong) NSMutableArray *indexTitleArray;
/**滑动回调*/
@property (nonatomic,copy) GFIndexBlock selectedBlock;
/** 滑动反馈*/
- (void)gf_selecctIndexBlock:(GFIndexBlock)block;
/**初始化(参数必传)
 @params  frame 位置
 @params fontSize 字体大小
 @params textNomorColor  字体颜色
  @params selectColor  选中状态下字体颜色
 @params toastType 类型
 */
- (instancetype)initWithFrame:(CGRect)frame indexTitleArray:(NSMutableArray *)array fontSize:(CGFloat)fontSize textNomorColor:(UIColor *)textNomorColor textSelectColor:(UIColor *)selectColor toastType:(GFIndexToastViewType)toastType;
@end
