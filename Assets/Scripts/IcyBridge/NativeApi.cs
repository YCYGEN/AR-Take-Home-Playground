
using System;
using System.Runtime.InteropServices;

namespace YCYShells.IcyBridge
{
    internal static class NativeApi
    {
        public static void CFRelease(ref IntPtr ptr)
        {
            CFRelease(ptr);
            ptr = IntPtr.Zero;
        }

        [DllImport("__Internal", EntryPoint = "IcyBridge_CFRelease")]
        public static extern void CFRelease(IntPtr ptr);
    }
}
