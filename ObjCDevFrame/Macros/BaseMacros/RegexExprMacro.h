//
//  RegexExprMacro.h
//  ObjCDevFrame
//
//  Created by QiuZhaoHai on 2020/3/26.
//  Copyright © 2020 QiuZhaoHai. All rights reserved.
//

#ifndef RegexExprMacro_h
#define RegexExprMacro_h

// 匹配邮箱
#define EmailRegexExpr "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
// 匹配电话号码 (11)
#define PhoneNumberRegexExpr "1\\d{10}"
// 匹配密码 (6 ~ 16)
#define PasswordRegexExpr "^[a-z0-9_-]{6,16}$"
// 匹配URL
#define URLRegexExpr "^(https?:\\/\\/)?([\\da-z\\.-]+)\\.([a-z\\.]{2,6})([\\/\\w \\.-]*)*\\/?$"
// 匹配IP地址
#define IPAddressRegexExpr "^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$"

#endif /* RegexExprMacro_h */
