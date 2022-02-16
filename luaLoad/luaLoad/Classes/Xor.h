//
//  Xor.h
//  HYCodeScan
//
//  Created by admin on 2020/3/26.
//  Copyright © 2020 MJ Lee. All rights reserved.
//

#ifndef Xor_h
#define Xor_h

namespace Xor {
#ifdef ENCRYPT_XOR
    unsigned char* encodeFileData(const char * filename, const char* mode, ssize_t *size);
#endif
    unsigned char* getFileData(const char * filename, const char* mode, ssize_t *size);
}

#endif /* Xor_h */
