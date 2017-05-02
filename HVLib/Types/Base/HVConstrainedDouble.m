//
//  HVConstrainedDouble.m
//  HVLib
//
//  Copyright (c) 2012 Microsoft Corporation. All rights reserved.
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

#import "HVCommon.h"
#import "HVConstrainedDouble.h"

@implementation HVConstrainedDouble

-(BOOL) inRange
{
    return [self validateValue:m_value];
}

-(double) min
{
    return DBL_MIN;
}

-(double) max
{
    return DBL_MAX;
}

-(HVClientResult *) validate
{
    if ([self validateValue:m_value])
    {
        return HVRESULT_SUCCESS;
    }
    else
    {
        return HVMAKE_ERROR(HVClientError_ValueOutOfRange);
    }
}

-(BOOL) validateValue:(double)value
{
    return(self.min <= value && value <= self.max);
}

@end
