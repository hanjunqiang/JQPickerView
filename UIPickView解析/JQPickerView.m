/**
     component：表示部分（列）
 
*/

#import "JQPickerView.h"

@interface JQPickerView()<UIPickerViewDelegate,UIPickerViewDataSource>

@property (nonatomic, strong) UILabel *rowLabel;

@end
@implementation JQPickerView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {


        self.delegate = self;
        self.dataSource = self;

        

    }
    return self;
}

//有多少列
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return self.dataArray.count;
}

//每列对应的行数
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [self.dataArray[component] count];
}

//每一行的高度
-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return _rowHeight?_rowHeight:44;
}

//只有用户手动拖拽的时候，才会调用。
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSLog(@"选中了---%zd部分，---%zd行。",component,row);

    NSLog(@"选中内容---%@",self.dataArray[component][row]);

}




//每一行的标题
//-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
//    return self.dataArray[component][row];
//}

/**
     每一行的标题（富文本）（优先级比返回每一行的标题高！）
     注意：不能改变字体的大小！！！
*/
//- (nullable NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component NS_AVAILABLE_IOS(6_0) __TVOS_PROHIBITED{

//    NSDictionary *dictAttr0 = @{NSFontAttributeName:[UIFont systemFontOfSize:5]}; //字体大小,不起作用。
//    NSDictionary *dictAttr2 = @{NSBackgroundColorAttributeName:[UIColor cyanColor]};  //字体背景色（有效果）

    
//    NSDictionary *dictAttr1 = @{NSForegroundColorAttributeName:[UIColor purpleColor]}; //字体颜色（有效果）
//    if(component == 0){
//        dictAttr1 = @{NSForegroundColorAttributeName:[UIColor redColor]};
//    }else if (component == 1){
//        dictAttr1 = @{NSForegroundColorAttributeName:[UIColor greenColor]};
//    }else if (component == 2){
//        dictAttr1 = @{NSForegroundColorAttributeName:[UIColor blueColor]};
//    }
//
//    return [[NSAttributedString alloc] initWithString:self.dataArray[component][row] attributes:dictAttr1];
//
//}


/**
     每一行返回自定义view（优先级比返回每一行的标题（或富文本）高！）
     注意：该方法不是循环利用的，所以需要每行都创建一个label，而不能使用懒加载。
 
     这里也可以设置不同列，显示不同的颜色、大小。
*/
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(nullable UIView *)view __TVOS_PROHIBITED{

    _rowLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width/self.dataArray.count, _rowHeight?_rowHeight:44)];
    _rowLabel.font = [UIFont systemFontOfSize:_titleFontValue?_titleFontValue:17];
    _rowLabel.textColor = [UIColor blackColor];
    _rowLabel.text = self.dataArray[component][row];
    _rowLabel.textAlignment = NSTextAlignmentCenter;
    
    return self.rowLabel;
}


@end
