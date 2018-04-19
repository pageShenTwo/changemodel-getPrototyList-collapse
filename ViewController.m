//
//  ViewController.m
//  字典转模型
//
//  Created by JBT on 2018/4/19.
//  Copyright © 2018年 JBT. All rights reserved.
//    具体解释请看每个分类的详解

#import "ViewController.h"
#import "person.h"
#import "NSObject+prototyWithModel.h"
#import "personOne.h"
#import "NSObject+model.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"person" ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    NSDictionary *dict1 = dict[@"sonperson"];
    [NSObject prototyWithModel:dict1];
    person *p1 = [[person alloc] init];
    [p1 eat];
    personOne * p = [personOne modelWithDict:dict];
    NSLog(@"%@",p);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
