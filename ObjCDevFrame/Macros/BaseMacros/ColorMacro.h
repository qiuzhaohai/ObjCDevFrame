//
//  ColorMacro.h
//  ObjCDevFrame
//
//  Created by QiuZhaoHai on 2020/3/23.
//  Copyright © 2020 QiuZhaoHai. All rights reserved.
//

#ifndef ColorMacro_h
#define ColorMacro_h

// 设置RGB常用方法宏

#define RGB(r, g, b)       [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBA(r, g, b, a)   [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define RGBHex(rgbHex)     [UIColor colorWithRed:((float)((rgbHex & 0xFF0000) >> 16)) / 255.0 green:((float)((rgbHex & 0xFF00) >> 8)) / 255.0 blue:((float)(rgbHex & 0xFF)) / 255.0 alpha:1]
#define RGBAHex(rgbHex, a) [UIColor colorWithRed:((float)(((rgbHex) & 0xFF0000) >> 16))/255.0 green:((float)(((rgbHex) & 0xFF00)>>8))/255.0 blue: ((float)((rgbHex) & 0xFF))/255.0 alpha:(a)]
#define RandomColor(a)    [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:(a)]

///常用颜色

#define black_color     [UIColor blackColor]
#define blue_color      [UIColor blueColor]
#define brown_color     [UIColor brownColor]
#define darkGray_color  [UIColor darkGrayColor]
#define darkText_color  [UIColor darkTextColor]
#define white_color     [UIColor whiteColor]
#define yellow_color    [UIColor yellowColor]
#define red_color       [UIColor redColor]
#define orange_color    [UIColor orangeColor]
#define purple_color    [UIColor purpleColor]
#define lightText_color [UIColor lightTextColor]
#define lightGray_color [UIColor lightGrayColor]
#define green_color     [UIColor greenColor]
#define gray_color      [UIColor grayColor]
//清空颜色
#define clear_color     [UIColor clearColor]


#endif /* ColorMacro_h */
