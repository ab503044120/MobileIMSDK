//  ----------------------------------------------------------------------
//  Copyright (C) 2015 Jack Jiang The MobileIMSDK Project.
//  All rights reserved.
//  Project URL:  https://github.com/JackJiang2011/MobileIMSDK
//
//  openmob.net PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
//
//  You can contact author with jack.jiang@openmob.net or jb2011@163.com.
//  ----------------------------------------------------------------------
//
//  ChatBaseEventImpl.m
//  RainbowCore4i
//
//  Created by JackJiang on 14/10/28.
//  Copyright (c) 2014年 cngeeker.com. All rights reserved.
//

#import "ChatBaseEventImpl.h"
#import "AppDelegate.h"
#import "ViewController.h"

@implementation ChatBaseEventImpl

@synthesize debugObserver;

- (void) onLoginMessage:(int) dwUserId withErrorCode:(int)dwErrorCode
{
    if (dwErrorCode == 0)
    {
        NSLog(@"【DEBUG_UI】登录成功，当前分配的user_id=%d！", dwUserId);
        
        // UI显示
        [CurAppDelegate setMyid:dwUserId];
        [[CurAppDelegate getMainViewController] showIMInfo_green:[NSString stringWithFormat:@"登录成功,id=%d", dwUserId]];
        
        // form DEBUG
        if(self.debugObserver != nil)
            self.debugObserver(nil, [NSNumber numberWithInt:1]);
    }
    else
    {
        NSLog(@"【DEBUG_UI】登录失败，错误代码：%d", dwErrorCode);
        
        // UI显示
        [[CurAppDelegate getMainViewController] showIMInfo_red:[NSString stringWithFormat:@"登录失败,code=%d", dwErrorCode]];
        
        // form DEBUG
        if(self.debugObserver != nil)
            self.debugObserver(nil, [NSNumber numberWithInt:0]);
    }
}

- (void) onLinkCloseMessage:(int)dwErrorCode
{
    NSLog(@"【DEBUG_UI】网络连接出错关闭了，error：%d", dwErrorCode);
    
    // UI显示
    [[CurAppDelegate getMainViewController] showIMInfo_red:[NSString stringWithFormat:@"服务器连接已断开,error=%d", dwErrorCode]];
    
    // form DEBUG
    if(self.debugObserver != nil)
        self.debugObserver(nil, [NSNumber numberWithInt:0]);
}

@end