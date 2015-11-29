//
//  main.m
//  指针实验
//
//  Created by 康梁 on 15/11/4.
//  Copyright © 2015年 kl. All rights reserved.
//
// 作业：1.p192 2.判断手机iOS当前版本 3.判断手机型号，是否是iPhone，iPad等

#import <Foundation/Foundation.h>
#import "KLClassB.h"
#import "KLClassA.h"

int result(int x) {
    int sum = 0;
    
//    if (x > 0) {
//        sum = x * x;
//    }else if (x <= 0) {
//        sum = 1;
//    }
    
    sum = (x > 0) ? x * x : -1;
    
    return sum;
}

int add(int x) {
    
    int sum = 0;
    
    switch (x) {
        case 0:
            break;
        case 1:
            sum += 1;
            break;
        case 2:
            sum += 3;
            break;
        case 3:
            sum = 1 + 2 + 3;
            break;
            
        default:
            break;
    }
    return sum;
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        NSString *str;
//        NSLog(@"%@, %p",str, &str);
//        
//        int a;
//        NSLog(@"%i ,%p",a, &a);
        
//        KLClassA *classA = [[KLClassA alloc] init];
//        KLClassB *classB = [[KLClassB alloc] init];
//        
//        NSLog(@"%@", classA.KLClassB);
//        NSLog(@"%@", classB.KLClassA);
//        
//        classA.KLClassB = classB.KLClassA;
//        NSLog(@"%@",classA.KLClassB);
        
        KLClassA *A = [[KLClassA alloc] init];
        KLClassB *B = [[KLClassB alloc] init];
        
//        NSLog(@"%@", A.classB);
//        NSLog(@"%@", B.classA);
        
        [A print];
        [B print];
        
        NSMutableArray *array = [[NSMutableArray alloc] init];
        [array addObject:A];
        [array addObject:B];
        
        // 使用id动态类型
        for (id obj in array) {
            // 判断成员是否属于某个类
            if ([obj isMemberOfClass:[KLClassA class]]) {
                NSLog(@"It is KLClassA");
            }else if ([obj isMemberOfClass:[KLClassB class]]) {
                NSLog(@"It is KLClassB");
            }
            [obj print];
        }
        

        NSLog(@"%i",add(3));
        
#pragma mark ------判断
        KLClassA *myClass = [[KLClassA alloc] init];
        
        // isMemberOf
        
        if ([myClass isMemberOfClass:[KLClassA class]] == YES) {
            NSLog(@"myClass is a member of KLClassA class");
        }
        
        if ([myClass isMemberOfClass:[KLClassB class]] == YES) {
            NSLog(@"myClass is a member of KLClassB class");
        }
        
        if ([myClass isMemberOfClass:[NSObject class]] == YES) {
            NSLog(@"myClass is a member of NSObject class");
        }
        
        // isKindOf
        
        if ([myClass isKindOfClass:[KLClassA class]] == YES) {
            NSLog(@"myClass is a kind of KLClassA");
        }
        
        if ([myClass isKindOfClass:[KLClassB class]] == YES) {
            NSLog(@"myClass is a kind of KLClassB");
        }
        
        if ([myClass isKindOfClass:[NSObject class]] == YES) {
            NSLog(@"myClass is a kind of NSObject");
        }
        
        // respondsTo
        
        if ([myClass respondsToSelector:@selector(print)] == YES) {
            NSLog(@"myClass responds to print: method");
        }
        
        if ([myClass respondsToSelector:@selector(init)] == YES) {
            NSLog(@"myClass responds to printName: method");
        }
        
        if ([myClass respondsToSelector:@selector(alloc)] == YES) {
            NSLog(@"myClass responds to alloc: method");
        }
        
        // instancesRespondTo
        
        if ([KLClassA instanceMethodForSelector:@selector(print:)] == YES) {
            NSLog(@"Instance of KLClassA respond to print: method");
        }
        
        if ([KLClassB instanceMethodForSelector:@selector(print:)] == YES) {
            NSLog(@"Instance of KLClassB respond to print: method");
        }
        
        if ([KLClassB isSubclassOfClass:[KLClassA class]] == YES) {
            NSLog(@"klClassB is subclass of a KLClassA");
        }
        
        int sum = 0;
        
        for (int i = 1; i <= 100; i++) {
            sum += i;
        }
        
        NSLog(@"%d",sum);
        
        int sum_2 = 0;
        
        for (int i = 2; i <= 100; i += 2) {
            sum_2 += i;
        }
        
        NSLog(@"%d",sum_2);
    
        
    
    }
    return 0;
}
