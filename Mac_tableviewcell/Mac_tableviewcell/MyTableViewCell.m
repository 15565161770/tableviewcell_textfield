//
//  MyTableViewCell.m
//  Mac_tableviewcell
//
//  Created by 仝兴伟 on 2018/1/21.
//  Copyright © 2018年 仝兴伟. All rights reserved.
//

#import "MyTableViewCell.h"
@interface MyTableViewCell ()
@property (nonatomic, strong) NSImageView *cellImageView;
@property (nonatomic, strong) NSTextField *fileNameLable;
@property (nonatomic, strong) NSTextField *timeLabel;

@end
@implementation MyTableViewCell

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

- (instancetype)initWithFrame:(NSRect)frameRect {
    if ([super initWithFrame:frameRect]) {
        [self addTabel];
    }
    return self;
}

- (void)addTabel {
    self.cellImageView = [[NSImageView alloc]initWithFrame:CGRectMake(30, 10, 35, 35)];
    self.cellImageView.image = [NSImage imageNamed:@"word"];
    [self addSubview:self.cellImageView];
    
    self.fileNameLable = [[NSTextField alloc]initWithFrame:CGRectMake(100, 35, 300, 20)];
    self.fileNameLable.stringValue = @"dfaggdfgf.doc";
    self.fileNameLable.backgroundColor = [NSColor clearColor];
    self.fileNameLable.bordered = NO;
    self.fileNameLable.selectable = NO;
    [self.fileNameLable setLineBreakMode:(NSLineBreakByTruncatingMiddle)];
    self.fileNameLable.font = [NSFont systemFontOfSize:13.0];
    [self addSubview:self.fileNameLable];
    
    self.timeLabel = [[NSTextField alloc]initWithFrame:CGRectMake(100, 4, 300, 20)];
    self.timeLabel.stringValue = @"2017-11--28 13:34";
    self.timeLabel.backgroundColor = [NSColor clearColor];
    self.timeLabel.bordered = NO;
    self.timeLabel.selectable = NO;
    [self.timeLabel setLineBreakMode:(NSLineBreakByTruncatingMiddle)];
    self.timeLabel.font = [NSFont systemFontOfSize:12.0];
    [self.timeLabel setTextColor:[NSColor colorWithRed:142 / 255.0 green:142 / 255.0 blue:147 / 255.0 alpha:1.0]];
    [self addSubview:self.timeLabel];
    
    self.myTextField = [[NSTextField alloc]initWithFrame:CGRectMake(250, 4, 200, 20)];
    [self.myTextField setWantsLayer:YES];
    self.myTextField.layer.backgroundColor = [NSColor redColor].CGColor;
    [self addSubview:self.myTextField];
    
    NSTextField *textfield = [[NSTextField alloc]initWithFrame:CGRectMake(16, 0, 703, 0.5)];
    textfield.backgroundColor = [NSColor lightGrayColor];
    [self addSubview:textfield];
}

@end
