//
//  BridgeHeaders.h
//  AppearancesSwitcher
//
//  Created by gm on 2019/7/16.
//  Copyright © 2019 GMWorkStudio. All rights reserved.
//

#ifndef BridgeHeaders_h
#define BridgeHeaders_h

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, AppearanceType) {
    AppearanceTypeLight = 0,
    AppearanceTypeDark = 1,
//    AppearanceTypeAuto = 3,
};

/**
 Change theme
 Private Interface
 Will post "ApplePrivateInterfaceThemeChangedNotification"
 @param AppearanceType
 */
void SLSSetAppearanceThemeLegacy(AppearanceType);

AppearanceType SLSGetAppearanceThemeLegacy();

#endif /* BridgeHeaders_h */
