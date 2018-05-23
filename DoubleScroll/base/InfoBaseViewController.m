//
//  InfoBaseViewController.m
//  UniversalApp
//
//  Created by wl on 2018/3/30.
//  Copyright © 2018年 客户端. All rights reserved.
//

#import "InfoBaseViewController.h"
#import "MJRefresh.h"

#define SCROLLHEIGHT 180
#define scr_wid [UIScreen mainScreen].bounds.size.width
#define scr_hei [UIScreen mainScreen].bounds.size.height

@interface InfoBaseViewController ()
{
    UIImage *navigationBarimg;
}
@end

@implementation InfoBaseViewController


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

    [self.navigationController.view insertSubview:self.navBarView belowSubview:self.navigationController.navigationBar];

    //导航栏透明
    navigationBarimg = [self.navigationController.navigationBar backgroundImageForBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    //    如果不想让其他页面的导航栏变为透明 需要重置
    [self.navigationController.navigationBar setBackgroundImage:navigationBarimg forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
    [self.navBarView removeFromSuperview];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   
    
}


- (UIView *)navBarView{
    if (!_navBarView) {
        _navBarView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, scr_wid, 64)];
        _navBarView.backgroundColor = [UIColor whiteColor];
        _navBarView.alpha = 1;
        [_navBarView addSubview:self.titleLa];
    }
    return _navBarView;
}

- (YYLabel *)titleLa{
    if (!_titleLa) {
        _titleLa = [YYLabel new];
        _titleLa.text = @"";
        _titleLa.frame = CGRectMake(0, 20, scr_wid, 44);
        _titleLa.textColor = [UIColor blackColor];
        _titleLa.font = [UIFont systemFontOfSize:16];
        _titleLa.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLa;
}


//如果重写这个 需要添加到子类
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offset = scrollView.mj_offsetY;
    if (offset<SCROLLHEIGHT) {

        CGFloat  diff = fabs(SCROLLHEIGHT-offset);
        CGFloat alpha = 1-diff/SCROLLHEIGHT;
        _navBarView.alpha = alpha;
    }
//    self.navigationController.navigationBar.tintColor = KBlackColor;
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
