//
//  BYCViewController.m
//  Apps
//
//  Created by BianYong on 16/9/23.
//  Copyright © 2016年 BY. All rights reserved.
//

#import "BYCViewController.h"
#import <WebKit/WebKit.h>

@interface BYCViewController () <WKNavigationDelegate, WKScriptMessageHandler, WKUIDelegate>

@property (nonatomic, strong) WKWebView *webView;

@end

@implementation BYCViewController
#pragma mark- Live circle
- (void)viewDidLoad {
	[super viewDidLoad];
	
	[self initSetting];
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	
	MISLogFunc
	[self loadData];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

- (void)dealloc
{
	[self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
	[self.webView removeObserver:self forKeyPath:@"title"];
}

#pragma mark- Delegate
//WKNavigationDelegate
/*
 该代理方法主要是用来追踪webview的加载过程，
 和传统的UIWebView比较相似，
 分别对页面开始加载、加载完成、加载失败等几个过程进行事件捕捉和追踪，
 另外在页面的跳转时也可对其进行拦截处理、如过滤某些特定网页等业务操作
 */

/** 在发送请求之前，决定是否跳转 */
//- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler
//{
//    MISLogFunc
//    MISLog(@"****************");
//    if ([navigationAction.request.URL.host.lowercaseString isEqualToString:@"www.baidu.com"]) {
//        NSString *js = @"window.alert('test test');";
//        [self.webView evaluateJavaScript:js completionHandler:^(id _Nullable result, NSError * _Nullable error) {
//            NSLog(@"加载JS数据");
//            NSLog(@"load js error detail : result :%@\n error : %@", result, error);
//        }];
//        decisionHandler(WKNavigationActionPolicyAllow);
//        return;
//    }
//
//    decisionHandler(WKNavigationActionPolicyCancel);
//}

/** 在收到响应后，决定是否跳转 */
//- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler
//{
//	// 如果响应的地址是百度，则允许跳转
//	if ([navigationResponse.response.URL.host.lowercaseString isEqual:@"www.baidu.com"]) {
//		decisionHandler(WKNavigationResponsePolicyAllow);
//		return;
//	}
//	
//	//否则不允许跳转
//	decisionHandler(WKNavigationResponsePolicyCancel);
//}

/** 页面开始加载时调用 */
//- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation
//{
//	
//}

/** 接收到服务器跳转请求之后调用 */
//- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(null_unspecified WKNavigation *)navigation
//{
//	
//}

//- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error
//{
//	
//}

/** 当内容开始返回时调用 */
//- (void)webView:(WKWebView *)webView didCommitNavigation:(null_unspecified WKNavigation *)navigation
//{
//	
//}

/** 页面加载完成之后调用 */
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
	NSLog(@"############ : didFinishNavigation");
}

/** 页面加载失败时调用 */
//- (void)webView:(WKWebView *)webView didFailNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error
//{
//	
//}

//- (void)webView:(WKWebView *)webView didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential * _Nullable credential))completionHandler
//{
//	
//}

//WKScriptMessageHandler
/*
 是APP与Web进行交互的关键
 */
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message
{
	MISLogFunc
	NSLog(@"webView detail %@", message);
}

//WKUIDelegate
/*
 这个代理中包含3个针对于web界面的三种提示框（警告框、确认框、输入框）的弹出事件捕捉
 */
//- (nullable WKWebView *)webView:(WKWebView *)webView createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration forNavigationAction:(WKNavigationAction *)navigationAction windowFeatures:(WKWindowFeatures *)windowFeatures
//{
//	return nil;
//}

//- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler
//{
//	
//}

//- (void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL result))completionHandler
//{
//	
//}

//- (void)webView:(WKWebView *)webView runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(nullable NSString *)defaultText initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(NSString * _Nullable result))completionHandler
//{
//	
//}

/** webview关闭事件 */
//- (void)webViewDidClose:(WKWebView *)webView
//{
//	
//}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
	if ([keyPath isEqualToString:@"estimatedProgress"]) {
		NSLog(@"estimatedProgress : %fd", self.webView.estimatedProgress);
	}
	
	if ([keyPath isEqualToString:@"title"]) {
		self.title = self.webView.title;
	}
}

#pragma mark- Notification methods
#pragma mark- Interface methods
#pragma mark- Event Response methods

#pragma mark- Net request
#pragma mark- Private methods
- (void)initSetting
{
	self.title = @"WKWebView";
	
	[self.view addSubview:self.webView];
//	self.view = self.webView;
}

- (void)loadData
{
    //text :@"http://47.93.233.74/firstIndex.html"
    NSString *urlString = @"http://www.baidu.com";
	NSURL *url = [NSURL URLWithString:urlString];
	NSURLRequest *request = [NSURLRequest requestWithURL:url];
	[self.webView loadRequest:request];
}

- (void)testAlert
{
	NSString *js = @"window.alert('欢迎体验WkWebView!!');";
	[_webView evaluateJavaScript:js completionHandler:nil];
}

#pragma mark- Setter and getter
- (WKWebView *)webView
{
	if (!_webView) {
		_webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, VIEW_HEIGHT)];
		_webView.navigationDelegate = self;
		_webView.UIDelegate = self;
		_webView.backgroundColor = BG_Color;
		[_webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:NULL];
		[_webView addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:NULL];
	}
	return _webView;
}

#pragma mark- Square area

@end
