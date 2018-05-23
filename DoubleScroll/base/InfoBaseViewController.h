//
//  InfoBaseViewController.h
//  UniversalApp
//
//  Created by wl on 2018/3/30.
//  Copyright © 2018年 客户端. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YYKit.h"
/**
    用来隐藏导航栏 做上滑导航栏渐变
 */
@interface InfoBaseViewController : UIViewController

/**
 导航栏文字
 */
@property (nonatomic,strong)YYLabel *titleLa;
@property (nonatomic,strong)UIView *navBarView;


@end
