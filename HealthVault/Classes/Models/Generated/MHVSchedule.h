//
// MHVSchedule.h
// MHVLib
//
// Copyright (c) 2017 Microsoft Corporation. All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

/**
* NOTE: This class is auto generated by the swagger code generator program.
* https://github.com/swagger-api/swagger-codegen.git
* Do not edit the class manually.
*/


#import <Foundation/Foundation.h>

#import "MHVTime.h"
#import "MHVModelBase.h"
#import "MHVEnum.h"


@protocol MHVSchedule
@end

NS_ASSUME_NONNULL_BEGIN

@interface MHVScheduleReminderStateEnum : MHVEnum
+(MHVScheduleReminderStateEnum *)MHVUnknown;
+(MHVScheduleReminderStateEnum *)MHVOff;
+(MHVScheduleReminderStateEnum *)MHVOnTime;
+(MHVScheduleReminderStateEnum *)MHVBefore5Minutes;
+(MHVScheduleReminderStateEnum *)MHVBefore10Minutes;
+(MHVScheduleReminderStateEnum *)MHVBefore15Minutes;
+(MHVScheduleReminderStateEnum *)MHVBefore30Minutes;
+(MHVScheduleReminderStateEnum *)MHVBefore1Hour;
+(MHVScheduleReminderStateEnum *)MHVBefore2Hours;
+(MHVScheduleReminderStateEnum *)MHVBefore4Hours;
+(MHVScheduleReminderStateEnum *)MHVBefore8Hours;
@end
@interface MHVScheduleScheduledDaysEnum : MHVEnum
+(MHVScheduleScheduledDaysEnum *)MHVUnknown;
+(MHVScheduleScheduledDaysEnum *)MHVEveryday;
+(MHVScheduleScheduledDaysEnum *)MHVSunday;
+(MHVScheduleScheduledDaysEnum *)MHVMonday;
+(MHVScheduleScheduledDaysEnum *)MHVTuesday;
+(MHVScheduleScheduledDaysEnum *)MHVWednesday;
+(MHVScheduleScheduledDaysEnum *)MHVThursday;
+(MHVScheduleScheduledDaysEnum *)MHVFriday;
+(MHVScheduleScheduledDaysEnum *)MHVSaturday;
@end

@interface MHVSchedule : MHVModelBase

/* The reminder state of the task 
 */
@property(strong,nonatomic) MHVScheduleReminderStateEnum* reminderState;
/* The days that this will show for the user  Expected values: { 'Unknown', 'Everyday', 'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday' } [optional]
 */
@property(strong,nonatomic,nullable) NSArray<MHVScheduleScheduledDaysEnum *>* scheduledDays;
/* The time at which this task is scheduled [optional]
 */
@property(strong,nonatomic,nullable) MHVTime* scheduledTime;

@end

NS_ASSUME_NONNULL_END