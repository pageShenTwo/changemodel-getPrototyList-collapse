//
//  personOne.h
//  ajs;fjl
//
//  Created by JBT on 2018/4/19.
//  Copyright © 2018年 JBT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sonPersonOne.h"

@interface personOne : NSObject
@property (assign, nonatomic) NSInteger age;

@property (assign, nonatomic) NSInteger height;

@property (strong, nonatomic) NSString *name;

@property (strong, nonatomic) sonPersonOne *sonperson;
@end
