import PlaygroundSupport
import SwiftUI

struct SizingContainer<Content: View>: View {
    @State private var width: CGFloat = 100
    @State private var height: CGFloat = 100
    
    var content: Content
    
    var body: some View {
        ZStack {
            content
                .background(Color(red: 255, green: 0, blue: 0, opacity: 0.2))
                .border(Color(red: 255, green: 0, blue: 0))
                .frame(width: width, height: height)
                .background(Color(red: 0, green: 255, blue: 0, opacity: 0.1))
                .border(Color(red: 0, green: 255, blue: 0))
            
            VStack {
                Spacer()
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Width")
                        Spacer()
                        Text("\(Int(width))")
                    }
                    Slider(value: $width, in: 0...400, step: 1)
                    
                    HStack {
                        Text("Height")
                        Spacer()
                        Text("\(Int(height))")
                    }
                    Slider(value: $height, in: 0...400, step: 1)
                }
                .background(Color.white)
            }
            .padding()
            .frame(width: 375)
        }
    }
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
}

// Path

/*let measureView = SizingContainer {
    Path { path in
        let values = [20, 30, 50, 100, 120, 300, 250, 210, 160, 40, 50, 80, 100]
        
        values.enumerated().map { index, value in
            path.addRect(
                CGRect(
                    x: (index - 1) * 10,
                    y: 100,
                    width: 10,
                    height: -value
                )
            )
        }
    }
}*/

// Shape

/*let measureView = SizingContainer() {
    Rectangle()
        //.rotation(.init(degrees: 45))
}*/

// Text

let measureView = SizingContainer() {
    Text("YOLO")
}

// Image

/*let measureView = SizingContainer() {
    Image(systemName: "hare")
        //.resizable()
        //.aspectRatio(1, contentMode: .fit)
        //.aspectRatio(1, contentMode: .fill)
}*/

PlaygroundPage.current.setLiveView(measureView)
