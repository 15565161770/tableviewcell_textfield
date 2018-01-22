//
//  AppDelegate.m
//  Mac_tableviewcell
//
//  Created by 仝兴伟 on 2018/1/21.
//  Copyright © 2018年 仝兴伟. All rights reserved.
//

#import "AppDelegate.h"
#import "MyTableViewCell.h"
@interface AppDelegate ()<NSTableViewDelegate, NSTableViewDataSource, NSTextFieldDelegate>

@property (weak) IBOutlet NSWindow *window;
@property (nonatomic, strong) NSTableView *tableview;
@property (nonatomic, strong) NSScrollView *tableviewScrollView;
@property (nonatomic, strong) NSMutableArray *listArray;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    [self addTableview];
    
    NSButton *button = [[NSButton alloc]initWithFrame:CGRectMake(600, 300, 100, 100)];
    [button setWantsLayer:YES];
    button.layer.backgroundColor = [NSColor purpleColor].CGColor;
    button.target = self;
    [button setAction:@selector(buttonClick:)];
    [self.window.contentView addSubview:button];
}

- (void)addTableview {
    self.tableviewScrollView = [[NSScrollView alloc]initWithFrame:CGRectMake(0, 0, 546, 480)];
    self.tableview = [[NSTableView alloc]initWithFrame:CGRectMake(0, 0, 546, 480)];
    [self.tableview setAutoresizesSubviews:YES];
    self.tableview.headerView = nil;
    self.tableview.rowHeight = 58;
    self.tableview.rowSizeStyle = NSTableViewRowSizeStyleDefault;
    
    NSTableColumn *cloumu = [[NSTableColumn alloc]initWithIdentifier:@"file"];
    cloumu.title = @"";
    cloumu.width = 546;
    [self.tableview addTableColumn:cloumu];
    
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    
    self.tableview.gridStyleMask = NSTableViewGridNone;
    [self.tableviewScrollView setDocumentView:self.tableview];
    [self.window.contentView addSubview:self.tableviewScrollView];
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return  10;
}

- (CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row {
    return 58;
}

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    return nil;
}

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    MyTableViewCell *cellView = [tableView makeViewWithIdentifier:@"Tableviewcell" owner:self];
    if (cellView == nil) {
        cellView = [[MyTableViewCell alloc]init];
        [cellView setIdentifier:@"Tableviewcell"];
        [self.listArray addObject:cellView];
    }
    cellView.myTextField.tag = row;
    cellView.myTextField.delegate = self;
    NSNotification *not = [[NSNotification alloc]initWithName:NSControlTextDidChangeNotification object:self userInfo:nil];
//    [cellView.myTextField setTarget:self];
    [cellView.myTextField setAction:@selector(textFieldWithString:)];
    return cellView;
}


-(void)controlTextDidChange:(NSNotification *)obj {
    NSTextField *textField = [obj object];
    MyTableViewCell *cell = [self.tableview viewAtColumn:0 row:textField.tag makeIfNecessary:YES];
    cell.myTextField.stringValue = cell.myTextField.stringValue;
}


// 点击button获取cell上面
- (void)buttonClick:(NSButton *)button {
    for (MyTableViewCell *cell in self.listArray) {
        NSLog(@"%@", cell.myTextField.stringValue);
    }
}



- (NSMutableArray *)listArray {
    if (_listArray == nil) {
        _listArray = [NSMutableArray array];
    }
    return _listArray;
}

@end
