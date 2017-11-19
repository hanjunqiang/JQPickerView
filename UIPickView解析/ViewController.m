//
//  ViewController.m
//  UIPickView解析
//
//  Created by 韩军强 on 2017/11/19.
//  Copyright © 2017年 韩军强. All rights reserved.
//

#import "ViewController.h"
#import "JQPickerView.h"
#import "JQDatePicker.h"
@interface ViewController ()

@property (nonatomic, strong) JQDatePicker *datePicker;
@end

@implementation ViewController

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"foods.plist" ofType:nil];
    NSMutableArray *array = [[NSArray arrayWithContentsOfFile:filePath] mutableCopy];
    
    JQPickerView *pickerView = [[JQPickerView alloc] initWithFrame:CGRectMake(0, 200, SCREEN_WIDTH, 200)];
    pickerView.dataArray = array;
    [self.view addSubview:pickerView];
    
    /**
        注意：
         选中某一行时，不会调用pickerView:didSelectRow:inComponent:方法
         所以，如果想调用，必须自己手动调用。
    */
    for (int i = 0; i<3; i++) {
        
        [pickerView selectRow:2 inComponent:i animated:YES];
        [pickerView pickerView:nil didSelectRow:2 inComponent:i];
        
    }
    
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
