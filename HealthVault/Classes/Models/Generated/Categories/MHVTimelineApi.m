//
// MHVTimelineApi.m
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
#import "MHVJsonSerializer.h"
#import "MHVTimelineApi.h"
#import "MHVActionPlanTasksResponseTimelineTask_.h"
#import "MHVErrorResponse.h"
#import "MHVLocalDate.h"


@implementation MHVRemoteMonitoringClient (MHVTimelineApi)

NSString* _Nonnull kMHVTimelineApiErrorDomain = @"MHVTimelineApiErrorDomain";
NSInteger kMHVTimelineApiMissingParamErrorCode = 234513;

#pragma mark - Api Methods

///
/// Get the task timeline for a given timerange
/// 
///  @param startDate The start time. 
///
///  @param endDate The end time. (optional)
///
///  @returns MHVActionPlanTasksResponseTimelineTask_*
///
- (void)timelineGetWithStartDate:(MHVLocalDate* _Nonnull)startDate
    endDate:(MHVLocalDate* _Nullable)endDate
    completion:(void(^_Nonnull)(MHVActionPlanTasksResponseTimelineTask_* _Nullable output, NSError* _Nullable error))completion
{
    // verify the required parameter 'startDate' is set
    if (startDate == nil)
    {
        NSParameterAssert(startDate);
        if(completion)
        {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"startDate"] };
            NSError* error = [NSError errorWithDomain:kMHVTimelineApiErrorDomain code:kMHVTimelineApiMissingParamErrorCode userInfo:userInfo];
            completion(nil, error);
        }
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/Timeline"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (startDate != nil)
    {
        queryParams[@"startDate"] = startDate;
    }
    if (endDate != nil)
    {
        queryParams[@"endDate"] = endDate;
    }

    NSData *bodyParam = nil;

    [self requestWithPath:resourcePath
                      httpMethod:@"GET"
                      pathParams:pathParams
                     queryParams:queryParams
                            body:bodyParam
                     resultClass:[MHVActionPlanTasksResponseTimelineTask_ class]
                      completion:completion];
}



@end
