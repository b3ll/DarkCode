//
//  DarkCode.m
//  DarkCode
//
//  Created by Adam Bell on 8/7/18.
//  Copyright © 2018 Adam Bell. All rights reserved.
//

#import "DarkCode.h"

#import <AppKit/AppKit.h>

#import "ZKSwizzle.h"

static inline NSAppearance *DarkAppearance() {
  return [NSAppearance appearanceNamed:NSAppearanceNameDarkAqua];
}

@implementation DarkCode

+ (void)load
{
  [self applyDarkAppearanceToApplication:[NSApplication sharedApplication]];
}

+ (void)applyDarkAppearanceToApplication:(NSApplication *)application
{
  NSAppearance *darkAppearance = DarkAppearance();
  [application setAppearance:darkAppearance];

  [application _invalidateEffectiveAppearance];
  objc_setAssociatedObject([NSApplication sharedApplication],
                           @selector(effectiveAppearance),
                           DarkAppearance(),
                           OBJC_ASSOCIATION_RETAIN_NONATOMIC);

  [application _invalidateWindowAppearances];
  [application _refreshSetAppearance];
}

@end

ZKSwizzleInterface(IDEApplicationDarkPls, IDEApplication, NSApplication);

@implementation IDEApplicationDarkPls

- (void)setAppearance:(NSAppearance *)appearance
{
  ZKOrig(void, DarkAppearance());
}

@end

ZKSwizzleInterface(IDEApplicationControllerDarkPls, IDEApplicationController, NSObject)

@implementation IDEApplicationControllerDarkPls

- (void)applicationDidFinishLaunching:(NSNotification *)notification
{
  ZKOrig(void, notification);

  [DarkCode applyDarkAppearanceToApplication:[NSApplication sharedApplication]];
}

@end
