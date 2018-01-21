//
//  ViewController.m
//  UITable_Demo
//
//  Created by 仝兴伟 on 2018/1/21.
//  Copyright © 2018年 仝兴伟. All rights reserved.
//

#import "ViewController.h"
#import "MyTableViewCell.h"

#define _TBL_TAG_SECTION(_TAG) ((_TAG)|(1<<30))
#define _TBL_TAG_CLEAR(_TAG) ((_TAG)&((1<<30)-1))
#define _TBL_TAG_IS_SECTION(_TAG) ((_TAG)>>30)

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>
@property (nonatomic, strong) UITableView *tableviews;
@property (nonatomic, strong) NSMutableArray *listArray;

@property (nonatomic, strong, readwrite) NSMutableArray *headerArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self addTable];
   
    [self addButton];
    
}


- (void) addButton {
    UIButton *buttonClick = [[UIButton alloc]initWithFrame:CGRectMake((self.view.bounds.size.width - 100) / 2, 470 , 100, 40)];
    buttonClick.backgroundColor = [UIColor redColor];
    [buttonClick setTitle:@"点击" forState:UIControlStateNormal];
    [buttonClick addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonClick];
}

- (void)addTable {
    self.tableviews = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 400) style:(UITableViewStylePlain)];
    self.tableviews.delegate = self;
    self.tableviews.dataSource = self;
    [self.view addSubview:self.tableviews];
    self.tableviews.tableFooterView = [[UIView alloc] init];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    static NSString *ideitifier = @"tgCell";
     NSString *ideitifier = [NSString stringWithFormat:@"%ld", (long)indexPath.row];

    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ideitifier];
    if (cell == nil) {
        cell = [[MyTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ideitifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.listArray addObject:cell];
    }
     cell.textFields.tag = indexPath.row;
    cell.textFields.delegate = self;
    [cell.textFields addTarget:self action:@selector(textFieldWithText:) forControlEvents:UIControlEventEditingChanged];
    return  cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (void)textFieldWithText:(UITextField *)textField {
    /*
    NSArray *visible = [self.tableviews indexPathsForVisibleRows];
    NSIndexPath *indexpath = (NSIndexPath*)[visible objectAtIndex:textField.tag];
    MyTableViewCell *cell = [self.tableviews cellForRowAtIndexPath:indexpath];
    cell.textFields.text = textField.text;
    NSLog(@"%ld----%@", (long)indexpath.row,cell.textFields.text);
     */
    NSIndexPath *indexpath = [NSIndexPath indexPathForRow:textField.tag inSection:0];
    MyTableViewCell *cell = [self.tableviews cellForRowAtIndexPath:indexpath];
    cell.textFields.text = textField.text;
    NSLog(@"%ld----%@", (long)indexpath.row,cell.textFields.text);
}

/*
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    // alloc header view
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, 1)];
    header.tag = _TBL_TAG_SECTION(section);
    return header;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGRect r = CGRectMake(scrollView.contentOffset.x, scrollView.contentOffset.y,
                          CGRectGetWidth(scrollView.frame),
                          CGRectGetHeight(scrollView.frame));
    for (UIView *v in [self.tableviews subviews]) {
        if ( CGRectIntersectsRect(r, v.frame) ) {
            if ( _TBL_TAG_IS_SECTION(v.tag) ) {
                NSLog(@"visible section tag %ld", _TBL_TAG_CLEAR(v.tag));
            }
        }
    }
}
*/

// 点击button,获取数组中所有的控件上的值
- (void)click:(UIButton *)button {
    for (int i = 0 ; i < self.listArray.count; i ++) {
        MyTableViewCell *cell = self.listArray[i];
        NSLog(@"=====%@", cell.textFields.text);
    }
}


-(NSMutableArray *)listArray {
    if (_listArray == nil) {
        _listArray = [NSMutableArray array];
    }
    return _listArray;
}



@end
