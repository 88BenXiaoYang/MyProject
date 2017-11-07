//
//  BYJSTOCViewController.m
//  Apps
//
//  Created by bianyong on 2017/11/2.
//  Copyright © 2017年 BY. All rights reserved.
//

#import "BYJSTOCViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import "TestJSObject.h"

@protocol JSDelegate <JSExport>

- (void)jsToOCVCNoArgument;
- (void)jsToOCVCOneArgument:(NSString *)argument;
- (void)jsToOCVCTwoArgument:(NSString *)oneArg arg:(NSString *)twoArg;

@end

@interface BYJSTOCViewController ()<UIWebViewDelegate, JSDelegate>

@property (nonatomic, strong) UIWebView *webView;

@end

@implementation BYJSTOCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.webView];
    
    [self loadLocalHTML];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc
{
    NSLog(@"### dealloc ###");
    NSLog(@"%s", __func__);
}

- (void)loadLocalHTML
{
    NSString *path = [[NSBundle mainBundle] bundlePath];
    NSURL *baseURL = [NSURL fileURLWithPath:path];
    NSString * htmlPath = [[NSBundle mainBundle] pathForResource:@"test"
                                                          ofType:@"html"];
    NSString * htmlCont = [NSString stringWithContentsOfFile:htmlPath
                                                    encoding:NSUTF8StringEncoding
                                                       error:nil];
    [self.webView loadHTMLString:htmlCont baseURL:baseURL];
}

