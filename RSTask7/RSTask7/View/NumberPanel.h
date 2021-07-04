//
//  NumberPanel.h
//  RSTask7
//
//  Created by Admin on 03.07.2021.
//

#import <UIKit/UIKit.h>
#import "NumberPanelDelegate.h"
NS_ASSUME_NONNULL_BEGIN

@interface NumberPanel : UIView
typedef  NS_ENUM(NSUInteger, NumberPanelState) {
    NumberPanelStateCorrect,
    NumberPanelStateError,
    NumberPanelStateInactive,
    NumberPanelStateHidden
};
@property (nonatomic, weak) id<NumberPanelDelegate> delegate;
@property (nonatomic, assign) NumberPanelState state;
@end

NS_ASSUME_NONNULL_END


