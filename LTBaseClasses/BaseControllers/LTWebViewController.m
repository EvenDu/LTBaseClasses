//
//  LTWebViewController.m
//  LTBaseClass
//
//  Created by 洪峰 on 2018/3/5.
//  Copyright © 2018年 洪峰. All rights reserved.
//

#import "LTWebViewController.h"
//#import "WeakScriptMessageDelegate.h"
#import "LTBaseClassMacro.h"
#import "NSObject+YYAddForKVO.h"
#import "UIView+LTFrame.h"
#import "UIFont+LTAdd.h"

@interface LTWebViewController ()


@end

@implementation LTWebViewController

- (void)setGotoURL:(NSString *)gotoURL {
    _gotoURL = gotoURL.copy;
}

#pragma mark - 生命周期
- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    LTWeak(self);
    [self.webView addObserverBlockForKeyPath:LTKeyPath(weakself.webView, estimatedProgress) block:^(id  _Nonnull obj, id  _Nullable oldVal, id  _Nullable newVal) {
        
        
        weakself.progressView.progress = weakself.webView.estimatedProgress;
        // 加载完成
        if (weakself.webView.estimatedProgress  >= 1.0f ) {
            
            [UIView animateWithDuration:0.25f animations:^{
                weakself.progressView.alpha = 0.0f;
                weakself.progressView.progress = 0.0f;
            }];
            
        }else{
            weakself.progressView.alpha = 1.0f;
        }
        
    }];
    
    
    
    if ([self webViewController:self webViewIsNeedAutoTitle:self.webView]) {
        
        [self.webView addObserverBlockForKeyPath:LTKeyPath(self.webView, title) block:^(id  _Nonnull obj, id  _Nullable oldVal, id  _Nullable newVal) {
            
            if (!LTIsEmpty(newVal) && [newVal isKindOfClass:[NSString class]] && [weakself webViewController:weakself webViewIsNeedAutoTitle:weakself.webView]) {
                weakself.title = newVal;
            }
            
        }];
    }
    
    
    [self.webView.scrollView addObserverBlockForKeyPath:LTKeyPath(self.webView.scrollView, contentSize) block:^(id  _Nonnull obj, id  _Nullable oldVal, id  _Nullable newVal) {
        
        [weakself webView:weakself.webView scrollView:weakself.webView.scrollView contentSize:weakself.webView.scrollView.contentSize];
        
    }];
    
    
    
    if (self.gotoURL.length > 0) {
        [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.gotoURL]]];
    }
    
}



- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    [self.view bringSubviewToFront:self.progressView];
    
}


#pragma mark - LTNavUIBaseViewControllerDataSource
#pragma mark - 设置左上角的一个返回按钮和一个关闭按钮
/** 导航条的左边的 view */
- (UIView *)ltNavigationBarLeftView:(LTNavigationBar *)navigationBar
{
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 90, 44)];
    
//    leftView.backgroundColor = [UIColor yellowColor];
    
    self.backBtn.lt_origin = CGPointZero;
    
//    self.closeBtn.lt_x = leftView.lt_width - self.closeBtn.lt_width;
//
    [leftView addSubview:self.backBtn];
    
//    [leftView addSubview:self.closeBtn];
    
    return leftView;
}

/** 导航条右边的 view */
- (UIView *)ltNavigationBarRightView:(LTNavigationBar *)navigationBar {
    
    UIView *rigthView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [rigthView addSubview:self.closeBtn];
    return rigthView;
}


- (void)leftButtonEvent:(UIButton *)sender navigationBar:(LTNavigationBar *)navigationBar
{
    [self backBtnClick:sender webView:self.webView];
}

- (void)left_close_button_event:(UIButton *)sender
{
    [self closeBtnClick:sender webView:self.webView];
}




#pragma mark - LTWebViewControllerDataSource
// 默认需要, 是否需要进度条
- (BOOL)webViewController:(LTWebViewController *)webViewController webViewIsNeedProgressIndicator:(WKWebView *)webView
{
    return YES;
}

// 默认需要自动改变标题
- (BOOL)webViewController:(LTWebViewController *)webViewController webViewIsNeedAutoTitle:(WKWebView *)webView
{
    return YES;
}


#pragma mark - LTWebViewControllerDelegate
// 导航条左边的返回按钮的点击
- (void)backBtnClick:(UIButton *)backBtn webView:(WKWebView *)webView
{
    if (self.webView.canGoBack) {
    
//        self.closeBtn.hidden = NO;
        
        [self.webView goBack];
        
    }else
    {
        [self closeBtnClick:self.closeBtn webView:self.webView];
    }
}

