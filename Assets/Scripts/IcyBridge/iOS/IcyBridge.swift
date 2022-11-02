//
//  IcyBridge.swift
//  UnityFramework
//
//  Created by Igor Lipovac on 16/12/2020.
//

import Foundation
import ARKit

@objc public protocol IcyBridgeARSessionDelegate: AnyObject {
    func receivedNewARFrame(_ frame: ARFrame)
}

@objc public class IcyBridge: NSObject {
    
    @objc public static let shared: IcyBridge = IcyBridge()
    
    private var arSession: ARSession?
    @objc public weak var sessionDelegate: IcyBridgeARSessionDelegate?
    
    @objc public var currentSession: ARSession? { arSession }

    @objc public func ARSessionUpdatedFrame(_ session: ARSession) {
        self.arSession = session
        if let frame = session.currentFrame {
            self.sessionDelegate?.receivedNewARFrame(frame)
        }
    }
}
