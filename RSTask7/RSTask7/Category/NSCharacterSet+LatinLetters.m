//
//  NSCharacterSet+LatinLetters.m
//  RSTask7
//
//  Created by Admin on 05.07.2021.
//

#import "NSCharacterSet+LatinLetters.h"

@implementation NSCharacterSet (LatinLetters)
+(instancetype)latinLettersCharacterSet{
    return [NSCharacterSet characterSetWithCharactersInString:@           "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"];
}
@end
