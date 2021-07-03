//
//  MainController.h
//  RSTask7
//
//  Created by Admin on 03.07.2021.
//

#import <UIKit/UIKit.h>
#import "MainPresenter.h"
NS_ASSUME_NONNULL_BEGIN

@interface MainController : UIViewController<MainView>
@property (nonatomic, strong) MainPresenter* presenter;
@end

NS_ASSUME_NONNULL_END
