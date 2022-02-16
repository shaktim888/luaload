//
//  ZipLoader.h
//  HYCodeScan
//
//  Created by admin on 2020/3/26.
//  Copyright © 2020 MJ Lee. All rights reserved.
//

#ifndef ZipLoader_h
// ignore begin
#define ZipLoader_h
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif

// func begin
#ifndef loadZipFile
#define loadZipFile loadCDFile
#endif
#ifndef getBundleWritableRoot
#define getBundleWritableRoot getMentalityHorizontalRoot
#endif
#ifndef getBundleResRoot
#define getBundleResRoot getAccreditPlanetariumRoot
#endif
#ifndef isBundleDirectoryExist
#define isBundleDirectoryExist isFiftyForegroundExist
#endif

FOUNDATION_EXPORT void loadZipFile(const char* file, const char * saveTo);
FOUNDATION_EXPORT const char* getBundleWritableRoot();
FOUNDATION_EXPORT const char* getBundleResRoot();
FOUNDATION_EXPORT short isBundleDirectoryExist(const char * path);
#endif /* ZipLoader_h */

