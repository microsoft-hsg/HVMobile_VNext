//
// MHVVocabIdentifier.h
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

#import "MHVType.h"
#import "MHVCodableValue.h"

NS_ASSUME_NONNULL_BEGIN

NSString *const c_rxNormFamily;
NSString *const c_snomedFamily;
NSString *const c_hvFamily;
NSString *const c_icdFamily;
NSString *const c_hl7Family;
NSString *const c_isoFamily;
NSString *const c_usdaFamily;

@interface MHVVocabIdentifier : MHVType

// -------------------------
//
// Data
//
// -------------------------
//
// (Required) - the vocabulary name. E.g Rx Norm Active Medications
//
@property (readwrite, nonatomic, strong) NSString *name;
//
// (Optional) - e.g. RxNorm...
//
@property (readwrite, nonatomic, strong, nullable) NSString *family;
//
// (Optional) Vocabulary version
//
@property (readwrite, nonatomic, strong, nullable) NSString *version;
//
// (Optional) Language, in ISO code. E.g. 'en'.
//
@property (readwrite, nonatomic, strong, nullable) NSString *language;
//
// (Optional)
//
@property (readwrite, nonatomic, strong, nullable) NSString *codeValue;

// -------------------------
//
// Initializers
//
// -------------------------
- (instancetype)initWithFamily:(NSString *)family andName:(NSString *)name;

// -------------------------
//
// Methods
//
// -------------------------
//
// Create a codedValue for the vocabItem
//
- (MHVCodedValue *)codedValueForItem:(MHVVocabItem *)vocabItem;
- (MHVCodedValue *)codedValueForCode:(NSString *)code;
- (MHVCodableValue *)codableValueForText:(NSString *)text andCode:(NSString *)code;
//
// Generate a single string representing this vocab identifier
//
- (NSString *)toKeyString;

@end

NS_ASSUME_NONNULL_END

@interface MHVVocabIdentifierCollection : MHVCollection

@end
