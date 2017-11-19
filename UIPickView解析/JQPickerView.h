//
//  JQPickerView.h
//  UIPickView解析
//
//  Created by 韩军强 on 2017/11/19.
//  Copyright © 2017年 韩军强. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JQPickerView : UIPickerView

@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, assign) CGFloat titleFontValue;   //每一行字体大小
@property (nonatomic, assign) CGFloat rowHeight;


//因为是代理方法，所以如果想在外面调用，需要在头文件中声明一下该方法。
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component;

@end
