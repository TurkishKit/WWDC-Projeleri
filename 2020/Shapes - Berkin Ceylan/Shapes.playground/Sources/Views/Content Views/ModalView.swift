import SwiftUI

public struct ModalView: View {
    
    // MARK: - Properties
    @State var selection = 0
    
    // MARK: - Content View
    public var body: some View {
        VStack {
            
            Text("Learn More")
                .textStyle(size: 44, color: .black, weight: .bold)
                .padding(.top, 20)
            
            Text("Learn what you need to know about polygons right away.")
                .textStyle(size: 20, color: .gray, weight: .regular)
                .padding(.bottom, 40)
            
            Image(systemName: "square.fill.on.circle.fill")
                .font(.system(size: 100, weight: .bold, design: .rounded))
                .foregroundColor(Color.green)
                .padding(.bottom, 20)
            
            HStack {
                
                Text("Did you know that: Circle")
                    .textStyle(size: 30, color: .black, weight: .semibold)
                    .padding(20)
                HStack {
                    VStack {
                        
                        Text("1")
                            .textStyle(size: 30, color: .black, weight: .bold)
                        
                        Text("Side")
                            .textStyle(size: 20, color: .gray, weight: .regular)
                    }.padding(20)
                    
                    VStack {
                        
                        Text("360")
                            .textStyle(size: 30, color: .black, weight: .bold)
                        
                        Text("Angle")
                            .textStyle(size: 20, color: .gray, weight: .regular)
                    }.padding(20)
                    
                    VStack {
                        
                        Text("∞")
                            .textStyle(size: 30, color: .black, weight: .bold)
                        
                        Text("Chord")
                            .textStyle(size: 20, color: .gray, weight: .regular)
                    }.padding(20)
                }
            }
            Group{
                
                Text("Learn.Solve.Create.")
                    .textStyle(size: 30, color: .green, weight: .bold)
                    .padding(.top, 10)
                
                HStack {
                    VStack{
                        
                        Text("Learn")
                            .textStyle(size: 30, color: .black, weight: .bold)
                        
                        Text("🤓")
                            .textStyle(size: 30, color: .black, weight: .bold)
                    }.padding(10)
                    
                    Text("The sum of the angles of the polygon is (n-2)*180. The angle of the outer aspects of each polygon is 360. With the diagonals drawn from one corner, the polygon is divided into (n-2) triangles.")
                        .textStyle(size: 17, color: .black, weight: .regular)
                }.padding(10)
                
                HStack {
                    
                    Text("There is nothing you cannot solve and do with the valuable information you learned in the first step! Now you can solve for the angles of a polygon if you know the number of sides using the formulas.")
                        .textStyle(size: 17, color: .black, weight: .regular)
                    VStack{
                        
                        Text("Solve")
                            .textStyle(size: 30, color: .black, weight: .bold)
                        
                        Text("📝")
                            .textStyle(size: 30, color: .black, weight: .bold)
                    }.padding(10)
                }.padding(15)
                HStack {
                    VStack{
                        
                        Text("Create")
                            .textStyle(size: 30, color: .black, weight: .bold)
                        
                        Text("🚀")
                            .textStyle(size: 30, color: .black, weight: .bold)
                    }.padding(10)
                    
                    Text("These formulas are more than homework for you. Shape your creativity by using these wonderful shapes in your dream app.😉")
                        .textStyle(size: 17, color: .black, weight: .regular)
                }.padding(10)
            }
        }
    }
}

// C U Later Alligator! ✈️
