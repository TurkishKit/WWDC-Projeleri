import SwiftUI
import SpriteKit
import PlaygroundSupport

public struct WelcomeView: View {
    
    // MARK: - Properties
    @State var viewState = CGSize.zero
    
    // MARK: - Life Cycle
    public init() {}
    
    // MARK: - UI Elements

    var scene: SKScene {
            let scene = GameScene()
            scene.size = CGSize(width: 700, height: 300)
            scene.scaleMode = .fill
            return scene
    }

    public var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(red: 30/255, green: 30/255, blue: 30/255), Color(red: 10/255, green: 10/255, blue: 10/255)]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea(.all)
            GeometryReader { geo in
                HStack {
                    SpriteView(scene: scene)
                        .frame(width: geo.size.width, height: geo.size.width * 0.4285)
                }
                .frame(minWidth: 10, maxWidth: .infinity, minHeight: 10, maxHeight: .infinity, alignment: .center)
            }
            
        }
        }
    class GameScene: SKScene {
        let bandNode = SKSpriteNode(imageNamed: "ProductsBand.jpg")
        let parcel1Node = SKSpriteNode(imageNamed: "parcel1")
        let parcel2Node = SKSpriteNode(imageNamed: "parcel2")
        let parcel3Node = SKSpriteNode(imageNamed: "parcel3")
        let parcel4Node = SKSpriteNode(imageNamed: "parcel4")

        
        override func didMove(to view: SKView) {
            addBand()
            addParcel1()
            addParcel2()
            addParcel3()
            addParcel4()
            let longAction = SKAction.moveBy(x: 1100.1, y: 0, duration: 11.2)
            let endlessLongAction = SKAction.repeatForever(longAction)
            
            let action = SKAction.moveBy(x: 110.1, y: 0, duration: 1.1)
            let goBack = SKAction.moveBy(x: -110.1, y: 0, duration: 0)
            let endlessAction = SKAction.repeatForever(SKAction.sequence([action, goBack]))
            bandNode.run(endlessAction)
            parcel1Node.run(endlessLongAction)
            parcel2Node.run(endlessLongAction)
            parcel3Node.run(endlessLongAction)
            parcel4Node.run(endlessLongAction)
        }
            
        func addBand() {
            bandNode.name = "ProductsBand"
            bandNode.position.y = 150
            bandNode.position.x = 0
            self.addChild(bandNode)
        }
        
        func addParcel1() {
            parcel1Node.name = "parcel1"
            parcel1Node.position.y = 150
            parcel1Node.position.x = -100
            self.addChild(parcel1Node)
        }
        
        func addParcel2() {
            parcel2Node.name = "parcel2"
            parcel2Node.position.y = 150
            parcel2Node.position.x = -400
            self.addChild(parcel2Node)
        }
        
        func addParcel3() {
            parcel3Node.name = "parcel3"
            parcel3Node.position.y = 150
            parcel3Node.position.x = -700
            self.addChild(parcel3Node)
        }
        
        func addParcel4() {
            parcel4Node.name = "parcel4"
            parcel4Node.position.y = 150
            parcel4Node.position.x = -900
            self.addChild(parcel4Node)
        }

    }
}

