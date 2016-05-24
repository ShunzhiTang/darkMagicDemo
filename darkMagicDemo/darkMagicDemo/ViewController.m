//
//  ViewController.m
//  darkMagicDemo
//
//  Created by tang on 16/5/24.
//  Copyright © 2016年 shunzhitang. All rights reserved.
//

#import "ViewController.h"



#define onExit\
    __strong void(^block)(void) __attribute__((cleanup(blockCleanUp),unused)) = ^


#pragma mark: enable_if  这个属性只能使用在C函数上 ， 可以用来实现参数的静态检查



@interface ViewController ()

@end

@implementation ViewController


static void printValidAge(int age) __attribute__((enable_if(age > 0 && age < 100 , "你的年龄不符合"))){
    
    printf("age = %d" , age);
}
/**
 
   1、 __attribute__((cleanup(...))) ,用于修饰一个变量 ，在它作用域结束时可以自动执行一个指定的方法
 所谓的作用域结束包括： 包括大括号结束、return、goto、break、exception等各种情况。
 当然，可以修饰的变量不止NSString，自定义Class或基本类型都是可以的：
 
  2、可以使用 __attribute__((cleanup(...)))修饰一个block的方法
 
 */

static void stringCleanUp(__strong NSString **string){
    
    NSLog(@"%@" , *string);
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    __strong NSString *string __attribute__((cleanup(stringCleanUp))) = @"nihaoya";
    
    [self testBlockAttribute];
    
    NSLog(@"-------------");
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    printValidAge(12);
    printValidAge(-10);
    printValidAge(1200);
}


#pragma mark: __attribute__((cleanup(...))) 修饰一个block

static void blockCleanUp(__strong  void(^*block)(void)){
    
    (*block)();
    
}

- (void)testBlockAttribute{
    
    
    // 加了个`unused`的attribute用来消除`unused variable`的warning
    
//    __strong void(^block)(void) __attribute__((cleanup(blockCleanUp), unused)) = ^{
//        NSLog(@"I'm dying...");
//    };
    
//    __strong void(^block)(void) __attribute__((cleanup(blockCleanUp) , unused)) = ^(void){
//        
//        NSLog(@"wohahaha");
//    };
    
    onExit{
        
        NSLog(@"GO Go Go");
    };
    
}





@end


