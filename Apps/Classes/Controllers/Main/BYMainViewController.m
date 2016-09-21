//
//  BYMainViewController.m
//  Apps
//
//  Created by BianYong on 16/8/18.
//  Copyright © 2016年 BY. All rights reserved.
//

#import "BYMainViewController.h"
#import "BYHttpEngine.h"
#import "NSData+BYJSONData.h"
#import "UIImageView+WebCache.h"
#import "UIImage+BYCircleImage.h"

@interface BYMainViewController ()

@end

@implementation BYMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	[self.view setBackgroundColor:BG_Color];
	
//	[self bgColorTest];
	
//	[self postTest];
	
//	[self getTest];
	
//	[self loadImageView];
	
//	[self customPicture];
	
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

- (void)customPicture
{
	//配合paintCode获取图片路径
	UIImage *img = nil;
	CGSize areaSize = CGSizeMake(268, 268);
	//开启位图上下文
	UIGraphicsBeginImageContextWithOptions(areaSize, NO, [[UIScreen mainScreen] scale]);
	{
		//绘制路径
		UIBezierPath* bezierPath = UIBezierPath.bezierPath;
		[bezierPath moveToPoint: CGPointMake(224.5, 61.5)];
		[bezierPath addLineToPoint: CGPointMake(217.5, 65.5)];
		[bezierPath addLineToPoint: CGPointMake(202.5, 69.5)];
		[bezierPath addLineToPoint: CGPointMake(188.5, 61.5)];
		[bezierPath addLineToPoint: CGPointMake(170.5, 57.5)];
		[bezierPath addLineToPoint: CGPointMake(156.5, 59.5)];
		[bezierPath addLineToPoint: CGPointMake(140.5, 71.5)];
		[bezierPath addLineToPoint: CGPointMake(133.5, 90.5)];
		[bezierPath addLineToPoint: CGPointMake(133.5, 105.5)];
		[bezierPath addLineToPoint: CGPointMake(111.5, 102.5)];
		[bezierPath addLineToPoint: CGPointMake(97.5, 98.5)];
		[bezierPath addLineToPoint: CGPointMake(84.5, 92.5)];
		[bezierPath addLineToPoint: CGPointMake(74.5, 84.5)];
		[bezierPath addLineToPoint: CGPointMake(65.5, 78.5)];
		[bezierPath addLineToPoint: CGPointMake(58.5, 71.5)];
		[bezierPath addLineToPoint: CGPointMake(51.5, 65.5)];
		[bezierPath addLineToPoint: CGPointMake(49.5, 71.5)];
		[bezierPath addLineToPoint: CGPointMake(46.5, 84.5)];
		[bezierPath addLineToPoint: CGPointMake(49.5, 98.5)];
		[bezierPath addLineToPoint: CGPointMake(53.5, 107.5)];
		[bezierPath addLineToPoint: CGPointMake(60.5, 113.5)];
		[bezierPath addLineToPoint: CGPointMake(65.5, 116.5)];
		[bezierPath addLineToPoint: CGPointMake(58.5, 116.5)];
		[bezierPath addLineToPoint: CGPointMake(46.5, 111.5)];
		[bezierPath addLineToPoint: CGPointMake(46.5, 113.5)];
		[bezierPath addLineToPoint: CGPointMake(51.5, 129.5)];
		[bezierPath addLineToPoint: CGPointMake(58.5, 139.5)];
		[bezierPath addLineToPoint: CGPointMake(65.5, 144.5)];
		[bezierPath addLineToPoint: CGPointMake(70.5, 147.5)];
		[bezierPath addLineToPoint: CGPointMake(76.5, 150.5)];
		[bezierPath addLineToPoint: CGPointMake(60.5, 150.5)];
		[bezierPath addLineToPoint: CGPointMake(65.5, 163.5)];
		[bezierPath addLineToPoint: CGPointMake(76.5, 172.5)];
		[bezierPath addLineToPoint: CGPointMake(86.5, 177.5)];
		[bezierPath addLineToPoint: CGPointMake(94.5, 177.5)];
		[bezierPath addLineToPoint: CGPointMake(97.5, 177.5)];
		[bezierPath addLineToPoint: CGPointMake(81.5, 187.5)];
		[bezierPath addLineToPoint: CGPointMake(63.5, 193.5)];
		[bezierPath addLineToPoint: CGPointMake(49.5, 193.5)];
		[bezierPath addLineToPoint: CGPointMake(39.5, 193.5)];
		[bezierPath addLineToPoint: CGPointMake(53.5, 201.5)];
		[bezierPath addLineToPoint: CGPointMake(65.5, 205.5)];
		[bezierPath addLineToPoint: CGPointMake(81.5, 210.5)];
		[bezierPath addLineToPoint: CGPointMake(97.5, 210.5)];
		[bezierPath addLineToPoint: CGPointMake(113.5, 210.5)];
		[bezierPath addLineToPoint: CGPointMake(130.5, 207.5)];
		[bezierPath addLineToPoint: CGPointMake(151.5, 198.5)];
		[bezierPath addLineToPoint: CGPointMake(168.5, 187.5)];
		[bezierPath addLineToPoint: CGPointMake(183.5, 172.5)];
		[bezierPath addLineToPoint: CGPointMake(194.5, 157.5)];
		[bezierPath addLineToPoint: CGPointMake(200.5, 144.5)];
		[bezierPath addLineToPoint: CGPointMake(205.5, 129.5)];
		[bezierPath addLineToPoint: CGPointMake(209.5, 113.5)];
		[bezierPath addLineToPoint: CGPointMake(209.5, 102.5)];
		[bezierPath addLineToPoint: CGPointMake(209.5, 95.5)];
		[bezierPath addLineToPoint: CGPointMake(217.5, 90.5)];
		[bezierPath addLineToPoint: CGPointMake(228.5, 76.5)];
		[bezierPath addLineToPoint: CGPointMake(217.5, 80.5)];
		[bezierPath addLineToPoint: CGPointMake(209.5, 80.5)];
		[bezierPath addLineToPoint: CGPointMake(221.5, 69.5)];
		[bezierPath addLineToPoint: CGPointMake(224.5, 61.5)];
		[bezierPath closePath];
		[[UIColor whiteColor] setFill];
		[bezierPath fill];
		[BG_Color setStroke];
		bezierPath.lineWidth = 1;
		[bezierPath stroke];
	}
	//获取位图上下文（图片内容）
	img = UIGraphicsGetImageFromCurrentImageContext();
	//关闭位图上下文
	UIGraphicsEndImageContext();
	
	UIImageView *customImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 50, 100, 100)];
	customImageView.backgroundColor = [UIColor orangeColor];
	customImageView.image = img;
	[self.view addSubview:customImageView];
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
	[btn setImage:[UIImage imageNamed:@"123"] forState:UIControlStateNormal];
	btn.frame = CGRectMake(0, 0, 100, 100);
	[btn layoutSubviews];
	
	UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(50, 50, 100, 40)];
//	searchBar.backgroundImage = [UIImage imageNamed:@"123"];
//	[searchBar setImage:[UIImage imageNamed:@"123"] forSearchBarIcon:nil state:nil];
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
	CGContextRelease(bitmapRef);
	CGImageRelease(bitmapImage);
	
	return [UIImage imageWithCGImage:scaledImage];
}

#pragma mark- Setter and getter
#pragma mark- Square area

@end
