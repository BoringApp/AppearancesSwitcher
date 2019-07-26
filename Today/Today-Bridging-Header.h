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
};

//typedef NS_ENUM(NSInteger, AccentColorType) {
//    AccentColorTypeGraphite = -1,
//    AccentColorTypeRed = 0,
//    AccentColorTypeOrange = 1,
//    AccentColorTypeYellow = 2,
//    AccentColorTypeGreen = 3,
//    AccentColorTypeBlue = 4,
//    AccentColorTypePurple = 5,
//    AccentColorTypePink = 6,
//};

/**
 Change theme
 Private Interface
 Will post "ApplePrivateInterfaceThemeChangedNotification"
 @param AppearanceType
 */
void SLSSetAppearanceThemeLegacy(AppearanceType);


/// Obtain current system appearance.
AppearanceType SLSGetAppearanceThemeLegacy();

/*
 Need outside sandbox access entitlement: 'user-preference-write' or 'file-write-data'.
 Write 'AppleInterfaceStyleSwitchesAutomatically' in CFPrefsPlistSource.
 (Domain: kCFPreferencesAnyApplication, User: kCFPreferencesCurrentUser, ByHost: No, Container: (null), Contents Need Refresh: No)
 */
NSInteger SLSSetAppearanceThemeSwitchesAutomatically(NSInteger a1);

/// Obtain current system accent color.
//AccentColorType NSColorGetUserAccentColor();

#endif /* BridgeHeaders_h */


