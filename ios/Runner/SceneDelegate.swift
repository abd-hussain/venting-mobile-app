import Flutter
import UIKit

class SceneDelegate: FlutterSceneDelegate {
  private static let splashBackground = UIColor(
    red: 0.03921568627,
    green: 0.02352941176,
    blue: 0.07843137255,
    alpha: 1
  )

  override func scene(
    _ scene: UIScene,
    willConnectTo session: UISceneSession,
    options connectionOptions: UIScene.ConnectionOptions
  ) {
    super.scene(scene, willConnectTo: session, options: connectionOptions)
    applySplashBackground()
  }

  override func sceneDidBecomeActive(_ scene: UIScene) {
    super.sceneDidBecomeActive(scene)
    applySplashBackground()
  }

  private func applySplashBackground() {
    window?.backgroundColor = Self.splashBackground
    window?.rootViewController?.view.backgroundColor = Self.splashBackground
  }
}
