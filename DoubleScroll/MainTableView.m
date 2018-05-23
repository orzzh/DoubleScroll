//
//  MainTableView.m
//  DoubleScroll
//
//  Created by wl on 2018/5/21.
//  Copyright © 2018年 https://github.com/orzzh. All rights reserved.
//

#import "MainTableView.h"

@implementation MainTableView


- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}




@end
