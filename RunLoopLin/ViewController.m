//
//  ViewController.m
//  RunLoopLin
//
//  Created by buTing on 2018/2/12.
//  Copyright © 2018年 buTing. All rights reserved.
//

#import "ViewController.h"
#import "LINThread.h"
@interface ViewController ()

@property(nonatomic,strong) LINThread * thread;
@property(nonatomic) BOOL isFinished;
@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
//    [self viewDidLoad]; //递归调用，导致程序崩溃
    
    NSArray *array = @[@"1",@"2"];
    NSString *errorTest =  [array objectAtIndex:3];
    
    
    
    
    _isFinished = NO;
    LINThread  *thread = [[LINThread alloc] initWithBlock:^{
        
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(timerMethod) userInfo:nil repeats:YES];
        
        [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
        
//        while (!_isFinished) {
//            [[NSRunLoop currentRunLoop] runUntilDate: [NSDate dateWithTimeIntervalSinceNow:0.001f]];
//
//        }
        
        [[NSRunLoop currentRunLoop] run];// 此处是重点，因为当前在子线程中，所以此时的currentRunLoop就是子线程的runloop。  而子线程的runloop不同于主线程的runloop的最大一点就是：主线程的runloop在main函数中就已经开启，而子线程 的runloop需要我们手动开启，也就是说任何一个子线程，默认情况下是单向的，走完就结束，若想一直保留这个子线程，就需要加运行循环。
        
        //    [[NSRunLoop currentRunLoop] addTimer:timer forMode:UITrackingRunLoopMode];
        NSLog(@"（当前线程）子线程的运行循环结束");  //当前子线程执行完之后，子线程被回收。所以加在此线程的runloop中的timerMethod时钟时间失去了runloop之后，不再执行。
    }];
    NSLog(@"test2");
    [thread start];
    
    
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
//    _isFinished = YES;
    [NSThread exit];
}

- (void)timerMethod {
    NSLog(@"test3");
    if (_isFinished) {
        [NSThread exit];
    }
    
    [NSThread sleepForTimeInterval:1.0f]; // 模拟耗时操作。
    
    static int a = 0;
    a++;
    NSLog(@"%@,%d", [NSThread currentThread],a);
    
}


@end
