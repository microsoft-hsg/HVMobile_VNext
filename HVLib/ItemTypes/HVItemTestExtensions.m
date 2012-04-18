//
//  HVItemTestExtensions.m
//  HVTestLib
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
#import "HVRandom.h"
#import "HVItemTestExtensions.h"

NSDate* createRandomDate(void)
{
    return [[HVRandom newRandomDayOffsetFromTodayInRangeMin:0 max:-365] autorelease];
}

HVDateTime* createRandomHVDateTime(void)
{
    return [[[HVDateTime alloc] initWithDate:createRandomDate()] autorelease];
}

HVDate* createRandomHVDate(void)
{
    return [[[HVDate alloc] initWithDate:createRandomDate()] autorelease]; 
}

HVApproxDateTime* createRandomApproxHVDate(void)
{
    return [[[HVApproxDateTime alloc] initWithDateTime:createRandomHVDateTime()] autorelease];
}

NSString* pickRandomString(int count, ...)
{
    va_list args;
    va_start(args, count);
    NSString* retVal = nil;
    
    int randomIndex = [HVRandom randomIntInRangeMin:0 max:count - 1];
    if (randomIndex >= 0 && randomIndex < count)
    {
        for (int i = 0; i < count; ++i)
        {
            NSString *string = va_arg(args, NSString *);
            if (i == randomIndex)
            {
                retVal = string;
              }
         }
    }
        
    va_end(args);
    return retVal;
}

@implementation HVItem (HVTestExtensions)

+(HVItem *)createRandomOfClass:(NSString *)className
{
    Class cls = NSClassFromString(className);
    if (cls == nil)
    {
        return nil;
    }
    
    @try {
        return [cls createRandom];
    }
    @catch (NSException *exception) 
    {
    }
    
    return nil;
}

@end

@implementation HVWeight (HVTestExtensions)

+(HVItem *)createRandom
{
    HVItem *item = [[HVWeight newItem] autorelease];
    
    item.weight.inPounds = [HVRandom randomDoubleInRangeMin:120 max:145];
    item.weight.when = createRandomHVDateTime();
    
    return item;    
}

@end

@implementation HVBloodPressure (HVTestExtensions)
    
+(HVItem *)createRandom
{
    HVItem *item = [[HVBloodPressure newItem] autorelease];
    HVBloodPressure *bp = item.bloodPressure;

    bp.when = createRandomHVDateTime();

    int s = [HVRandom randomIntInRangeMin:120 max:150];
    int d = s - [HVRandom randomIntInRangeMin:25 max:40];
    
    bp.systolicValue = s;
    bp.diastolicValue = d;
        
    return item;
}

@end

@implementation HVBloodGlucose (HVTestExtensions)

+(HVItem *)createRandom
{
    HVItem* item = [[HVBloodGlucose newItem] autorelease];
    
    HVBloodGlucose* glucose = item.bloodGlucose;
    glucose.when = createRandomHVDateTime();
    
    glucose.inMgPerDL = [HVRandom randomDoubleInRangeMin:70 max:120];
    glucose.measurementType = [HVBloodGlucose createWholeBloodMeasurementType];
    
    glucose.isOutsideOperatingTemp = FALSE;
    
    return item;
}

@end

@implementation HVCholesterol (HVTestExtensions)

+(HVItem *)createRandom
{
    HVItem* item = [[HVCholesterol newItem] autorelease];
    HVCholesterol* cholesterol = item.cholesterol;
    
    cholesterol.when = createRandomHVDate();
    cholesterol.ldlValue = [HVRandom randomIntInRangeMin:80 max:130];
    cholesterol.hdlValue = [HVRandom randomIntInRangeMin:30 max:60];
    cholesterol.totalValue = cholesterol.ldlValue + cholesterol.hdlValue + [HVRandom randomIntInRangeMin:20 max:50];
    cholesterol.triglyceridesValue = [HVRandom randomIntInRangeMin:150 max:250];
    
    return item;
}

@end

@implementation HVHeight (HVTestExtensions)

+(HVItem *)createRandom
{
    HVItem* item = [[HVHeight newItem] autorelease];
    HVHeight* height = item.height;
    
    height.when = createRandomHVDateTime();
    height.inInches = [HVRandom randomIntInRangeMin:12 max:84];
    
    return item;
}

@end

@implementation HVDietaryIntake (HVTestExtensions)

+(HVItem *)createRandom
{
    HVItem* item = [[HVDietaryIntake newItem] autorelease];
    HVDietaryIntake* diet = item.dietaryIntake;
    
    diet.when = createRandomHVDate();
    diet.caloriesValue = [HVRandom randomIntInRangeMin:1800 max:3000];
    diet.totalFatGrams = [HVRandom randomDoubleInRangeMin:0 max:100];
    diet.saturatedFatGrams = [HVRandom randomDoubleInRangeMin:0 max:diet.totalFatGrams];
    diet.proteinGrams = [HVRandom randomDoubleInRangeMin:1 max:100];
    diet.sugarGrams = [HVRandom randomDoubleInRangeMin:10 max:400];
    diet.dietaryFiberGrams = [HVRandom randomDoubleInRangeMin:1 max:100];
    diet.totalCarbGrams = diet.dietaryFiberGrams + diet.sugarGrams + [HVRandom randomDoubleInRangeMin:10 max:400];
    diet.cholesterolMilligrams = [HVRandom randomDoubleInRangeMin:0 max:100];
    
    return item;
}

@end

@implementation HVExercise (HVTestExtensions)

+(HVItem *)createRandom
{
    HVItem* item = [[HVExercise newItem] autorelease];
    
    HVExercise* exercise = item.exercise;
    
    exercise.when = createRandomApproxHVDate();
    
    NSString* activity = pickRandomString(3, @"Aerobics", @"Walking", @"Running");
    [exercise setStandardActivity:activity];
    
    exercise.durationMinutesValue = [HVRandom randomDoubleInRangeMin:15 max:45];
    
    NSString* detailCode;
    HVMeasurement* measurement;
    if (activity == @"Walking") 
    {
        detailCode = @"Steps_count"; // see exercise-detail-names vocabulary
        measurement = [HVMeasurement fromValue:exercise.durationMinutesValue * 100 andUnitsString:@"steps"];
    }
    else 
    {
        detailCode = @"CaloriesBurned_calories";
        measurement = [HVMeasurement fromValue:exercise.durationMinutesValue * 5 andUnitsString:@"calories"];
    }
    
    [exercise addOrUpdateDetailWithName:detailCode andValue:measurement];
    [exercise addOrUpdateDetailWithName:detailCode andValue:measurement];  
    
    return item;
}

@end

@implementation HVTestSynchronizedStore : HVSynchronizedStore

@synthesize failureProbability;

-(HVItem *)getLocalItemWithKey:(HVItemKey *)key
{
    if ([HVRandom randomDouble] < self.failureProbability)
    {
        return nil;
    }
    
    return [super getLocalItemWithKey:key];
}


@end