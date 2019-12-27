//
//  MeanShiftFacade.h
//  jedai-sdk-core
//
//  Created by Mark Berner on 16/11/2018.
//  Copyright © 2018 Anagog Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MeanShiftLocation : NSObject
@property (nonatomic, assign) long locationId;
@property (nonatomic, assign) CLLocationCoordinate2D locationCoord;

- (instancetype)init:(long) locationId locationCoord:(CLLocationCoordinate2D) locationCoord;

@end

@interface MeanShiftCluster : NSObject
@property (nonatomic, strong) NSArray<NSNumber*>* ids;
@property (nonatomic, assign) CLLocationCoordinate2D clusterCoord;
@end

@interface MeanShiftFacade : NSObject

- (NSArray<MeanShiftCluster*>*) buildClusters:(NSArray<MeanShiftLocation*>*) locations withKernel:(double)kernel;

@end

NS_ASSUME_NONNULL_END
