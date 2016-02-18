//
//  ShareSDKManager.m
//  cztvVideoiPad
//
//  Created by keyan on 15/8/17.
//  Copyright (c) 2015年 Letv. All rights reserved.
//

#import "ShareSDKManager.h"
#import "CommonHelpManager.h"
static ShareSDKManager*_shardManager;
@implementation ShareSDKManager
+ (ShareSDKManager *)sharedManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shardManager = [[ShareSDKManager alloc]init];
    });
    return _shardManager;

}
#pragma mark - 分享
//- (void)preShareWithType:(ShareType)type item:(ShareItem *)sItem withCurrentView:(UIView*)currentView
//{
//    if(![[NetConfiguration sharedNetConfig] checkNetIsEnable] && type != ShareTypeCopy)
//    {
//        [[CommonHelpManager shareManager] showTextToast:@"似乎已断开与互联网的连接" inView:currentView duration:1];
//        return;
//    }
//    if (sItem.shareUrl.length == 0)
//    {
//         [[CommonHelpManager shareManager] showTextToast:@"该视频暂不支持分享" inView:currentView duration:1];
//      
//        return;
//    }
//    BOOL isInstalledQQ = [QQApi isQQInstalled];
//    BOOL isInstalledWeChat = [WXApi isWXAppInstalled];
//    if (
//        
//        type == ShareTypeSinaWeibo)
//    {
//        if (![[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"sinaweibo://"]] && type != ShareTypeSinaWeibo)
//        {
//            [[CommonHelpManager shareManager] showTextToast:@"您没有安装微博客户端" inView:currentView duration:1];
//            
//            return;
//        }
//    }
//    
//    
//    if (!isInstalledQQ && type == ShareTypeQQ)
//    {
//         [[CommonHelpManager shareManager] showTextToast:@"您没有安装QQ客户端" inView:currentView duration:1];
//     
//        return;
//    }
//    if (type == ShareTypeWeixiSession || type == ShareTypeWeixiTimeline)
//    {
//        if (!isInstalledWeChat)
//        {
//             [[CommonHelpManager shareManager] showTextToast:@"您没有安装微信客户端" inView:currentView duration:1];
//
//            return;
//        }
//    }
//    [self shareWithType:type
//                   item:sItem];
//}

//- (void)shareWithType:(ShareType)type item:(ShareItem *)sItem
//{    //构造分享内容
//    id<ISSContent> publishContent = [ShareSDK content:sItem.shareContent
//                                       defaultContent:@""
//                                                image:[ShareSDK imageWithUrl:sItem.shareImgUrl]
//                                                title:sItem.shareTitle
//                                                  url:sItem.shareUrl
//                                          description:@""
//                                            mediaType:SSPublishContentMediaTypeNews];
//    
//    
//    switch (type)
//    {
//        case ShareTypeSinaWeibo://新浪微博
//            [publishContent addSinaWeiboUnitWithContent:[NSString stringWithFormat:@"%@ 原文地址:%@",sItem.shareContent,sItem.shareUrl]
//                                                  image:[ShareSDK imageWithUrl:sItem.shareImgUrl]];
//            break;
//        case ShareTypeCopy://复制链接
//        {
//            [publishContent addCopyUnitWithContent:sItem.shareContent image:[ShareSDK imageWithUrl:sItem.shareImgUrl]];
//        }
//            break;
//        case ShareTypeMail://邮箱分享
//        {
//            /*
//             <html><body><p class="p1">%@</p><p class="p1">原文地址<span class="s1">:<a>%@</a></p><p class="p1">来自:中国蓝TV客户端</p></body></html>
//             */
//            //            NSString * itunesUrl = @"itms-apps://itunes.apple.com/cn/app/zhong-guo-lan-xin-wen/id772339521?mt=8";
//            NSString * contentStr = [NSString stringWithFormat:@"<html><body><p class=\"p1\">%@</p><p class=\"p1\">原文地址<span class=\"s1\">:<a>%@</a></p><p class=\"p1\">来自:中国蓝TV客户端</p></body></html>",sItem.shareContent,sItem.shareUrl];
//            [publishContent addMailUnitWithSubject:@"分享来自中国蓝TV"
//                                           content:contentStr
//                                            isHTML:[NSNumber numberWithBool:YES]
//                                       attachments:INHERIT_VALUE
//                                                to:nil
//                                                cc:nil
//                                               bcc:nil];
//        }
//        case ShareTypeWeixiSession://微信好友
//        {
//            
//            [publishContent addWeixinSessionUnitWithType:INHERIT_VALUE
//                                                 content:INHERIT_VALUE
//                                                   title:INHERIT_VALUE
//                                                     url:INHERIT_VALUE
//                                              thumbImage:INHERIT_VALUE//[ShareSDK jpegImageWithImage:image quality:1.0]
//                                                   image:INHERIT_VALUE
//                                            musicFileUrl:nil
//                                                 extInfo:nil
//                                                fileData:nil
//                                            emoticonData:nil];
//        }
//            break;
//        case ShareTypeWeixiTimeline://微信朋友圈
//        {
//            [publishContent addWeixinTimelineUnitWithType:INHERIT_VALUE
//                                                  content:INHERIT_VALUE
//                                                    title:INHERIT_VALUE
//                                                      url:INHERIT_VALUE
//                                               thumbImage:INHERIT_VALUE//[ShareSDK jpegImageWithImage:image quality:1.0]
//                                                    image:INHERIT_VALUE
//                                             musicFileUrl:nil
//                                                  extInfo:nil
//                                                 fileData:nil
//                                             emoticonData:nil];
//        }
//            break;
//        case ShareTypeQQ://QQ好友
//        {
//            [publishContent addQQUnitWithType:INHERIT_VALUE
//                                      content:sItem.shareContent
//                                        title:sItem.shareTitle
//                                          url:sItem.shareUrl
//                                        image:[ShareSDK imageWithUrl:sItem.shareImgUrl]];
//        }
//            break;
//            
//        default:
//            break;
//    }
//    //    id<ISSAuthOptions> authOptions = [ShareSDK authOptionsWithAutoAuth:YES
//    //                                                         allowCallback:YES
//    //                                                         authViewStyle:SSAuthViewStyleFullScreenPopup
//    //                                                          viewDelegate:nil
//    //                                               authManagerViewDelegate:nil];
//    if (type == ShareTypeCopy)
//    {
//        if (sItem.shareUrl && sItem.shareUrl.length != 0)
//        {
//            UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
//            pasteboard.string = sItem.shareUrl;
//        }
//        //        [self closeShareBoard];
//        //        if (_delegate && [_delegate respondsToSelector:@selector(newsShareCompletedWithTips:)])
//        //        {
//        //            [_delegate newsShareCompletedWithTips:@"已复制链接到剪切板"];
//        //        }
//        return;
//    }
//    __block NSString * tips = @"";
//    [ShareSDK clientShareContent:publishContent
//                            type:type
//                   statusBarTips:YES
//                          result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
//                              switch (state)
//                              {
//                                  case SSResponseStateSuccess:
//                                      tips = @"分享成功";
//                                      break;
//                                  case SSResponseStateFail:
//                                      //                                      tips = [NSString stringWithFormat:@"%@",[error errorDescription]];
//                                      break;
//                                  case SSResponseStateCancel:
//                                      //                                      tips = @"取消分享";
//                                      /*
//                                       微信无法捕获留在微信再次切回应用的分享回调
//                                       */
//                                      if (type == ShareTypeWeixiSession||type == ShareTypeWeixiTimeline)
//                                      {
//                                          tips = @"";
//                                      }
//                                      break;
//                                  default:
//                                      break;
//                              }
//                              //                              tips = @"";
//                              //                              if (_delegate && [_delegate respondsToSelector:@selector(newsShareCompletedWithTips:)])
//                              //                              {
//                              //                                  [_delegate newsShareCompletedWithTips:tips];
//                              //                              }
//                          }];
//    
////        [self closeShareBoard];
//}

