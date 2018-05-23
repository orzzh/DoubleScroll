//
//  ParentClassScrollViewController.h
//  DoubleScroll
//
//  Created by wl on 2018/5/21.
//  Copyright © 2018年 https://github.com/orzzh. All rights reserved.
//

#import <UIKit/UIKit.h>

#define scr_wid [UIScreen mainScreen].bounds.size.width
#define scr_hei [UIScreen mainScreen].bounds.size.height

@protocol scrollDelegate <NSObject>


-(void)scrollViewLeaveAtTheTop:(UIScrollView *)scrollView;

-(void)scrollViewChangeTab:(UIScrollView *)scrollView;

@end


@interface ParentClassScrollViewController : UIViewController

@property(nonatomic,weak)id<scrollDelegate>delegate;

@end
