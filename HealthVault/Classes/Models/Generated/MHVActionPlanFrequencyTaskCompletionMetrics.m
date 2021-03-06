//
// MHVActionPlanFrequencyTaskCompletionMetrics.m
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


#import "MHVActionPlanFrequencyTaskCompletionMetrics.h"

@implementation MHVActionPlanFrequencyTaskCompletionMetrics

+ (BOOL)shouldValidateProperties
{
    return YES;
}

- (instancetype)init {
  self = [super init];
  if (self) {
    // initialize property's default value, if any
    
  }
  return self;
}



+ (NSDictionary *)propertyNameMap
{
    static dispatch_once_t once;
    static NSMutableDictionary *names = nil;
    dispatch_once(&once, ^{
        names = [[super propertyNameMap] mutableCopy];
        [names addEntriesFromDictionary:@{
            @"windowType": @"windowType",
            @"occurrenceCount": @"occurrenceCount"
        }];
    });
    return names;
}

+ (NSDictionary *)objectParametersMap
{
    static dispatch_once_t once;
    static NSMutableDictionary *types = nil;
    dispatch_once(&once, ^{
        types = [[super objectParametersMap] mutableCopy];
        [types addEntriesFromDictionary:@{
            @"windowType": [MHVActionPlanFrequencyTaskCompletionMetricsWindowTypeEnum class],

        }];
    });
    return types;
}
@end
@implementation MHVActionPlanFrequencyTaskCompletionMetricsWindowTypeEnum

-(NSDictionary *)enumMap
{
    return @{
        @"Unknown": @"Unknown",
        @"None": @"None",
        @"Daily": @"Daily",
        @"Weekly": @"Weekly",
    };
}

+(MHVActionPlanFrequencyTaskCompletionMetricsWindowTypeEnum *)MHVUnknown
{
    return [[MHVActionPlanFrequencyTaskCompletionMetricsWindowTypeEnum alloc] initWithString:@"Unknown"];
}
+(MHVActionPlanFrequencyTaskCompletionMetricsWindowTypeEnum *)MHVNone
{
    return [[MHVActionPlanFrequencyTaskCompletionMetricsWindowTypeEnum alloc] initWithString:@"None"];
}
+(MHVActionPlanFrequencyTaskCompletionMetricsWindowTypeEnum *)MHVDaily
{
    return [[MHVActionPlanFrequencyTaskCompletionMetricsWindowTypeEnum alloc] initWithString:@"Daily"];
}
+(MHVActionPlanFrequencyTaskCompletionMetricsWindowTypeEnum *)MHVWeekly
{
    return [[MHVActionPlanFrequencyTaskCompletionMetricsWindowTypeEnum alloc] initWithString:@"Weekly"];
}
@end
