//
//  BYMainViewController.m
//  Apps
//
//  Created by BianYong on 16/8/18.
//  Copyright © 2016年 BY. All rights reserved.
//

#import "BYMViewController.h"
#import "BYHttpEngine.h"
#import "NSData+BYJSONData.h"
#import "UIImageView+WebCache.h"
#import "UIImage+BYCircleImage.h"

@interface BYMViewController ()

@end

@implementation BYMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	[self.view setBackgroundColor:BG_Color];
	
//	[self bgColorTest];
	
//	[self postTest];
	
//	[self getTest];
	
//	[self loadImageView];
		
//	[self test];
	
//	[self obtainAppInfoInAppStore];
	
//	[self checkElement];
	
//	[self UMStatistics];
	
	[self testQR];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark- Live circle
#pragma mark- Delegate
#pragma mark- Notification methods
#pragma mark- Interface methods
#pragma mark- Event Response methods
#pragma mark- Net request
//AFN post test
- (void)postTest
{
	[BYHttpEngine obtainDataListWithParams:nil completionHandler:^(NSData *responseData) {
		NSDictionary *json = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:nil];
		NSLog(@"request result : %@", json);
	} errorHandler:^(NSError *error) {
		NSLog(@"error result : %s %@", __func__, error.description);
	}];
}

//AFN get test
- (void)getTest
{
	[BYHttpEngine obtainTokenWithParamDict:nil completionHandler:^(NSData *responseData) {
		NSDictionary *json = [responseData JSONData];
		NSLog(@"obtain token result : %@", json);
		
	} errorHandler:^(NSError *error) {
		NSLog(@"error result : %s %@", __func__, error.description);
	}];
}

//AFN load imageView test
- (void)loadImageView
{
	CGFloat imgW = 47;
	CGFloat imgH = 47;
	UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 50, imgW, imgH)];
	imgView.backgroundColor = [UIColor orangeColor];
	NSURL *imageViewURL = [NSURL URLWithString:@"http://www.uimaker.com/uploads/allimg/111101/1_111101085050_3.jpg"];
//	[imgView sd_setImageWithURL:imageViewURL];
	[imgView sd_setImageWithURL:imageViewURL completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//		imgView.image = [image circleImageWithoutBgColorWithSize:CGSizeMake(100, 100)];
		imgView.image = [image circleImageWithBgColor:[UIColor whiteColor] edgeWidth:2 size:CGSizeMake(imgW, imgH)];
	}];
	[self.view addSubview:imgView];
	
	UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectMake(50, 200, 200, 200)];
	imgV.contentMode = UIViewContentModeScaleAspectFit;
	imgV.backgroundColor = [UIColor purpleColor];
	NSURL *imageVURL = [NSURL URLWithString:@"http://www.uimaker.com/uploads/allimg/111101/1_111101085050_3.jpg"];
	[imgV sd_setImageWithURL:imageVURL completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//		imgV.image = [image circleImageWithoutBgColorWithSize:CGSizeMake(100, 100)];
		imgV.image = [image circleImageWithBgColor:[UIColor whiteColor] edgeWidth:2 size:CGSizeMake(100, 100)];
	}];
	[self.view addSubview:imgV];
	
	UIImageView *igV = [[UIImageView alloc] initWithFrame:CGRectMake(50, 500,100, 100)];
	igV.contentMode = UIViewContentModeScaleAspectFit;
	igV.backgroundColor = [UIColor redColor];
	UIImage *im = [UIImage imageNamed:@"MISQuanKTIcon"];
	NSLog(@"im size : %@",NSStringFromCGSize(im.size));
	igV.image = [im circleImageWithoutBgColorWithSize:CGSizeMake(24, 24)];
	
	[self.view addSubview:igV];
}

#pragma mark- Private methods
//bg color test
- (void)bgColorTest
{
#if KAppA
	[self.view setBackgroundColor:BG_Color];
#elif KAppB
	[self.view setBackgroundColor:BG_Color_Sub];
#endif
}

- (void)test
{
	NSLog(@"test : %d", 123);
	BYLog(@"1111")
	BYLogFunc
	BYLogLine
}

- (void)obtainAppInfoInAppStore
{
	NSString *interfacePath = @"http://itunes.apple.com/lookup?id=899039323";
	[BYHttpEngine getRequestWithInterfacePath:interfacePath params:nil completionHandler:^(NSData *responseData) {
		NSDictionary *jsonDic = [responseData JSONData];
		NSArray *resultArray = jsonDic[@"results"];
		NSDictionary *resultDic = [resultArray lastObject];
		
		NSString *appVersionNum = resultDic[@"version"];
		BYLog(@"version : %@", appVersionNum);
//		BYLog(@"request result : %@", jsonDic);
	} errorHandler:^(NSError *error) {
		BYLogFunc
	}];
}

