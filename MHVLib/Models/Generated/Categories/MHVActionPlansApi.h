//
// MHVActionPlansApi.h
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
#import "MHVRemoteMonitoringClient.h"
#import "MHVActionPlanAdherenceSummary.h"
#import "MHVActionPlanInstanceV2.h"
#import "MHVActionPlanV2.h"
#import "MHVActionPlansResponseActionPlanInstanceV2_.h"
#import "MHVErrorResponse.h"


NS_ASSUME_NONNULL_BEGIN

@interface MHVRemoteMonitoringClient (MHVActionPlansApi)

/// Remove an action plan objective
/// 
///
/// @param actionPlanId The instance of the plan that the objective belongs to.
/// @param objectiveId The instance of the objective to delete.
/// 
///  code:204 message:"NoContent",
///  code:0 message:"Error"
///
/// @return 
- (void)actionPlanObjectivesDeleteWithActionPlanId:(NSString* )actionPlanId
    objectiveId:(NSString* )objectiveId
    completion:(void(^_Nonnull)(NSError* _Nullable error))completion;


/// Post an action plan instance
/// 
///
/// @param actionPlan The instance of the plan to create.
/// 
///  code:201 message:"Created",
///  code:0 message:"Error"
///
/// @return MHVActionPlanInstanceV2*
- (void)actionPlansCreateWithActionPlan:(MHVActionPlanV2* )actionPlan
    completion:(void(^_Nonnull)(MHVActionPlanInstanceV2* _Nullable output, NSError* _Nullable error))completion;


/// Delete an action plan instance
/// 
///
/// @param actionPlanId The instance of the plan to delete.
/// 
///  code:204 message:"NoContent",
///  code:0 message:"Error"
///
/// @return 
- (void)actionPlansDeleteWithActionPlanId:(NSString* )actionPlanId
    completion:(void(^_Nonnull)(NSError* _Nullable error))completion;


/// Get a collection of action plans
/// 
///
/// @param maxPageSize The maximum number of entries to return per page. Defaults to 1000. (optional)
/// 
///  code:200 message:"OK",
///  code:0 message:"Error"
///
/// @return MHVActionPlansResponseActionPlanInstanceV2_*
- (void)actionPlansGetWithMaxPageSize:(NSNumber* _Nullable)maxPageSize
    completion:(void(^_Nonnull)(MHVActionPlansResponseActionPlanInstanceV2_* _Nullable output, NSError* _Nullable error))completion;


/// Gets adherence information for an action plan.
/// 
///
/// @param startTime The start time.
/// @param endTime The end time.
/// @param actionPlanId The action plan identifier.
/// @param objectiveId The objective to filter the report to. (optional)
/// @param taskId The task to filter the report to. (optional)
/// 
///  code:200 message:"OK",
///  code:0 message:"Error"
///
/// @return MHVActionPlanAdherenceSummary*
- (void)actionPlansGetAdherenceWithStartTime:(NSDate* )startTime
    endTime:(NSDate* )endTime
    actionPlanId:(NSString* )actionPlanId
    objectiveId:(NSString* _Nullable)objectiveId
    taskId:(NSString* _Nullable)taskId
    completion:(void(^_Nonnull)(MHVActionPlanAdherenceSummary* _Nullable output, NSError* _Nullable error))completion;


/// Get an instance of a specific action plan
/// 
///
/// @param actionPlanId The action plan to update.
/// 
///  code:200 message:"OK",
///  code:0 message:"Error"
///
/// @return MHVActionPlanInstanceV2*
- (void)actionPlansGetByIdWithActionPlanId:(NSString* )actionPlanId
    completion:(void(^_Nonnull)(MHVActionPlanInstanceV2* _Nullable output, NSError* _Nullable error))completion;


/// Update/Replace a complete action plan instance with no merge.
/// 
///
/// @param actionPlan The instance of the plan to update. The entire plan will be replaced with this version.
/// 
///  code:200 message:"OK",
///  code:0 message:"Error"
///
/// @return MHVActionPlansResponseActionPlanInstanceV2_*
- (void)actionPlansReplaceWithActionPlan:(MHVActionPlanInstanceV2* )actionPlan
    completion:(void(^_Nonnull)(MHVActionPlansResponseActionPlanInstanceV2_* _Nullable output, NSError* _Nullable error))completion;


/// Update an action plan instance with merge
/// 
///
/// @param actionPlan The instance of the plan to update. Only the fields present in the passed in model will be updated. All other fields and colelctions              will be left, as is, unless invalid.
/// 
///  code:200 message:"OK",
///  code:0 message:"Error"
///
/// @return MHVActionPlansResponseActionPlanInstanceV2_*
- (void)actionPlansUpdateWithActionPlan:(MHVActionPlanInstanceV2* )actionPlan
    completion:(void(^_Nonnull)(MHVActionPlansResponseActionPlanInstanceV2_* _Nullable output, NSError* _Nullable error))completion;



@end

NS_ASSUME_NONNULL_END
