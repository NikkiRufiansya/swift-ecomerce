import UIKit

import iXGCallbackBridge

public var detectionJailbreak = false

@_cdecl("callback")
public func someSwiftFunction(context: UnsafePointer<IXGCallbackContext>)
{
    if context.pointee.eventType == IXG_ENV_JAILBREAK {
        NSLog("Jailbroken device");
        detectionJailbreak = true
    }
}

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
       
        return true
    }

    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    
   
    
}
