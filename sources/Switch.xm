#import "FSSwitchDataSource.h"
#import "FSSwitchPanel.h"
#include "UFSSharedCode.h"

static const char *defaults = "com.apple.backboardd";
static const char *key = "BKEnableALS";

@interface AutoBrightnessFlipswitchSwitch : NSObject <FSSwitchDataSource>
@end

@implementation AutoBrightnessFlipswitchSwitch

- (NSString *)titleForSwitchIdentifier:(NSString *)switchIdentifier {
	return @"AutoBrightness";
}

- (FSSwitchState)stateForSwitchIdentifier:(NSString *)switchIdentifier {
	NSNumber *n = (NSNumber *)NSPGetKey(defaults, key);
	return ((n)? [n boolValue]:YES) ? FSSwitchStateOn : FSSwitchStateOff;
}

- (void)applyState:(FSSwitchState)newState forSwitchIdentifier:(NSString *)switchIdentifier {
	switch (newState) {
	case FSSwitchStateIndeterminate:
		break;
	case FSSwitchStateOn:
		NSPSetKey(defaults, key, [NSNumber numberWithBool:YES]);
		CFNCPostNotification(defaults);
		break;
	case FSSwitchStateOff:
		NSPSetKey(defaults, key, [NSNumber numberWithBool:YES]);
		CFNCPostNotification(defaults);
		break;
	}
	return;
}

@end