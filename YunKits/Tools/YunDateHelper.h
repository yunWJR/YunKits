//
//  Created by yun on 16/5/9.
//  Copyright © 2016年 成都晟堃科技有限责任公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YunDateHelper : NSObject

+ (instancetype)instance;

+ (NSDate *)dateByUnixInterval:(long long)unixInterval;

+ (long long)unixIntervalByDate:(NSDate *)date;

+ (long long)unixIntervalNow;

+ (NSString *)dateStrWith:(NSDate *)date andFormat:(NSString *)format;

+ (NSString *)dateStrYMDWith:(NSDate *)date;

+ (NSDate *)dateWithDateStr:(NSString *)dateStr andFormat:(NSString *)format;

+ (BOOL)isSameDateByYMD:(NSDate *)date1 date2:(NSDate *)date2;

+ (BOOL)isToday:(NSDate *)date;

+ (BOOL)isSameDate:(NSDate *)date1 date2:(NSDate *)date2 byForm:(NSString *)form;

+ (NSString *)dateStrYMDWithUnix:(long long)time;

+ (NSString *)dateStrYMDHMWithUnix:(long long)time;

+ (NSString *)dateStrWithUnix:(long long)time format:(NSString *)format;

+ (NSString *)dateStrWithDate:(NSDate *)date format:(NSString *)format;

+ (NSString *)dateStrWithDate:(NSDate *)date format:(NSString *)format nullText:(NSString *)text;

+ (NSDate *)getMonthBeginDay:(NSDate *)date;

+ (NSDate *)getMonthEndDay:(NSDate *)date;

- (NSDate *)getDateByYMD:(NSString *)uiDate;

- (long long)getUnixDateByYMD:(NSString *)uiDate;

- (NSString *)getDateStrByYMD:(NSDate *)date;

- (NSString *)featureWeekdayWithDate:(NSString *)featureDate;

- (NSInteger)weekdayWithDate:(NSString *)featureDate;

- (NSInteger)daysFromDate:(NSDate *)startDate toDate:(NSDate *)endDate;

- (NSDateComponents *)getDateComponents:(NSDate *)date;

- (NSInteger)weekNumForYM:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;

- (NSMutableDictionary *)weekIndexWithDate:(NSDate *)date;

- (NSDate *)preDate:(NSDate *)date withDays:(NSInteger)day;

- (NSDate *)nextDate:(NSDate *)date withDays:(NSInteger)day;

@end
