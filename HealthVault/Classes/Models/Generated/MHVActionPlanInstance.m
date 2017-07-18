//
// MHVActionPlanInstance.m
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


#import "MHVActionPlanInstance.h"

@implementation MHVActionPlanInstance

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
            @"identifier": @"id",
            @"status": @"status",
            @"organizationId": @"organizationId",
            @"organizationName": @"organizationName",
            @"associatedTasks": @"associatedTasks",
            @"name": @"name",
            @"descriptionText": @"description",
            @"imageUrl": @"imageUrl",
            @"thumbnailImageUrl": @"thumbnailImageUrl",
            @"category": @"category",
            @"objectives": @"objectives"
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
            
              @"associatedTasks": [MHVActionPlanTaskInstance class],

              @"objectives": [MHVObjective class]
        }];
    });
    return types;
}
@end
@implementation MHVActionPlanInstanceStatusEnum

-(NSDictionary *)enumMap
{
    return @{
        @"Unknown": @"Unknown",
        @"Archived": @"Archived",
        @"Recommended": @"Recommended",
        @"InProgress": @"InProgress",
        @"Completed": @"Completed",
        @"Template": @"Template",
    };
}

+(MHVActionPlanInstanceStatusEnum *)MHVUnknown
{
    return [[MHVActionPlanInstanceStatusEnum alloc] initWithString:@"Unknown"];
}
+(MHVActionPlanInstanceStatusEnum *)MHVArchived
{
    return [[MHVActionPlanInstanceStatusEnum alloc] initWithString:@"Archived"];
}
+(MHVActionPlanInstanceStatusEnum *)MHVRecommended
{
    return [[MHVActionPlanInstanceStatusEnum alloc] initWithString:@"Recommended"];
}
+(MHVActionPlanInstanceStatusEnum *)MHVInProgress
{
    return [[MHVActionPlanInstanceStatusEnum alloc] initWithString:@"InProgress"];
}
+(MHVActionPlanInstanceStatusEnum *)MHVCompleted
{
    return [[MHVActionPlanInstanceStatusEnum alloc] initWithString:@"Completed"];
}
+(MHVActionPlanInstanceStatusEnum *)MHVTemplate
{
    return [[MHVActionPlanInstanceStatusEnum alloc] initWithString:@"Template"];
}
@end
@implementation MHVActionPlanInstanceCategoryEnum

-(NSDictionary *)enumMap
{
    return @{
        @"Unknown": @"Unknown",
        @"Health": @"Health",
        @"Sleep": @"Sleep",
        @"Activity": @"Activity",
        @"Stress": @"Stress",
    };
}

+(MHVActionPlanInstanceCategoryEnum *)MHVUnknown
{
    return [[MHVActionPlanInstanceCategoryEnum alloc] initWithString:@"Unknown"];
}
+(MHVActionPlanInstanceCategoryEnum *)MHVHealth
{
    return [[MHVActionPlanInstanceCategoryEnum alloc] initWithString:@"Health"];
}
+(MHVActionPlanInstanceCategoryEnum *)MHVSleep
{
    return [[MHVActionPlanInstanceCategoryEnum alloc] initWithString:@"Sleep"];
}
+(MHVActionPlanInstanceCategoryEnum *)MHVActivity
{
    return [[MHVActionPlanInstanceCategoryEnum alloc] initWithString:@"Activity"];
}
+(MHVActionPlanInstanceCategoryEnum *)MHVStress
{
    return [[MHVActionPlanInstanceCategoryEnum alloc] initWithString:@"Stress"];
}
@end
