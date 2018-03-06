//
//  main.m
//  RunLoopLin
//
//  Created by buTing on 2018/2/12.
//  Copyright © 2018年 buTing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        NSLog(@"main.m -> test-start");

        int a = UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
        NSLog(@"test-end");
        return a ;
    }
    
}
