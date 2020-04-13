import PlaygroundSupport
import SwiftUI

//: # The Layout conversation
/*:
 In SwiftUI the Views talk to each other during layout to figure out how big they should be.
 The conversation happens from top to bottom.
 And from the outermost view modifier to the view itself.
 
 The gist of it is that a view is always proposed some space by its parent.
 The view can then decide itself what to do with that space.
 There are basically three things the view can do:
 * Fill its parent
 * Clamp itself at a smaller size
 * Overflow the parent
*/
//: ## An example
/*:
 In case of the view below, the discussion might go something like this:
 
 1. __SwiftUI__: Hey `TestView` you can have full screen. How much do you want?
 2. __TestView__: Hey `Border` you can have full screen. How much do you want?
 3. __Border__: Hey `Background` you can have full screen. How much do you want?
 4. __Background__: Hey `Padding` you can have full screen. How much do you want?
 5. __Padding__: Hey `HStack` you can have full screen ninus P points on each side.
 5. __HStack__: Yo `Text`s how big are you?
 6. __Texts__: We're about _A*B_ and _C*D_ big.
 
---
 
 7. __HStack__: I need to be as big as my children, so _A*B + C*D = E_ points.
 8. __Padding__: I need to be as big as my child plus padding, so _E + P = X_ points.
 9. __Background__: I'll be as big as my child, so X.
 10. __Border__: I'll be as big as my child, so X.
 11. __TestView__: I'll be as big as my child, so X.
 12. __SwiftUI__: Okay, here's X.
*/
struct TestView: View {
    var body: some View {
        HStack {
            Text("Alpacas")
            Text("Rule")
        }
        .padding()
        .background(Color.yellow)
        .border(Color.red)
    }
}

let testView = TestView()
PlaygroundPage.current.setLiveView(testView)