- (void)checkElement
{
	UIButton *btn = [[UIButton alloc] init];
	[btn setTitle:@"111" forState:UIControlStateNormal];
	[btn setImage:[UIImage imageNamed:@"twitterIcon"] forState:UIControlStateNormal];
	btn.frame = CGRectMake(0, 0, 100, 100);
	[btn layoutSubviews];
	
	UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(50, 50, 100, 40)];
//	searchBar.backgroundImage = [UIImage imageNamed:@"twitterIcon"];
//	[searchBar setImage:[UIImage imageNamed:@"twitterIcon"] forSearchBarIcon:nil state:nil];
//	[searchBar layoutSubviews];
	
	BYLog(@"##### #### : %@", searchBar);
	for (UIView *vw in searchBar.subviews) {
		BYLog(@"class : %@", vw);
		
		for (UIView *v in vw.subviews) {
			
			
			if ([v isKindOfClass:NSClassFromString(@"UISearchBarTextField")]) {
				v.backgroundColor = [UIColor orangeColor];
			}

			
			BYLog(@"subview class : %@", v);
			
			for (UIView *ssv in v.subviews) {
				if ([v isKindOfClass:NSClassFromString(@"UISearchBarSearchFieldBackgroundView")]) {
					v.backgroundColor = [UIColor orangeColor];
					
				}
				BYLog(@"ssv class : %@", ssv);
				
				for (UIView *sbv in ssv.subviews) {
					BYLog(@"sbv : %@", sbv);
				}
			}
		}
	}
	
	[self.view addSubview:searchBar];
}

- (void)UMStatistics
{
	UIButton *umBtn = [UIButton buttonWithType:UIButtonTypeCustom];
	umBtn.frame = CGRectMake(50, 50, 100, 40);
	umBtn.backgroundColor = [UIColor orangeColor];
	[umBtn addTarget:self action:@selector(um:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:umBtn];
}

- (void)um:(UIButton *)sender
{
	[MobClick event:UMEventAfantiMyQuestion];
}

- (void)testQR
{
	//通过滤镜CIFilter生成二维码
	//创建过滤器
	CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
	
	//恢复默认
	[filter setDefaults];
	
	//给过滤器添加数据（需要生成二维码的数据）数据类型：纯文本、名片、URL
	NSString *dataString = @"自定义信息";
	NSData *qrData = [dataString dataUsingEncoding:NSUTF8StringEncoding];
	//通过KVO设置滤镜数据：inputMessage
	[filter setValue:qrData forKeyPath:@"inputMessage"];
	
	//输出二维码
	CIImage *outputImage = [filter outputImage];
	
	UIImageView *qrImageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 50, 250, 250)];
	qrImageView.image = [self qrImageWithCIImage:outputImage size:250];
	[self.view addSubview:qrImageView];
}

- (UIImage *)qrImageWithCIImage:(CIImage *)ciImage size:(CGFloat)size
{
	CGRect extent = CGRectIntegral(ciImage.extent); //二维码的实际大小
	CGFloat scale = MIN(size / CGRectGetWidth(extent), size / CGRectGetHeight(extent)); //缩放比例
	
	//创建bitmap
	size_t w = CGRectGetWidth(extent) * scale;
	size_t h = CGRectGetHeight(extent) * scale;
	
	CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray(); //颜色通道
	CGContextRef bitmapRef = CGBitmapContextCreate(nil, w, h, 8, 0, cs, kCGImageAlphaNone); //创建上下文
	
	CIContext *context = [CIContext contextWithOptions:nil];
	CGImageRef bitmapImage = [context createCGImage:ciImage fromRect:extent];
	CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
	CGContextScaleCTM(bitmapRef, scale, scale);
	CGContextDrawImage(bitmapRef, extent, bitmapImage); //画位图
	
	//保存bitmap(位图)到图片
	CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
	UIImage *qrImage = [UIImage imageWithCGImage:scaledImage];
	
	CGImageRelease(bitmapImage);
	CGImageRelease(scaledImage);
	CGContextRelease(bitmapRef);
	CGColorSpaceRelease(cs);
	
	return qrImage;
}

#pragma mark- Setter and getter
#pragma mark- Square area

@end
