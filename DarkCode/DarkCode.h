//
//  DarkCode.h
//  DarkCode
//
//  Created by Adam Bell on 8/7/18.
//  Copyright © 2018 Adam Bell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSApplication (DarkCode)

- (NSAppearance *)effectiveAppearance;

- (void)setAppearance:(NSAppearance *)appearance;

- (void)_invalidateWindowAppearances;
- (void)_invalidateEffectiveAppearance;
- (void)_refreshSetAppearance;

@end

@interface DarkCode : NSObject

@end

NS_ASSUME_NONNULL_END
