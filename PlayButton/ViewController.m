//
//  ViewController.m
//  PlayButton
//
//  Created by Chao on 16/8/29.
//  Copyright © 2016年 Chao. All rights reserved.
//

#import "ViewController.h"
#import "PlayButton.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    PlayButton *paly = [[PlayButton alloc] initWithFrame:CGRectMake(50, 50, 30, 30)];
    [self.view addSubview:paly];
}


@end
