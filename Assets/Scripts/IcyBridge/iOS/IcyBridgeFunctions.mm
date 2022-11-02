#import <Foundation/Foundation.h>
#import <ARKit/ARKit.h>
#import <UnityFramework/UnityFramework-Swift.h>

//region functions
extern "C" {

struct UnityXRNativeSessionPtr
{
    int version;
    void* session;
};


void IcyBridge_ARSessionUpdatedFrame(void *ptr) {

    // In case of invalid buffer ref
    if (!ptr) return;
    auto data = static_cast<UnityXRNativeSessionPtr*>(ptr);
    ARSession* session = (__bridge ARSession*)data->session;
    [[IcyBridge shared] ARSessionUpdatedFrame:session];
    return;
}

void IcyBridge_CFRelease(void* ptr){
    if (ptr)
    {
        CFRelease(ptr);
    }
}

}
