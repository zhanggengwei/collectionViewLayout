//
//  ViewController.m
//  collectionViewLayout
//
//  Created by Donald on 16/9/3.
//  Copyright © 2016年 Susu. All rights reserved.
//

#import "ViewController.h"
#import "PPTPoingDateView.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    PPTPoingDateView * dateView = [[PPTPoingDateView alloc]initWithFrame:CGRectMake(0, 30,SCREEN_WIDTH, 500)];
    dateView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:dateView];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






@end
