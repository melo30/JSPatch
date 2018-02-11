//
//  AppDelegate.m
//  JSPatch
//
//  Created by melo on 2018/2/9.
//  Copyright © 2018年 陈诚. All rights reserved.
//

#import "AppDelegate.h"
#import <JSPatchPlatform/JSPatch.h>
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    /* 接入JSPatch 步骤:
     0.首先去JSPatch平台注册账号,可以任意添加新App,每一个App都有唯一的AppKey作为标识.
     1.cocoaPods导入 pod 'JSPatchPlatform'
     2.去Target -> Build Phases -> Link Binary With Libraries 添加项目框架依赖:(1)libz.tbd (2)JavaScriptCore.framework
     3.运行:载入文件#import <JSPatchPlatform/JSPatch.h>,在Appdelegate.m的didFinish...中载入文件,然后调用+startWithAppKey:方法,参数为第一步获得的AppKey。接着调用+sync方法检查更新.
     4.至此,JSPatch接入完毕,下一步就可以开始在后台为这个App“添加JS补丁文件"了.
     5.在JSPatch后台生成了RSA公钥私钥之后，还需要在+sync之前调用，因为+sync可能会下载到脚本，这是已经要用RSA key去验证了
     */
    
    
    
    /*注意事项:
     0.本地测试时,要求在项目中有main.js文件，文件名字必须是main.js 调用如下代码:[JSPatch testScriptInBundle],而且![JSPatch testScriptInBundle]和[JSPatch startWithAppKey:@"appKey"]不可以同时在代码中使用;
     1.Xcode8以上需要在项目中Target -> Capabilities 中打开Keychain Sharing 开关,否则在模拟器下载脚本后会出现 decompress error,md5 didn't match 的错误 (真机无论是否打开都没问题)
     2.如果本次线上版本在后台用JS修改了bug并下发给用户了，下一次发版务必要用OC代码把修改bug的代码重写一遍.永远保证线上最多只存在一个版本的补丁.并且记录每一次的修改.
     */
    
    
    /* 这是我在JSPatch随便平台注册的一个测试App得到的AppKey */
    
    //这句测试的时候用!测试的时候需要项目中有main.js文件(即补丁文件)，而且名字必须为main.js
    [JSPatch testScriptInBundle];
    //这句上线了之后用!上线之后的补丁文件到JSPatch官方平台去配置
//    [JSPatch startWithAppKey:@"dc59d18acc1daf6c"];
    
    [JSPatch setupRSAPublicKey:@"-----BEGIN PUBLIC KEY-----\nMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCtjobF16Mewh+e27OBCEco4Waj\nFKwplNyKJSGj+/r+qdJ4IMqLehrxQR36Ry3a0z2/ronqQ9xqIT/7OeDTe7B+tjL5\niLc1ZIxF5RtLyF9S2aKM8SVDN3yq4wqPTQPGM54cZrkZEwvyrY8kvVZv9gAqqEH6\nhbktpasE0SrBu6gF0wIDAQAB\n-----END PUBLIC KEY-----"];
    [JSPatch sync];
    
    /* 结束 */
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
