#import <Foundation/Foundation.h>

int IcyBridge_NSString_lengthOfBytesUsingEncoding(void* self)
{
    if (self == NULL)
        return 0;

    NSString* string = (__bridge NSString*)self;
    return (int)[string lengthOfBytesUsingEncoding:NSUTF16LittleEndianStringEncoding];
}

bool IcyBridge_NSString_getBytes(void* self, void* buffer, int length)
{
    NSString* string = (__bridge NSString*)self;
    const NSRange range = NSMakeRange(0, string.length);
    return [string getBytes:buffer
                  maxLength:length
                 usedLength:NULL
                   encoding:NSUTF16LittleEndianStringEncoding
                    options:0
                      range:range
             remainingRange:NULL];
}

int IcyBridge_NSString_getLength(void* self)
{
    NSString* string = (__bridge NSString*)self;
    return (int)string.length;
}

void* IcyBridge_NSString_createWithString(void* bytes, int length)
{
    NSString* string = [[NSString alloc] initWithBytes: bytes
                                                length: 2 * length
                                              encoding: NSUTF16LittleEndianStringEncoding];

    return (__bridge_retained void*)string;
}

void* IcyBridge_NSString_serialize(void* self)
{
    NSString* string = (__bridge NSString*)self;
    NSData* data = [NSKeyedArchiver archivedDataWithRootObject:string];
    return (__bridge_retained void*)data;
}

void* IcyBridge_NSString_deserialize(void* serializedString)
{
    NSData* data = (__bridge NSData*)serializedString;
    NSString* string = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    return (__bridge_retained void*)string;
}
