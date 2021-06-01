import SwiftUI

public struct PlaygroundView {
    
    // MARK: - Properties
    static var width: Double = 614
    static var height: Double = 820
    
}

// MARK: - Extensions
public extension PlaygroundView {
    static var preferedViewSize: CGSize {
        CGSize(width: width, height: height)
    }
    
    static var introductionView: UIHostingController<IntroductionView> {
        let view = UIHostingController(rootView: IntroductionView())
        view.preferredContentSize = preferedViewSize
        return view
    }
    
    static var informationView: UIHostingController<InformationView> {
        let view = UIHostingController(rootView: InformationView())
        view.preferredContentSize = preferedViewSize
        return view
    }
    
    static var funView: UIHostingController<FunView> {
        let view = UIHostingController(rootView: FunView())
        view.preferredContentSize = preferedViewSize
        return view
    }
}
