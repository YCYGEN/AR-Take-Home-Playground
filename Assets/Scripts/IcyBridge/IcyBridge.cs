
using System;
using UnityEngine;
using YCYShells;
using System.Runtime.InteropServices;
using UnityEngine.XR.ARFoundation;
using UnityEngine.Experimental.Rendering;
using UnityEngine.XR.Interaction.Toolkit.AR;

#if UNITY_IOS
using UnityEngine.XR.ARKit;
#endif

namespace YCYShells.IcyBridge
{
    public class IcyBridge : MonoBehaviour
    {
        #region Native Bindings

        [DllImport ("__Internal")]
        public static extern void IcyBridge_ARSessionUpdatedFrame(IntPtr pointer);

        #endregion


        #region Inputs

        [SerializeField]
        [Tooltip("The ARSession running in Unity.")]
        ARSession m_ARSession;

        /// <summary>
        /// Get/Set the <c>ARSession</c>.
        /// </summary>
        public ARSession arSession
        {
            get { return m_ARSession; }
            set { m_ARSession = value; }
        }

        [SerializeField]
        [Tooltip("The ARCameraManager running in the ARSession.")]
        ARCameraManager m_ARCameraManager;

        /// <summary>
        /// Get/Set the <c>ARCameraManager</c>.
        /// </summary>
        public ARCameraManager arCameraManager
        {
            get { return m_ARCameraManager; }
            set { m_ARCameraManager = value; }
        }


        public bool m_OverrideAppTargetFrameRate = false;
        public int m_TargetFrameRate = 60;
        #endregion


        private IntPtr state_;

        private void Start()
        {
            if (m_OverrideAppTargetFrameRate)
            {
                Application.targetFrameRate = m_TargetFrameRate;
            }
        }

        void OnEnable()
        {
            gameObject.name = "IcyBridgeUnity";
            Debug.Assert(m_ARCameraManager != null, "ARCamera is required.");
            m_ARCameraManager.frameReceived += OnFrameReceived;
        }

        void OnDisable()
        {
            if (m_ARCameraManager != null) {
                m_ARCameraManager.frameReceived -= OnFrameReceived;
            }
        }

        void OnFrameReceived(ARCameraFrameEventArgs eventArgs)
        {
#if UNITY_IOS
            ARKitSessionSubsystem arkitSessionSubsystem =
                ((m_ARSession != null) && (m_ARSession.subsystem is ARKitSessionSubsystem))
                    ? (ARKitSessionSubsystem)m_ARSession.subsystem
                    : null;
            IntPtr x = (arkitSessionSubsystem.nativePtr);
            IcyBridge_ARSessionUpdatedFrame(x);
#endif
        }
    }
}
