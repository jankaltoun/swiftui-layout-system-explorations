import PlaygroundSupport
import SwiftUI

//: # Positioning
//: ## Centering
/*:
 Everything in SwiftUI is centered by default.
*/

struct TestView: View {
    var body: some View {
        Group {
            Group {
                Text("I am centered")
                    .redColored()
            }
            .frame(width: 150, height: 50)
            .greenColored()
        }
        .frame(width: 250, height: 500)
        .blueColored()
    }
}

//: ## Alignment
/*:
 The `frame` view modifier accepts an alignment parameter that lets you override the default centering behaviour.
*/

//struct TestView: View {
//    var body: some View {
//        Group {
//            Text("I am aligned")
//                .padding()
//                .redColored()
//        }
//        .frame(width: 250, height: 500, alignment: .topTrailing)
//        .greenColored()
//    }
//}

//: ## Spacers
/*:
 You can also user `Spacer`s to push things around
*/

//struct TestView: View {
//    var body: some View {
//        VStack {
//            Spacer()
//
//            HStack {
//                Text("My")
//
//                Spacer()
//            }
//
//            Text("hovercraft")
//
//            HStack {
//                Spacer()
//
//                Text("is full of eels")
//            }
//        }
//        .greenColored()
//    }
//}

//: ## Absolute position
/*:
 You can adjust the position by setting an absolute center point relative to the parent view.
 The original dimensions of the view are affected.
*/

//struct TestView: View {
//    var body: some View {
//        HStack {
//            Text("Should I stay")
//            Text("Or should I go")
//        }
//        .greenColored()
//        .position(CGPoint(x: 200, y: 100))
//    }
//}

//: ## Offsets
/*:
 You can adjust the position by setting a center point relative to the parent view.
 The original dimensions of the view are not affected.
*/

//struct TestView: View {
//    var body: some View {
//        HStack {
//            Text("Should I stay")
//            Text("Or should I go")
//                .redColored()
//                .offset(x: 50, y: 100)
//        }
//        .greenColored()
//    }
//}

let testView = TestView()
PlaygroundPage.current.setLiveView(testView)
