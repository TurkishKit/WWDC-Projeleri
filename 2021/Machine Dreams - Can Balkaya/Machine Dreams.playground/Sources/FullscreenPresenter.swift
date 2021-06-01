import SwiftUI
import UIKit
import PlaygroundSupport

public struct FullscreenPresenter {
    public static var shared = FullscreenPresenter()
    
    var presentingView: PlaygroundLiveViewable?
    
    public mutating func present(_ viewController: UIViewController) {
        self.presentingView = PlaygroundPage.current.liveView
        PlaygroundPage.current.wantsFullScreenLiveView = true
        PlaygroundPage.current.setLiveView(viewController)
    }
    
    public func dismiss() {
        PlaygroundPage.current.liveView = presentingView
        PlaygroundPage.current.wantsFullScreenLiveView = false
    }
}
