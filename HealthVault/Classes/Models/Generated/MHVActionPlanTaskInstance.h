//
// MHVActionPlanTaskInstance.h
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

#import "MHVActionPlanFrequencyTaskCompletionMetrics.h"
#import "MHVActionPlanTrackingPolicy.h"
#import "MHVSchedule.h"
#import "MHVModelBase.h"
#import "MHVEnum.h"


@protocol MHVActionPlanTaskInstance
@end

NS_ASSUME_NONNULL_BEGIN

@interface MHVActionPlanTaskInstanceStatusEnum : MHVEnum
+(MHVActionPlanTaskInstanceStatusEnum *)MHVUnknown;
+(MHVActionPlanTaskInstanceStatusEnum *)MHVArchived;
+(MHVActionPlanTaskInstanceStatusEnum *)MHVInProgress;
+(MHVActionPlanTaskInstanceStatusEnum *)MHVRecommended;
+(MHVActionPlanTaskInstanceStatusEnum *)MHVCompleted;
+(MHVActionPlanTaskInstanceStatusEnum *)MHVTemplate;
@end
@interface MHVActionPlanTaskInstanceTaskTypeEnum : MHVEnum
+(MHVActionPlanTaskInstanceTaskTypeEnum *)MHVUnknown;
+(MHVActionPlanTaskInstanceTaskTypeEnum *)MHVBloodPressure;
+(MHVActionPlanTaskInstanceTaskTypeEnum *)MHVOther;
@end
@interface MHVActionPlanTaskInstanceCompletionTypeEnum : MHVEnum
+(MHVActionPlanTaskInstanceCompletionTypeEnum *)MHVUnknown;
+(MHVActionPlanTaskInstanceCompletionTypeEnum *)MHVFrequency;
+(MHVActionPlanTaskInstanceCompletionTypeEnum *)MHVScheduled;
@end

@interface MHVActionPlanTaskInstance : MHVModelBase

/* The Id of the task instance [optional]
 */
@property(strong,nonatomic,nullable) NSString* identifier;
/* The status of the task [optional]
 */
@property(strong,nonatomic,nullable) MHVActionPlanTaskInstanceStatusEnum* status;
/* The date that the task was started. Read-only [optional]
 */
@property(strong,nonatomic,nullable) NSDate* startDate;
/* The date that the task was ended. Read-only [optional]
 */
@property(strong,nonatomic,nullable) NSDate* endDate;
/* The ID of the organization that owns this task. Read-only [optional]
 */
@property(strong,nonatomic,nullable) NSString* organizationId;
/* The name of the organization that owns this task. Read-only [optional]
 */
@property(strong,nonatomic,nullable) NSString* organizationName;
/* The friendly name of the task [optional]
 */
@property(strong,nonatomic,nullable) NSString* name;
/* The short description of the task 
 */
@property(strong,nonatomic) NSString* shortDescription;
/* The detailed description of the task 
 */
@property(strong,nonatomic) NSString* longDescription;
/* The image URL of the task. Suggested resolution is 200 x 200 
 */
@property(strong,nonatomic) NSString* imageUrl;
/* The thumbnail image URL of the task. Suggested resolution is 90 x 90 
 */
@property(strong,nonatomic) NSString* thumbnailImageUrl;
/* The type of the task, used to choose the UI editor for the task 
 */
@property(strong,nonatomic) MHVActionPlanTaskInstanceTaskTypeEnum* taskType;
/* The tracking policy 
 */
@property(strong,nonatomic) MHVActionPlanTrackingPolicy* trackingPolicy;
/* The text shown during task signup. 
 */
@property(strong,nonatomic) NSString* signupName;
/* The ID of the associated plan. This is not needed when adding a task as part of a new plan [optional]
 */
@property(strong,nonatomic,nullable) NSString* associatedPlanId;
/* The list of objective IDs the task is associated with 
 */
@property(strong,nonatomic) NSArray<NSString*>* associatedObjectiveIds;
/* The Completion Type of the Task 
 */
@property(strong,nonatomic) MHVActionPlanTaskInstanceCompletionTypeEnum* completionType;
/* Completion metrics for frequency based tasks [optional]
 */
@property(strong,nonatomic,nullable) MHVActionPlanFrequencyTaskCompletionMetrics* frequencyTaskCompletionMetrics;
/* Schedules for when a task should be completed. [optional]
 */
@property(strong,nonatomic,nullable) NSArray<MHVSchedule>* schedules;

@end

NS_ASSUME_NONNULL_END