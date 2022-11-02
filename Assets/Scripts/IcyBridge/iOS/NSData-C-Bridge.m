#import <Foundation/Foundation.h>

int IcyBridge_NSData_getLength(void* self)
{
    NSData* data = (__bridge NSData*)self;
    return (int)data.length;
}

void* IcyBridge_NSData_createWithBytes(void* bytes, int length)
{
    NSData* data = [[NSData alloc] initWithBytes:bytes
                                          length:length];

    return (__bridge_retained void*)data;
}

void* IcyBridge_NSData_createWithBytesNoCopy(void* bytes, int length, bool freeWhenDone)
{
    NSData* data = [[NSData alloc] initWithBytesNoCopy:bytes
                                                length:length
                                          freeWhenDone:freeWhenDone];

    return (__bridge_retained void*)data;
}

const void* IcyBridge_NSData_getBytes(void* self)
{
    NSData* data = (__bridge NSData*)self;
    return data.bytes;
}
