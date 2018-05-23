//
//  ViewController.m
//  DoulScro
//
//  Created by wl on 2018/5/22.
//  Copyright © 2018年 https://github.com/orzzh. All rights reserved.
//

#import "ViewController.h"
#import "SecViewController.h"


@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *b = [UIButton new];
    b.frame = CGRectMake(0, 0, 100, 100);
    b.center = self.view.center;
    b.backgroundColor = [UIColor redColor];
    [self.view addSubview:b];
    [b addTarget:self action:@selector(next) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)next{
    
    SecViewController *v = [SecViewController new];
    v.titleLa.text = @"测试页码";
    UINavigationController *n = [[UINavigationController alloc]initWithRootViewController:v];
    [self presentViewController:n animated:YES completion:nil];
    
}


@end
