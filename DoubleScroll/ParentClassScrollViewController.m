//
//  ParentClassScrollViewController.m
//  DoubleScroll
//
//  Created by wl on 2018/5/21.
//  Copyright © 2018年 https://github.com/orzzh. All rights reserved.
//

#import "ParentClassScrollViewController.h"

@interface ParentClassScrollViewController ()<UIGestureRecognizerDelegate>

@property(strong, nonatomic)UIScrollView *scrollView;

@end

@implementation ParentClassScrollViewController

-(void)viewWillAppear:(BOOL)animated{
    
    //每次即将显示页面调用
    if(self.delegate){
        
        [self.delegate scrollViewChangeTab:self.scrollView];
    }
}


#pragma mark - 子类VC调用
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY<0) {
        //离开顶部
        if(self.delegate)
        {
            [self.delegate scrollViewLeaveAtTheTop:scrollView];
        }
    }
    if (!self.scrollView) {
        if(self.delegate)
        {
            [self.delegate scrollViewChangeTab:scrollView];
        }
    }
    _scrollView = scrollView;
}



-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    // 首先判断otherGestureRecognizer是不是系统pop手势
    if ([otherGestureRecognizer.view isKindOfClass:NSClassFromString(@"UILayoutContainerView")]) {
        // 再判断系统手势的state是began还是fail，同时判断scrollView的位置是不是正好在最左边
        if (otherGestureRecognizer.state == UIGestureRecognizerStateBegan && self.scrollView.contentOffset.x == 0) {
            return YES;
        }
    }
    
    return NO;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
