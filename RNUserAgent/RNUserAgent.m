#import "RNUserAgent.h"

#define kUserAgentKey @"UserAgent"

@implementation RNUserAgent

RCT_EXPORT_METHOD(set:(NSString *)userAgent)
{
    [[NSUserDefaults standardUserDefaults] registerDefaults:@{ kUserAgentKey : userAgent }];
}

- (void)replaceRegisteredDefaults:(NSDictionary *)dictionary {
    [[NSUserDefaults standardUserDefaults] setVolatileDomain:dictionary forName:NSRegistrationDomain];
}

RCT_EXPORT_METHOD(unset) {
    NSDictionary *registeredDefaults = [[NSUserDefaults standardUserDefaults] volatileDomainForName:NSRegistrationDomain];
    if ([registeredDefaults objectForKey:kUserAgentKey] != nil) {
        NSMutableDictionary *mutableCopy = [NSMutableDictionary dictionaryWithDictionary:registeredDefaults];
        [mutableCopy removeObjectForKey:kUserAgentKey];
        [self replaceRegisteredDefaults:[mutableCopy copy]];
    }
}

RCT_EXPORT_MODULE();

@end
