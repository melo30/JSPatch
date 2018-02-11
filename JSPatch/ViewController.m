//
//  ViewController.m
//  JSPatch
//
//  Created by melo on 2018/2/9.
//  Copyright © 2018年 陈诚. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //随便加一个label,一会儿我会去JSPatch平台提交
    UILabel *lb = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    lb.text = @"JSPatch";
    lb.textColor = [UIColor grayColor];
    lb.backgroundColor = [UIColor redColor];
    [self.view addSubview:lb];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
