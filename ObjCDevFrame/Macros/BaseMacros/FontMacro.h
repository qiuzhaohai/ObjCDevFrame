//
//  FontMacro.h
//  ObjCDevFrame
//
//  Created by QiuZhaoHai on 2020/3/23.
//  Copyright © 2020 QiuZhaoHai. All rights reserved.
//

#ifndef FontMacro_h
#define FontMacro_h

// 系统默认字体设置和自选字体设置
#define SystemFontSize(fontsize)            [UIFont systemFontOfSize:(fontsize)]
#define SystemBoldFontSize(fontsize)        [UIFont boldSystemFontOfSize:(fontsize)]
#define FontStyle(fontname,fontsize)   [UIFont fontWithName:fontname size:fontsize]

#endif /* FontMacro_h */
