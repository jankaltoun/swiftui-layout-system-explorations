import PlaygroundSupport
import SwiftUI

//: # Sizing container
/*:
 Let's prepare a simple container that will let us resize view on-demand to demonstrate the sizing behaviour of various views.
 
 Inspired by a chapter in __Thinking in SwiftUI__ by Chris Eidhof and Florian Kugler.
 Buy it at [objc.io](https://www.objc.io/books/thinking-in-swiftui/).
*/

struct SizingContainer<Content: View>: View {
    @State private var width: CGFloat = 100
    @State private var height: CGFloat = 100
    
    var content: Content
    
    var body: some View {
        ZStack {
            content
                .redColored()
                .frame(width: width, height: height)
                .greenColored()
            
            VStack {
                Spacer()
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Offered width")
                        Spacer()
                        Text("\(Int(width))")
                    }
                    Slider(value: $width, in: 0...400, step: 1)
                    
                    HStack {
                        Text("Offered height")
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

//: # View types
/*:
 There are 4 types of views as far as their __default__ sizing behaviour is concerned:
 * Views that will try to size themselves based on space offered
 * Views that will size themselves based on their children
 * Views that will grow to fit the space offered
 * Views that may grow larger than space provided

*/
//: ## Views that will try to size themselves based on space offered
/*:
 A good example is `Text`. Text will always try to fit itself into the space provided to it.
 With one notable exception - it will always show at least one line of text.
*/

let sizingView = SizingContainer() {
    Text("Nobody expects the Spanish inquisition")
}

//: ## Views that will size themselves based on their children
/*:
 Good example are Stacks:
 * `HStack`
 * `VStack`
 * `ZStack`
*/

//let sizingView = SizingContainer() {
//    HStack {
//        Text("Nobody")
//        Text("expects")
//        Text("the")
//        Text("Spanish")
//        Text("inquisition")
//    }
//}

//let sizingView = SizingContainer() {
//    VStack {
//        Text("Nobody")
//        Text("expects")
//        Text("the")
//        Text("Spanish")
//        Text("inquisition")
//    }
//}

//let sizingView = SizingContainer() {
//    ZStack {
//        Text("Nobody")
//        Text("expects")
//        Text("the")
//        Text("Spanish")
//        Text("inquisition")
//    }
//}

//: ## Views that will grow to fit the space offered
/*:
 Such views are basically all the `Shape`s:
 * Circle
 * Rectangle
 * Ellipse
 * Capsule
 * etc.
 
 But for example also `Spacer`, `Color` and others.
*/

//let sizingView = SizingContainer() {
//    Rectangle()
//}

//: Interesting things happen when translations are applied to `Shape`s

//let sizingView = SizingContainer() {
//    Rectangle()
//        .rotation(.degrees(45))
//}

//: Another example is `Spacer` used to fill in space (e.g. to push views apart).

//let sizingView = SizingContainer() {
//    Spacer()
//}

//: Almost everything in SwiftUI is a view and `Color` is no exception!

//let sizingView = SizingContainer() {
//    Color.purple
//}

//: ## Views that may grow larger than space provided
/*:
 One such example is a basic Path. Unless you make it dynamic to fill a provided rectangle, it will always size itself as defined.
*/

//let sizingView = SizingContainer {
//    Path { path in
//        let values = [20, 30, 50, 100, 120, 300, 250, 210, 160, 40, 50, 80, 100]
//
//        values.enumerated().map { index, value in
//            path.addRect(
//                CGRect(
//                    x: (index - 1) * 10,
//                    y: 100,
//                    width: 10,
//                    height: -value
//                )
//            )
//        }
//    }
//}

/*:
 Another example is a basic `Image`. It will always size itself with its ideal dimensions.
*/

//let sizingView = SizingContainer() {
//    Image(systemName: "hare")
//}

/*:
 You can make it behave using the `resizable` view modifier. Then it will render itself as requested by `frame`.
*/

//let sizingView = SizingContainer() {
//    Image(systemName: "hare")
//        .resizable()
//}

/*:
 If it's content mode is set to `.fit`, it will respect the bounds defined by `frame`.
*/

//let sizingView = SizingContainer() {
//    Image(systemName: "hare")
//        .resizable()
//        .aspectRatio(1.5, contentMode: .fit)
//}

/*:
 On the other hand it's content mode is set to `.fill`, it will overflow.
*/

//let sizingView = SizingContainer() {
//    Image(systemName: "hare")
//        .resizable()
//        .aspectRatio(1.5, contentMode: .fill)
//}

PlaygroundPage.current.setLiveView(sizingView)