- (UIWebView *)webView
{
    if (!_webView) {
        _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
        _webView.backgroundColor = [UIColor whiteColor];
        _webView.delegate = self;
    }
    return _webView;
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *url = request.URL.absoluteString;
    NSLog(@"request url : %@", url);
    if ([url rangeOfString:@"customprotocol://"].location != NSNotFound) {
        //符合约定的协议头
        NSLog(@"custom_protocol : %@", url);
        return NO;
    }
    return YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    self.title = [self.webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    
    //获取JS的上下文环境
    JSContext *context = [self.webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    
    //避免循环引用
    __weak typeof(self) weakself = self;
    
    //block交互方式，注意事项见"JS和OC交互使用Block的注意事项"
    //注入需要JS代码调用的原生代码（触发H5界面的JS代码 -> 原生代码）
    //下标名称，与H5中对应的方法名一致(方法名严格区分大小写)
    context[@"jsToOcWithBlock"] = ^() {
        //arguments array
        NSArray *arguments = [JSContext currentArguments];
        
        for (JSValue *jsVal in arguments) {
            NSString *argumentString = [NSString stringWithFormat:@"%@", jsVal];
            
            if ([argumentString isEqualToString:@"jToWithBlock"]) {
                NSLog(@"js to oc with block");
                [weakself ocToJs];
            }
        }
    };
    
    //js方法注入与H5原有同名方法会把H5原有同名方法给覆盖了,
    /*
     context[@"loadWeb"] = ^(){
     NSLog(@"### loadWeb ###");
     
     NSString *urlString = @"https://www.sina.com.cn";
     NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
     [self.webView loadRequest:request];
     };
     */
    
    //模型交互方式 --- 模型通过遵循JSExport协议的类来实现，这种方式可以避免循环引用
    context[@"jsOCModel"] = [[TestJSObject alloc] init];
    
    //模型交互方式 --- 模型通过自身控制器类对象实现
    //    context[@"jsOCVC"] = weakself; //这种交互方式会产生循环引用
    
    //    context[@"log"] = ^() {
    //        NSLog(@"log###");
    //        NSArray *jsValues = [JSContext currentArguments];
    //
    //        for (JSValue *jsVa in jsValues) {
    //            NSString *jsVaString = [NSString stringWithFormat:@"%@", jsVa];
    //            NSLog(@"js_context : %@", jsVaString);
    //        }
    //
    //        JSValue *this = [JSContext currentThis];
    //        NSLog(@"jsValue this : %@", this);
    //    };
    
    context.exceptionHandler = ^(JSContext *context, JSValue *exceptionValue) {
        context.exception = exceptionValue;
        NSLog(@"异常信息：%@", exceptionValue);
    };
    
    //    [context evaluateScript:@"log('ider', [1,2], {hello:'world', js:100});"];
    
    //jscontext环境是在<script>标签加载的时候或加载完获取的，如H5内容中有按钮响应方法，但未在<script>标签中声明对应的方法，通过对应方法名作为jscontext的标签能获取到对应的方法。推论：如<script>标签内未声明实现对应的方法，“引擎”会自动声明对应的方法，需要验证（通过jscontext依据<script>加载获取context上下文时的机制）？？？
    //currentArguments 获取到的是哪部分的参数数组，H5中怎样组织代码？？？   //currentArguments是获取到的方法参数数组
    //js参数个数不限制，类型怎样确定
    //js与原生的交互中，context通过标签注入方法，要使注入的方法生效，标签名应与H5中的方法名一致，同时H5中的方法要有完整的方法签名，即：方法签名=方法名+参数列表
    
    //注：JS中如果调用的方法是多个参数的，必须使用驼峰写法并去掉冒号
    //如：
    //JS中调用：jsOCVC.jsToOCVCTwoArgumentArg('vc111', 'vc222')
    //OC中对应的方法：- (void)jsToOCVCTwoArgument:(NSString *)oneArg arg:(NSString *)twoArg;
    
    //注：遵循JSExport协议的协议方法列表内的方法必须为require属性的，否则方法不生效
}

- (void)jsToOCVCNoArgument
{
    NSLog(@"js to oc with VC no argument");
}

- (void)jsToOCVCOneArgument:(NSString *)argument
{
    NSLog(@"js to oc with VC one argument=%@", argument);
}

- (void)jsToOCVCTwoArgument:(NSString *)oneArg arg:(NSString *)twoArg
{
    NSLog(@"js to oc with VC two argument: argumentA=%@, arguentB=%@", oneArg, twoArg);
}

- (void)ocToJs
{
    //实现OC往JS传值回调，三种方法：
    //方法一：stringByEvaluatingJavaScriptFromString
    //方法二：evaluateScript
    //方法三：callWithArguments
    
    //区别上述三种方法的不同：
    /*
     // UIWebView的方法
     - (nullable NSString *)stringByEvaluatingJavaScriptFromString:(NSString *)script;
     
     // JavaScriptCore中JSContext的方法
     - (JSValue *)evaluateScript:(NSString *)script;
     - (JSValue *)evaluateScript:(NSString *)script withSourceURL:(NSURL *)sourceURL
     */
    
    /*
     stringByEvaluatingJavaScriptFromString是一个同步的方法，使用它执行JS方法时，如果JS 方法比较耗的时候，会造成界面卡顿。尤其是js 弹出alert 的时候。
     alert 也会阻塞界面，等待用户响应，而stringByEvaluatingJavaScriptFromString又会等待js执行完毕返回。这就造成了死锁。
     */
    //    [self.webView stringByEvaluatingJavaScriptFromString:@"showAlert('oc to js !!!')"];
    
    //    dispatch_async(dispatch_get_main_queue(), ^{
    //        [self.webView stringByEvaluatingJavaScriptFromString:@"showAlert('oc to js !!!')"];
    //    });
    
    JSContext *context = [self.webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    //     NSString *textJS = @"showAlert('这里是JS中alert弹出的message')";
    //     [context evaluateScript:textJS];
    
    //通过callWithArguments这种方式回调到JS，只需要<script>标签下有对应的方法
    JSValue *jsParamFunc = context[@"jsParamFunc"];
    [jsParamFunc callWithArguments:@[@"jsParamFuncCallBack_AAAAAAAAA"]];
}

/*
 JS和OC交互中涉及内存泄漏，可参考：http://www.jianshu.com/p/939db6215436
 JS和OC交互使用Block的注意事项：
 从之前的例子和介绍应该有体会到Block在JavaScriptCore中起到的强大作用，它在JavaScript和Objective-C之间的转换 建立起更多的桥梁，让互通更方便。但是要注意的是无论是把Block传给JSContext对象让其变成JavaScript方法，还是把它赋给exceptionHandler属性，在Block内都不要直接使用其外部定义的JSContext对象或者JSValue，应该将其当做参数传入到Block中，或者通过JSContext的类方法+ (JSContext )currentContext;来获得。否则会造成循环引用使得内存无法被正确释放。比如上边自定义异常处理方法，就是赋给传入JSContext对象con，而不是其外创建的context对象，虽然它们其实是同一个对象。这是因为Block会对内部使用的在外部定义创建的对象做强引用，而JSContext也会对被赋予的Block做强引用，这样它们之间就形成了循环引用使得内存无法正常释放。对于JSValue也不能直接从外部引用到Block中，因为每个JSValue上都有JSContext
 的引用 (@property(readonly, retain) JSContext context;)，JSContext再引用Block同样也会形成引用循环。
 前面十分的简单方便而且高效，不过也仅限于数值型、布尔型、字符串、数组等这些基础类型。
 */

@end
