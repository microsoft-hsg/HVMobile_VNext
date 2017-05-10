//
// MHVSleepJournalPM.m
// MHVLib
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

#import "MHVCommon.h"
#import "MHVSleepJournalPM.h"

static NSString *const c_typeid = @"031f5706-7f1a-11db-ad56-7bd355d89593";
static NSString *const c_typename = @"sleep-pm";

static NSString *const c_element_when = @"when";
static NSString *const c_element_caffeine = @"caffeine";
static NSString *const c_element_alcohol = @"alcohol";
static NSString *const c_element_nap = @"nap";
static NSString *const c_element_exercise = @"exercise";
static NSString *const c_element_sleepiness = @"sleepiness";

NSString *stringFromSleepiness(MHVSleepiness sleepiness)
{
    switch (sleepiness)
    {
        case MHVSleepiness_VerySleepy:
            return @"Very Sleepy";

        case MHVSleepiness_Tired:
            return @"Tired";

        case MHVSleepiness_Alert:
            return @"Alert";

        case MHVSleepiness_WideAwake:
            return @"Wide Awake";

        default:
            break;
    }

    return c_emptyString;
}

@interface MHVSleepJournalPM ()

@property (nonatomic, strong) MHVPositiveInt *sleepinessValue;

@end

@implementation MHVSleepJournalPM

- (MHVTimeCollection *)caffeineIntakeTimes
{
    MHVENSURE(_caffeineIntakeTimes, MHVTimeCollection);
    return _caffeineIntakeTimes;
}

- (BOOL)hasCaffeineIntakeTimes
{
    return ![MHVCollection isNilOrEmpty:self.caffeineIntakeTimes];
}

- (MHVTimeCollection *)alcoholIntakeTimes
{
    MHVENSURE(_alcoholIntakeTimes, MHVTimeCollection);
    return _alcoholIntakeTimes;
}

- (BOOL)hasAlcoholIntakeTimes
{
    return ![MHVCollection isNilOrEmpty:self.alcoholIntakeTimes];
}

- (MHVOccurenceCollection *)naps
{
    MHVENSURE(_naps, MHVOccurenceCollection);
    return _naps;
}

- (BOOL)hasNaps
{
    return ![MHVCollection isNilOrEmpty:self.naps];
}

- (MHVOccurenceCollection *)exercise
{
    MHVENSURE(_exercise, MHVOccurenceCollection);
    return _exercise;
}

- (BOOL)hasExercise
{
    return ![MHVCollection isNilOrEmpty:self.exercise];
}

- (MHVSleepiness)sleepiness
{
    return (self.sleepinessValue) ? (MHVSleepiness)(self.sleepinessValue.value) : MHVSleepiness_Unknown;
}

- (void)setSleepiness:(MHVSleepiness)sleepiness
{
    if (sleepiness == MHVSleepiness_Unknown)
    {
        self.sleepinessValue = nil;
    }
    else
    {
        MHVENSURE(self.sleepinessValue, MHVPositiveInt);
        self.sleepinessValue.value = sleepiness;
    }
}

- (NSString *)sleepinessAsString
{
    return stringFromSleepiness(self.sleepiness);
}

- (NSDate *)getDate
{
    return [self.when toDate];
}

- (NSDate *)getDateForCalendar:(NSCalendar *)calendar
{
    return [self.when toDateForCalendar:calendar];
}

- (MHVClientResult *)validate
{
    MHVVALIDATE_BEGIN

    MHVVALIDATE(self.when, MHVClientError_InvalidSleepJournal);
    MHVVALIDATE(self.sleepinessValue, MHVClientError_InvalidSleepJournal);
    MHVVALIDATE_ARRAYOPTIONAL(self.caffeineIntakeTimes, MHVClientError_InvalidSleepJournal);
    MHVVALIDATE_ARRAYOPTIONAL(self.alcoholIntakeTimes, MHVClientError_InvalidSleepJournal);
    MHVVALIDATE_ARRAYOPTIONAL(self.naps, MHVClientError_InvalidSleepJournal);

    MHVVALIDATE_SUCCESS
}

- (void)serialize:(XWriter *)writer
{
    [writer writeElement:c_element_when content:self.when];
    [writer writeElementArray:c_element_caffeine elements:self.caffeineIntakeTimes.toArray];
    [writer writeElementArray:c_element_alcohol elements:self.alcoholIntakeTimes.toArray];
    [writer writeElementArray:c_element_nap elements:self.naps.toArray];
    [writer writeElementArray:c_element_exercise elements:self.exercise.toArray];
    [writer writeElement:c_element_sleepiness content:self.sleepinessValue];
}

- (void)deserialize:(XReader *)reader
{
    self.when = [reader readElement:c_element_when asClass:[MHVDateTime class]];
    self.caffeineIntakeTimes = (MHVTimeCollection *)[reader readElementArray:c_element_caffeine asClass:[MHVTime class] andArrayClass:[MHVTimeCollection class]];
    self.alcoholIntakeTimes = (MHVTimeCollection *)[reader readElementArray:c_element_alcohol asClass:[MHVTime class] andArrayClass:[MHVTimeCollection class]];
    self.naps = (MHVOccurenceCollection *)[reader readElementArray:c_element_nap asClass:[MHVOccurence class] andArrayClass:[MHVOccurenceCollection class]];
    self.exercise = (MHVOccurenceCollection *)[reader readElementArray:c_element_exercise asClass:[MHVOccurence class] andArrayClass:[MHVOccurenceCollection class]];
    self.sleepinessValue = [reader readElement:c_element_sleepiness asClass:[MHVPositiveInt class]];
}

+ (NSString *)typeID
{
    return c_typeid;
}

+ (NSString *)XRootElement
{
    return c_typename;
}

+ (MHVItem *)newItem
{
    return [[MHVItem alloc] initWithType:[MHVSleepJournalPM typeID]];
}

@end