// 关闭按钮的点击
- (void)closeBtnClick:(UIButton *)closeBtn webView:(WKWebView *)webView
{
    // 判断两种情况: push 和 present
    if ((self.navigationController.presentedViewController || self.navigationController.presentingViewController) && self.navigationController.childViewControllers.count == 1) {
        
        [self dismissViewControllerAnimated:YES completion:nil];
        
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}

// 监听 self.webView.scrollView 的 contentSize 属性改变，从而对底部添加的自定义 View 进行位置调整
- (void)webView:(WKWebView *)webView scrollView:(UIScrollView *)scrollView contentSize:(CGSize)contentSize
{
//    NSLog(@"%@\n%@\n%@", webView, scrollView, NSStringFromCGSize(contentSize));
}

#pragma mark - webDelegate

#pragma mark -- WKScriptMessageHandler
-(void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message
{
    
}

#pragma mark - WKUIDelegate
//在JS端调用alert函数时，会触发此代理方法。
//uiwebview 中这个方法是私有方法 通过category可以拦截alert
- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler {
    
    //    NSLog(@"%s", __FUNCTION__);
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler();
    }]];
    
    [self presentViewController:alert animated:YES completion:NULL];
}


- (void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL))completionHandler {
    NSLog(@"%@",message);
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:message message:@"" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(YES);
    }];
    [controller addAction:action];
    UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(NO);
    }];
    [controller addAction:cancle];
    [self presentViewController:controller animated:YES completion:nil];
}

- (void)webView:(WKWebView *)webView runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(NSString *)defaultText initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(NSString * _Nullable))completionHandler {
    
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    [controller addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        
    }];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(controller.textFields.lastObject.text);
    }];
    [controller addAction:action];
    [self presentViewController:controller animated:YES completion:nil];
}

// 1, 在发送请求之前，决定是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    
    NSLog(@"decidePolicyForNavigationAction   ====    %@", navigationAction);
    NSLog(@"在收到响应前，决定是否跳转");
    
    NSString *urlString = [[navigationAction.request URL] absoluteString];
    urlString = [urlString stringByRemovingPercentEncoding];
    
    if ([urlString hasPrefix:@"tel"]) {
        decisionHandler(WKNavigationActionPolicyCancel);
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
        });
    } else{
        decisionHandler(WKNavigationActionPolicyAllow);//允许其他请求
    }
         
    
}

// 2开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation {
    
    NSLog(@"didStartProvisionalNavigation   ====    %@", navigation);
    
}


// 4, 在收到响应后，决定是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler {
    
    NSLog(@"decidePolicyForNavigationResponse   ====    %@", navigationResponse);
    decisionHandler(WKNavigationResponsePolicyAllow);
    
}

// 5,内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(null_unspecified WKNavigation *)navigation {
    
    NSLog(@"didCommitNavigation   ====    %@", navigation);
}

// 3, 6, 加载 HTTPS 的链接，需要权限认证时调用  \  如果 HTTPS 是用的证书在信任列表中这不要此代理方法
- (void)webView:(WKWebView *)webView didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential *credential))completionHandler {
    
    if ([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust]) {
        if ([challenge previousFailureCount] == 0) {
            
            NSURLCredential *credential = [NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust];
            completionHandler(NSURLSessionAuthChallengeUseCredential, credential);
        } else {
            
            completionHandler(NSURLSessionAuthChallengeCancelAuthenticationChallenge, nil);
        }
    } else {
        
        completionHandler(NSURLSessionAuthChallengeCancelAuthenticationChallenge, nil);
    }
}

// 7页面加载完调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation {
    
    NSLog(@"didFinishNavigation   ====    %@", navigation);
    NSLog(@"%@",webView.title);
    if (webView.canGoBack) {
        
        self.closeBtn.hidden = NO;
        
    }else
    {
        self.closeBtn.hidden = YES;
    }
    
}

// 8页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error {
    
    NSLog(@"didFailProvisionalNavigation   ====    %@\nerror   ====   %@", navigation, error);
    
//    [MBProgressHUD showError:@"网页加载失败" toView:self.view];
}


#pragma mark - 懒加载

