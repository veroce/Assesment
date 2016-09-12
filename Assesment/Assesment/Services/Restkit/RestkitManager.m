//
//  ReskitManager.m
//  Assesment
//
//  Created by Vero on 8/9/16.
//  Copyright © 2016 veronica. All rights reserved.
//

#import "RestkitManager.h"
#import "People.h"
#import <RestKit/RestKit.h>
#import "Constants.h"
#import "Profession.h"
#import "UtilsSearchSort.h"

@implementation RestkitManager

-(void)configureRestKit{
    // initialize AFNetworking HTTPClient
    NSURL *baseURL = [NSURL URLWithString:@"https://raw.githubusercontent.com/AXA-GROUP-SOLUTIONS/mobilefactory-test/master"];
    
    // initialize RestKit
    RKObjectManager *objectManager = [RKObjectManager managerWithBaseURL:baseURL];
    
    // setup object mappings
    RKObjectMapping *peopleMapping = [RKObjectMapping mappingForClass:[People class]];
    
    [peopleMapping addAttributeMappingsFromDictionary:@{
                                                        @"id":          @"idPeople",
                                                        @"name":        @"name",
                                                        @"thumbnail":   @"thumbnail",
                                                        @"age":         @"age",
                                                        @"weight":      @"weight",
                                                        @"height":      @"height",
                                                        @"hair_color":  @"hairColor",
                                                        @"friends" :    @"namesFriends"
                                                        }];
    
    // register mappings with the provider using a response descriptor
    RKResponseDescriptor *responseDescriptor =
    [RKResponseDescriptor responseDescriptorWithMapping:peopleMapping method:RKRequestMethodGET
                                            pathPattern:nil
                                                keyPath:@"Brastlewark"
                                            statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    
    [RKMIMETypeSerialization registerClass:[RKNSJSONSerialization class] forMIMEType:@"text/plain"];
    
    RKObjectMapping *professions = [RKObjectMapping mappingForClass:[Profession class]];
    [professions addPropertyMapping: [RKAttributeMapping attributeMappingFromKeyPath: nil toKeyPath: @"professionName"]];
    [peopleMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"professions" toKeyPath:@"professions"withMapping:professions]];
    
    [objectManager addResponseDescriptor:responseDescriptor];
}
-(void)loadPeople{
    
    [[RKObjectManager sharedManager] getObjectsAtPath:@"data.json" parameters:nil
    success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        
        if(_delegate && [_delegate respondsToSelector:@selector(communicationDownloadFinished:WithError:)]){
            [_delegate communicationDownloadFinished:mappingResult.array WithError:kRESPONSE_OK];
        }
        
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        if(_delegate && [_delegate respondsToSelector:@selector(communicationDownloadFinished:WithError:)]){
            [_delegate communicationDownloadFinished:nil WithError:kRESPONSE_TIMEOUT];
        }
        NSLog(@"ERROR: %@", error);
    }];
    
}

@end
