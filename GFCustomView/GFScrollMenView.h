//
//  GFScrollMenView.h
//  GFCustomeDemo
//
//  Created by 孙行者网络 on 2018/3/20.
//  Copyright © 2018年 纪高飞. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GFScrollMenView.h"
@interface GFScrollMenView : UIView
/**图片数组*/
@property (nonatomic,strong) NSMutableArray *imagesArray;
/**文字数组*/
@property (nonatomic,strong) NSMutableArray *titlesArray;
/**页数*/
@property (nonatomic,assign) NSInteger pageNum;
/**总数*/
@property (nonatomic,assign) float  totallNumber;
/**每行显示个数*/
@property (nonatomic,assign) NSInteger rowNum;
@end
@interface GFScrollMenCell:UIView
@end
