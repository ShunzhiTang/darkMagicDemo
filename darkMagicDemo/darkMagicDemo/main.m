//
//  main.m
//  darkMagicDemo
//
//  Created by tang on 16/5/24.
//  Copyright © 2016年 shunzhitang. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    
    NSLog(@"++++");
    
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}


/**
     构造器 ：Constructor  ， 析构器：Destructor
    
    这两个属性的函数会在可执行文件（shared library）load和unload 时被调用 ， 可以理解为在main（）函数的前和return后执行
 */

__attribute__((constructor))

static void beforeMain(void){
    
    NSLog(@"beforeMain");
}


__attribute__((destructor))

static void afterMain(void){
    
    NSLog(@"after");
    
}



