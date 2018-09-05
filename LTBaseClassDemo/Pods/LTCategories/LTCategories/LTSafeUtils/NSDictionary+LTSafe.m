//
//  NSDictionary+LTSafe.m
//  RedMaple
//
//  Created by 洪峰 on 2018/9/4.
//  Copyright © 2018年 洪峰. All rights reserved.
//

#import "NSDictionary+LTSafe.h"
#import "NSString+LTSafe.h"

@implementation NSDictionary (LTSafe)


- (id)lt_safeObjectForKey:(id)key
{
    if (key == nil) {
        return nil;
    }
    id value = [self objectForKey:key];
    if (value == [NSNull null]) {
        return nil;
    }
    return value;
}

- (id)lt_safeObjectForKey:(id)key class:(Class)aClass
{
    id value = [self lt_safeObjectForKey:key];
    if ([value isKindOfClass:aClass]) {
        return value;
    }
    return nil;
}

- (bool)lt_boolForKey:(id)key
{
    id value = [self lt_safeObjectForKey:key];
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]]) {
        return [value boolValue];
    }
    return NO;
}

- (CGFloat)lt_floatForKey:(id)key
{
    id value = [self lt_safeObjectForKey:key];
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]]) {
        return [value floatValue];
    }
    return 0;
}

- (NSInteger)lt_integerForKey:(id)key
{
    id value = [self lt_safeObjectForKey:key];
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]]) {
        return [value integerValue];
    }
    return 0;
}

- (int)lt_intForKey:(id)key
{
    id value = [self lt_safeObjectForKey:key];
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]]) {
        return [value intValue];
    }
    return 0;
}

- (long)lt_longForKey:(id)key
{
    id value = [self lt_safeObjectForKey:key];
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]]) {
        return [value longValue];
    }
    return 0;
}

- (NSNumber *)lt_numberForKey:(id)key
{
    id value = [self lt_safeObjectForKey:key];
    if ([value isKindOfClass:[NSNumber class]]) {
        return value;
    }
    if ([value respondsToSelector:@selector(numberValue)]) {
        return [value numberValue];
    }
    return nil;
}

- (NSString *)lt_stringForKey:(id)key
{
    id value = [self lt_safeObjectForKey:key];
    if ([value isKindOfClass:[NSString class]]) {
        return value;
    }
    if ([value respondsToSelector:@selector(stringValue)]) {
        return [value stringValue];
    }
    return nil;
}

- (NSArray *)lt_arrayForKey:(id)key
{
    return [self lt_safeObjectForKey:key class:[NSArray class]];
}

- (NSDictionary *)lt_dictionaryForKey:(id)key
{
    return [self lt_safeObjectForKey:key class:[NSDictionary class]];
}

- (NSMutableArray *)lt_mutableArrayForKey:(id)key
{
    return [self lt_safeObjectForKey:key class:[NSMutableArray class]];
}

- (NSMutableDictionary *)lt_mutableDictionaryForKey:(id)key
{
    return [self lt_safeObjectForKey:key class:[NSMutableDictionary class]];
}

@end

@implementation NSMutableDictionary (LTSafe)

- (void)lt_safeSetObject:(id)anObject forKey:(id)key
{
    if (key && anObject) {
        [self setObject:anObject forKey:key];
    }
}

-(void)lt_safeRemoveObjectForKey:(id)key
{
    if (key) {
        [self removeObjectForKey:key];
    }
}

@end
