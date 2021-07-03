//
//  AuthorizationButton.m
//  RSTask7
//
//  Created by Admin on 03.07.2021.
//

#import "AuthorizationButton.h"
@interface AuthorizationButton()
@property (nonatomic, strong) UIImageView* userImageView;
@property (nonatomic, strong) UILabel* label;
@property (nonatomic, strong) UIImage* selectedImage;
@property (nonatomic, strong) UIImage* deselectedImage;
@end
@implementation AuthorizationButton
- (void)awakeFromNib{
    [super awakeFromNib];

    
    
}
- (void) setupViews{
    self.selectedImage = [UIImage imageNamed:@"user-filled"];
    self.deselectedImage = [UIImage imageNamed:@"user"];
    self.userImageView = [[UIImageView alloc] initWithImage: self.deselectedImage];
    self.label = [UILabel new];
    
}
@end
