//
//  MainPresenter.h
//  RSTask7
//
//  Created by Admin on 02.07.2021.
//

#import <Foundation/Foundation.h>
#import "MainView.h"
NS_ASSUME_NONNULL_BEGIN

@interface MainPresenter : NSObject
-(void)checkLogin:(NSString*) login AndPassword:(NSString*) password;
-(void)checkCode:(NSString*) code;
-(instancetype) initWithView:(id<MainView>)view;
@property (nonatomic, weak) id<MainView> view;
@end

NS_ASSUME_NONNULL_END
