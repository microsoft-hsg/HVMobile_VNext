//
//  MHVMoreFeatures.m
//  SDKFeatures
//
//  Copyright (c) 2017 Microsoft Corporation. All rights reserved.
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

#import "MHVMoreFeatures.h"
#import "MHVTypeListViewController.h"
#import "MHVUIAlert.h"

@implementation MHVMoreFeatures

- (void)disconnectApp
{
    [MHVUIAlert showYesNoPromptWithMessage:@"Are you sure you want to disconnect this application from HealthVault?\r\nIf you click Yes, you will need to re-authorize the next time you run it."
                                completion:^(BOOL selectedYes)
     {
         if (selectedYes)
         {
             [self.listController.statusLabel showBusy];
             //
             // REMOVE RECORD AUTHORIZATION.
             //
             id<MHVSodaConnectionProtocol> connection = [[MHVConnectionFactory current] getOrCreateSodaConnectionWithConfiguration:[MHVFeaturesConfiguration configuration]];
             
             [connection deauthorizeApplicationWithCompletion:^(NSError * _Nullable error)
             {
                 [[NSOperationQueue mainQueue] addOperationWithBlock:^
                 {
                     [self.listController.navigationController popToRootViewControllerAnimated:YES];
                 }];
             }];
         }
     }];
}

- (void)getServiceDefinition
{
    [self.listController.statusLabel showBusy];
    
    id<MHVSodaConnectionProtocol> connection = [[MHVConnectionFactory current] getOrCreateSodaConnectionWithConfiguration:[MHVFeaturesConfiguration configuration]];
    
    [connection.platformClient getServiceDefinitionWithWithLastUpdatedTime:nil
                                                          responseSections:MHVServiceInfoSectionsAll
                                                                completion:^(MHVServiceDefinition * _Nullable serviceDefinition, NSError * _Nullable error)
    {
        if (error)
        {
            [MHVUIAlert showInformationalMessage:error.localizedDescription];
        }
        else
        {
            MHVConfigurationEntry* configEntry = [serviceDefinition.platform.config objectAtIndex:0];
            MHVConfigurationEntry* configEntry2 = [serviceDefinition.platform.config objectAtIndex:1];
            NSMutableString* output = [[NSMutableString alloc] init];
            
            [output appendLines:17, @"Some data from ServiceDefinition",
             @"[PlatformUrl]", serviceDefinition.platform.url,
             @"[PlatformVersion]", serviceDefinition.platform.version,
             @"[ShellUrl]", serviceDefinition.shell.url,
             @"[ShellRedirect]", serviceDefinition.shell.redirectUrl,
             @"[Example Config Entries]",
             configEntry.key, @"==", configEntry.value, @"==========",
             configEntry2.key, @"==", configEntry2.value];
            
            [MHVUIAlert showInformationalMessage:output];
        }
        
        
        [self.listController.statusLabel clearStatus];
    }];
}

- (void)authorizeAdditionalRecords
{
    id<MHVSodaConnectionProtocol> connection = [[MHVConnectionFactory current] getOrCreateSodaConnectionWithConfiguration:[MHVFeaturesConfiguration configuration]];
    
    [connection authorizeAdditionalRecordsWithViewController:self.listController
                                                  completion:^(NSError * _Nullable error)
    {
        if (error)
        {
             [MHVUIAlert showInformationalMessage:error.localizedDescription];
        }
        else
        {
            // Popping to the root view controller will reload to the updated list of authorized records
            [[NSOperationQueue mainQueue] addOperationWithBlock:^
            {
                [self.listController.navigationController popToRootViewControllerAnimated:YES];
            }];
        }
    }];
}

@end