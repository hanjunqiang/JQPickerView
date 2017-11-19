//
//  JQDatePicker.m
//  UIPickView解析
//
//  Created by 韩军强 on 2017/11/19.
//  Copyright © 2017年 韩军强. All rights reserved.
//

#import "JQDatePicker.h"

@interface JQDatePicker()

@property (nonatomic, strong) SelectBlock selectBlock;

@end

@implementation JQDatePicker


-(instancetype)jq_initWithFrame:(CGRect)frame selectCurrentTime:(SelectBlock)selectBlock
{
    /**
        注意：
             1，这里不能再创建一个JQDatePicker，会使选中方法中的self.selectBlock为空。
             2，因为selectBlock是与当前类self绑定的，但是呢，我们返回的却是新创键的JQDatePicker对象。
             3，返回时，调用系统的初始化方法即可。
     */
    
    /**
     以下为全部样式
     typedef NS_ENUM(NSInteger, UIDatePickerMode) {
         UIDatePickerModeTime,           // 只显示时间
         UIDatePickerModeDate,           // 只显示日期
         UIDatePickerModeDateAndTime,    // 显示日期和时间
         UIDatePickerModeCountDownTimer  // 只显示小时和分钟 倒计时定时器
     };
     */
    self.datePickerMode = UIDatePickerModeDateAndTime;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //设置该属性时，延迟0.5s,不然无效！！！
        self.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
    });

    [self addTarget:self action:@selector(oneDatePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    self.selectBlock = selectBlock;
    
    return [self initWithFrame:frame];
}

#pragma mark - 实现oneDatePicker的监听方法
- (void)oneDatePickerValueChanged:(UIDatePicker *) sender {
    
    NSDate *select = [sender date]; // 获取被选中的时间
    
    NSDateFormatter *selectDateFormatter = [[NSDateFormatter alloc] init];
    NSString *jq_dateformat = @"yyyy-MM-dd HH:mm:ss";
    selectDateFormatter.dateFormat = self.dateFormat?self.dateFormat:jq_dateformat; // 设置时间和日期的格式
    NSString *dateAndTime = [selectDateFormatter stringFromDate:select]; // 把date类型转为设置好格式的string类型
    
    if (self.selectBlock) {
        self.selectBlock(dateAndTime);
    }
    
    // 在控制台打印消息
//    NSLog(@"%@", [sender date]);
//    NSLog(@"dateAndTime---%@", dateAndTime);
}


@end
