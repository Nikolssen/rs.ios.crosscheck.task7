//
//  NumberPanel.m
//  RSTask7
//
//  Created by Admin on 03.07.2021.
//

#import "NumberPanel.h"
#import "NumberButton.h"
@interface NumberPanel()
@property (nonatomic, strong) NSArray<NumberButton*>* buttons;
@end

@implementation NumberPanel

- (void)awakeFromNib{
    [super awakeFromNib];
    self.layer.cornerRadius = 10.0;
    self.layer.borderWidth = 2.0;
    
    self.buttons = @[]
}

@end
