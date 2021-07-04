//
//  NumberPanelDelegate.h
//  RSTask7
//
//  Created by Admin on 03.07.2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol NumberPanelDelegate <NSObject>
- (void) proceedSequence: (NSString*) sequence;
@end

NS_ASSUME_NONNULL_END