#pragma mark - ShareSDK
//- (void)configShareSDK
//{
//    /**
//     注册SDK应用，此应用请到http://www.sharesdk.cn中进行注册申请。
//     此方法必须在启动时调用，否则会限制SDK的使用。
//     **/
//    [ShareSDK registerApp:@"75ebda96dcf8"];
//    
//    [ShareSDK ssoEnabled:YES];
//    
//    //连接拷贝
//    [ShareSDK connectCopy];
//    
//    //链接邮箱
//    [ShareSDK connectMail];
//    
//    //添加新浪微博应用 注册网址 http://open.weibo.com
//    [ShareSDK connectSinaWeiboWithAppKey:@"3039816241"
//                               appSecret:@"f501b802e1a799dc2b5ecb079cf2dce8"
//                             redirectUri:@"http://sso.cztv.com/oauth/appsinacallbackdata"
//                             weiboSDKCls:[WeiboSDK class]];
//    
//    /**
//     连接QQ空间应用以使用相关功能，此应用需要引用QZoneConnection.framework
//     http://connect.qq.com/intro/login/上申请加入QQ登录，并将相关信息填写到以下字段
//     
//     如果需要实现SSO，需要导入TencentOpenAPI.framework,并引入QQApiInterface.h和TencentOAuth.h，将QQApiInterface和TencentOAuth的类型传入接口
//     **/
//    
//    [ShareSDK connectQQWithQZoneAppKey:@"1104558493"
//                     qqApiInterfaceCls:[QQApiInterface class]
//                       tencentOAuthCls:[TencentOAuth class]];
//    [ShareSDK connectQZoneWithAppKey:@"1104558493"
//                           appSecret:@"apu9bLmRyhyuRIvk"
//                   qqApiInterfaceCls:[QQApiInterface class]
//                     tencentOAuthCls:[TencentOAuth class]];
////    wxc4cc6c3e595af247   wx329392544913ec90
//    //微信登陆的时候需要初始化
//    [ShareSDK connectWeChatWithAppId:@"wx329392544913ec90"
//                           appSecret:@"357f3cbb05965942571ce19d7e273ba8"
//                           wechatCls:[WXApi class]];
//    
//    
//    
//    //取消第三方授权相关
//    [ShareSDK cancelAuthWithType:ShareTypeSinaWeibo];
//    [ShareSDK cancelAuthWithType:ShareTypeQQSpace];
//    [ShareSDK cancelAuthWithType:ShareTypeWeixiSession];
//    
//    
//    
//    
//}

@end