- (WKWebView *)webView
{
    if(_webView == nil)
    {
        //初始化一个WKWebViewConfiguration对象
        WKWebViewConfiguration *config = [WKWebViewConfiguration new];
        //初始化偏好设置属性：preferences
        config.preferences = [WKPreferences new];
        //The minimum font size in points default is 0;
        config.preferences.minimumFontSize = 0;
        //是否支持JavaScript
        config.preferences.javaScriptEnabled = YES;
        //不通过用户交互，是否可以打开窗口
        config.preferences.javaScriptCanOpenWindowsAutomatically = YES;
        // 检测各种特殊的字符串：比如电话、网站
        //                config.dataDetectorTypes = UIDataDetectorTypeAll;
        // 播放视频
        config.allowsInlineMediaPlayback = YES;
        
        // 交互对象设置
//        WeakScriptMessageDelegate *weakDelegate = [[WeakScriptMessageDelegate alloc] initWithDelegate:self];
//        config.userContentController = [[WKUserContentController alloc] init];
//        [config.userContentController addScriptMessageHandler:weakDelegate name:@"goDetails"];
//        [config.userContentController addScriptMessageHandler:weakDelegate name:@"wxShareSnapWebView"];
        
        WKWebView *webView = [[WKWebView alloc] initWithFrame:self.view.bounds configuration:config];
        
        webView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        webView.navigationDelegate = self;
        webView.UIDelegate = self;
        //        webView.scrollView.delegate = self;
        
        webView.opaque = NO;
        webView.backgroundColor = [UIColor clearColor];
        
        //滑动返回看这里
        webView.allowsBackForwardNavigationGestures = YES;
        
        [self.view addSubview:webView];
        
        
        if ([self.parentViewController isKindOfClass:[UINavigationController class]]) {

            if ([self respondsToSelector:@selector(ltNavigationHeight:)]) {

                webView.lt_y = [self ltNavigationHeight:nil];
                webView.lt_height = self.view.lt_height - [self ltNavigationHeight:nil] - [LTHelper safebottom];
                // AppDelegate 进行全局设置
                if (@available(iOS 11.0, *)){
                    webView.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
                }
            }

            webView.scrollView.scrollIndicatorInsets = webView.scrollView.contentInset;
        }
        
        
        
        _webView = webView;
    }
    return _webView;
}


- (UIProgressView *)progressView
{
    if(_progressView == nil && [self.parentViewController isKindOfClass:[UINavigationController class]])
    {
        UIProgressView *progressView = [[UIProgressView alloc] init];
        
        [self.view addSubview:progressView];
        
        _progressView = progressView;
        
        progressView.lt_height = 1;
        
        progressView.lt_width = LTScreenWidth;
        
        progressView.lt_y = self.lt_navgationBar.lt_height;
        progressView.tintColor = LTRandomColor;
        
        if ([self respondsToSelector:@selector(webViewController:webViewIsNeedProgressIndicator:)]) {
            
            if (![self webViewController:self webViewIsNeedProgressIndicator:self.webView]) {
                progressView.hidden = YES;
            }
            
        }
        
    }
    return _progressView;
}


- (UIButton *)backBtn
{
    if(_backBtn == nil)
    {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [btn setImage:[UIImage imageNamed:@"LTBaseClasses/navigationButtonReturnClick.png"] forState:UIControlStateHighlighted];
        
        btn.lt_size = CGSizeMake(34, 44);
        
        [btn addTarget:self action:@selector(leftButtonEvent:navigationBar:) forControlEvents:UIControlEventTouchUpInside];
        
        _backBtn = btn;
    }
    return _backBtn;
}

- (UIButton *)closeBtn
{
    if(_closeBtn == nil)
    {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [btn setTitle:@"关闭" forState:UIControlStateNormal];
        
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
        
        btn.titleLabel.font = [UIFont LTFontOfSize:13];
        
        btn.lt_size = CGSizeMake(44, 44);
        
        btn.hidden = YES;
        
        [btn addTarget:self action:@selector(left_close_button_event:) forControlEvents:UIControlEventTouchUpInside];
        
        _closeBtn = btn;
    }
    return _closeBtn;
}

- (void)dealloc
{
    NSLog(@"LTWebViewController -- dealloc");
    
    [_webView.scrollView removeObserverBlocks];
    [_webView removeObserverBlocks];
    
    _webView.UIDelegate = nil;
    _webView.navigationDelegate = nil;
    _webView.scrollView.delegate = nil;
}


@end



// UIWebView 使用的权限认证方式，
//- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
//    if ([navigationAction.request.URL.absoluteString containsString:@"https://"] && IOSVersion < 9.0 && !self.httpsAuth) {
//        self.originRequest = navigationAction.request;
//        self.httpsUrlConnection = [[NSURLConnection alloc] initWithRequest:self.originRequest delegate:self];
//        [self.httpsUrlConnection start];
//        decisionHandler(WKNavigationActionPolicyCancel);
//        return;
//    }
//    decisionHandler(WKNavigationActionPolicyAllow);
//}
//
//- (void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge {
//    if ([challenge previousFailureCount] == 0) {
//        self.httpsAuth = YES;
//        NSURLCredential *credential = [NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust];
//        [challenge.sender useCredential:credential forAuthenticationChallenge:challenge];
//    } else {
//        [[challenge sender] cancelAuthenticationChallenge:challenge];
//    }
//}
//
//- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
//    self.httpsAuth = YES;
//    [self.webView loadRequest:self.originRequest];
//    [self.httpsUrlConnection cancel];
//}
//
//- (BOOL)connection:(NSURLConnection *)connection canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace *)protectionSpace {
//    return [protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust];
//}

