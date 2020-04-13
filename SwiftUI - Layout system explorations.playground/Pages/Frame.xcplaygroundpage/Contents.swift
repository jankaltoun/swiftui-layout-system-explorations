import PlaygroundSupport
import SwiftUI

//: # Frame
/*:
 View's frame defines how big the View will be once rendered.
 We can use the `frame` view modifier to alter the behaviour.
 From size perspective there are eight parameters of this view modifiers that are interesting from the sizing point of view.
 * `width`/`height` - Forces a fixed width/height of the view
 * `minWidth`/`minHeight` - Forces a minimum width/height of the view
 * `idealWidth`/`idealHeight` - Suggests the ideal width/height in which the view wants to be rendered as fixed
 * `maxWidth`/`maxHeight` - Forces a maximum width/height of the view
*/
//: ## No constraints
/*:
 Without any constraints the view will render "as it wants".
 Oftentimes this means that the view will grow until it fills the space provided by its parent.
 It is not a rule though and different views may behave differently.
*/
/*:
 An `Image` that is not resizable will render at its default size - which is based on font-size in this case of SF Symbols image.
 
 In this case:
 1. The parent view proposes fullscreen dimensions to the `Image`.
 2. The `Image` says "no, thank you, I want to be font-sized".
 3. The `Image` renders itself font-sized.
*/
struct TestView: View {
    var body: some View {
        Image(systemName: "gamecontroller")
            .redColored()
    }
}

//struct TestView: View {
//    var body: some View {
//        Image(uiImage: UIImage(named: "alpacas.jpg")!)
//            .redColored()
//    }
//}

/*:
 An `Image` that is resizable will grow as much as it can to fill its parent.
 
 In this case:
 1. The parent view proposes fullscreen dimensions to the `Image`.
 2. The `Image` says "awesome, I want to be as big as possible, I will use all the space".
 3. The `Image` renders itself fullscreen.
*/
//struct TestView: View {
//    var body: some View {
//        Image(systemName: "gamecontroller")
//            .resizable()
//            .redColored()
//    }
//}

//struct TestView: View {
//    var body: some View {
//        Image(uiImage: UIImage(named: "alpacas.jpg")!)
//            .resizable()
//            .redColored()
//    }
//}

/*:
 `Text` will use all the space proposed by its parent but will not overflow if the text does not fit.
 
 In this case:
 1. The parent view proposes fullscreen dimensions to the `Text`.
 2. The `Text` says "awesome, I want to be as big as possible to show as much text as possible, I will use all the space".
 3. The `Text` renders itself fullscreen and truncates the text.
*/

//struct TestView: View {
//    var body: some View {
//        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam mattis mauris sed ornare gravida. In congue lorem dui, nec euismod ligula feugiat ut. Maecenas pharetra lacus eget aliquet tristique. Aenean ornare est nec odio scelerisque ullamcorper. Maecenas semper, metus vel vestibulum ullamcorper, est elit maximus risus, sed ultrices elit turpis id urna. Phasellus ut nulla sit amet erat cursus egestas. Nullam pulvinar auctor dui placerat congue. Maecenas a venenatis leo, nec mollis odio. Nunc sit amet cursus orci. Duis sodales sagittis risus, ultrices ornare lorem. Aliquam sed aliquam augue, id iaculis quam. Etiam ut maximus tortor. Integer finibus ex et tortor accumsan pretium. Vivamus consequat leo id ipsum gravida imperdiet. Fusce sem tellus, sodales quis sapien eu, maximus aliquet metus. Nulla laoreet tristique suscipit. Vivamus fermentum semper augue, posuere auctor libero euismod venenatis. Integer nibh purus, vulputate vitae convallis sed, pulvinar faucibus augue. In quis tortor blandit, mollis felis vel, elementum lorem. Ut elementum ligula sit amet nulla mattis vulputate. Nulla convallis, massa a bibendum tincidunt, felis ligula suscipit lacus, a hendrerit massa eros ut erat. Proin id dolor lacinia magna posuere ullamcorper. Duis eu lacinia ante. Nullam non diam faucibus, lacinia mauris a, sagittis felis. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Mauris eget luctus purus. Maecenas maximus pretium purus quis blandit. Aliquam felis ligula, ullamcorper semper lobortis id, commodo vel eros. Donec congue dapibus nulla et sodales. Suspendisse neque quam, molestie et leo eu, viverra congue sem. Curabitur ac eros sit amet ex molestie condimentum. Nulla facilisi. Maecenas sit amet urna urna. Proin ullamcorper tempor blandit. Ut sollicitudin orci in massa malesuada, eget luctus velit euismod. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis id congue nunc. Suspendisse rhoncus lobortis eros at tempor. In hac habitasse platea dictumst. Nunc eu enim auctor, blandit diam at, ornare arcu. Donec a consectetur urna, non tincidunt libero. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Praesent eget pretium dolor. Fusce erat sapien, vulputate eget tortor ac, aliquam aliquam magna.")
//            .redColored()
//    }
//}

//: ## Fixed width & height
/*:
 The most straightforward way of sizing a view is to just set its fixed width and height.
 We set the `width` and `height` of the view to 150.
 
 In this case:
 1. The parent view proposes fullscreen dimensions to the `Image`.
 2. The `Image` says "no, thank you, I want to be 150x150".
 3. The `Image` renders itself `150x150`.
*/

//struct TestView: View {
//    var body: some View {
//        Image(systemName: "star")
//            .resizable()
//            .frame(width: 150, height: 150)
//            .redColored()
//    }
//}

//: ## Parent constraint
/*:
 Since views are first asked to render in space provided by the parent, we can specify a width/height on the parent view and ask the child view to render in the parent's space.
 
 In this case:
 1. The parent view proposes fullscreen dimensions to the `VStack`.
 2. The `VStack` says "no, thank you, I know I want to be 150x150.
 3. The `VStack` renders itself `150x150`.
 4. The `VStack` proposes `150x150` dimensions to the `Image`.
 5. The `Image` says "awesome, I want to be as big as possible, I will use all the space".
 6. The `Image` renders itself `150x150`.
*/

//struct TestView: View {
//    var body: some View {
//        VStack {
//            Image(systemName: "star")
//                .resizable()
//                .redColored()
//        }
//        .frame(width: 150, height: 150)
//        .greenColored()
//    }
//}

/*:
 Note that if a child wants to be a certain size, its parent cannot stop it from doing so.
 __Parents only propose children sizes. They do not enforce them.__
 
 In this case:
 1. The parent view proposes fullscreen dimensions to the `VStack`.
 2. The `VStack` says "no, thank you, I know I want to be 75x75.
 3. The `VStack` renders itself `75x75`.
 4. The `VStack` proposes `75x75` dimensions to the `Image`.
 5. The `Image` says "no, thank you, I want to be 150x150".
 6. The `Image` renders itself `150x150`.
*/

//struct TestView: View {
//    var body: some View {
//        VStack {
//            Image(systemName: "star")
//                .resizable()
//                .frame(width: 150, height: 150)
//                .redColored()
//        }
//        .frame(width: 75, height: 75)
//        .greenColored()
//    }
//}

//: ## Minimum width & height
/*:
 We can use these parameters to contrain the view's size to a specific lower boundary.
 This will always work unless the view is fixed size.
 
 In this case:
 1. The parent view proposes fullscreen dimensions to the `VStack`.
 2. The `VStack` says "no, thank you, I know I want to be 75x75.
 3. The `VStack` renders itself `75x75`.
 4. The `VStack` proposes `75x75` dimensions to the `Image`.
 5. The `Image` says "no, thank you, I want to be _at least_ 150x150".
 6. The `Image` renders itself `150x150`.
*/

//struct TestView: View {
//    var body: some View {
//        VStack {
//            Image(systemName: "star")
//                .resizable()
//                .frame(minWidth: 150, minHeight: 150)
//                .redColored()
//        }
//        .frame(width: 75, height: 75)
//        .greenColored()
//    }
//}

//: ## Maximum width & height
/*:
 We can use these parameters to constrain the view's size to a specific upper boundary.
 This will always work unless the view is fixed size.

 In this case:
 1. The parent view proposes fullscreen dimensions to the `Image`.
 2. The `Image` says "no, thank you, I know I want to be _at most_ 150x150.
 3. The `Image` renders itself `150x150`.
*/

//struct TestView: View {
//    var body: some View {
//        Image(systemName: "star")
//            .resizable()
//            .frame(maxWidth: 150, maxHeight: 150)
//            .redColored()
//    }
//}

//: ## Infinity
/*:
 `.infinity` is a special value that can be assigned to any of the width or height attributes.
 It is what it's called - an infinity. We typically use it to indicate a maximum width or height of the view.
 Meaning that we want it to grow as much as possible.
 
 In this case:
 1. The parent view proposes fullscreen dimensions to the `VStack`.
 2. The `VStack` says "awesome, I want to be as big as possible, I will use all the space".
 3. The `VStack` renders itself fullscreen.
 4. The `VStack` proposes fullscreen dimensions to the `Image`.
 2. The `Image` says "no, thank you, I know I want to be 150x150.
 3. The `Image` renders itself `150x150`.
*/

/*struct TestView: View {
    var body: some View {
        VStack {
            Image(systemName: "star")
                .resizable()
                .frame(width: 150, height: 150)
                .redColored()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .greenColored()
    }
}*/

/*:
 Setting width, height, minimum width or minimum  height to `.infinity` will crash.
 Do you know why?
*/

//struct TestView: View {
//    var body: some View {
//        Image(systemName: "flame")
//            .resizable()
//            //.frame(minWidth: .infinity, minHeight: .infinity)
//            //.frame(width: .infinity, height: .infinity)
//            .redColored()
//    }
//}

//: ## Ideal width & height
/*:
 Ideal width and height are used when we "opt out" of the standard sizing mechanism.
 To indicate that we want to do that, we must apply the `fixedSize` view modifier after setting the ideal values using `frame`.
 Once we opt out of the standard sizing mechanism, our view will stop considering the space provided by its parent (the proposed dimensions will be `nil`).
 Instead it will simply render at what it considers an ideal size.
 
 Every View has some ideal dimensions.
*/
/*:
 In case of `Text` it's a height of one line together with an infinite width.
 
 In this case:
 1. The parent view proposes fullscreen dimensions to the `Text`
 2. The `Text` says "Yes yes, but I want to be super-wide".
 3. The `Text` renders itself with a height of one line and a width of the rendered text.
*/

//struct TestView: View {
//    var body: some View {
//        Text("Nobody expects the Spanish inquisition")
//            .font(.system(.largeTitle))
//            .fixedSize()
//    }
//}

/*:
 In case of `Image` it's its size.
 
 In this case:
 1. The parent view proposes fullscreen dimensions to the `Image`
 2. The `Image` says "Yes, thank you, but I'm comfortable with this smaller size".
 3. The `Image` renders itself with a height of one text line (because it's a SF Symbol) and a width computed according to its aspect ratio.
*/

//struct TestView: View {
//    var body: some View {
//        Image(systemName: "flame")
//            .font(.system(size: 100))
//            .fixedSize()
//    }
//}

/*:
 The ideal dimensions can be quite useful in cases where we want to override the standard layout mechanism.
 In the example below the `Text` and the two `Image`s would normally get 1/3 of the space each.
 This would make the images resize but it would also make the text truncate.

 We can use the `fixedSize` view modifier to render the text in its ideal width and height so that the text is not truncated.
 
 Notice that we're passing two additonal parameters - `horizonal` and `vertical`.
 These parameters define for what axes should the ideal dimensions be considered.
 
 Here we ask  the `Text ` to use width proposed by its parent.
 And to use its ideal height.
 
 In this case:
 1. The parent view proposes fullscreen dimensions to the `VStack`
 2. The `VStack` says "thank you, I will consider this but I will size myself according to my children".
 3. The `VStack` proposes fullscreen width and 1/3 of fullscreen height to the `Text`.
 4. The `Text`says "no, thank you, I will size myself as I want".
 5. The `VStack` takes the fullscreen height and substracts the `Text`'s height from it.
 6. The `VStack` proposes the fullscreen wifth and 1/2 of the remaining height to each of the two `Image`s.
 7. The `Image`s say "awesome, thank you, we want to be as big as possible".
 8. The `Image`s render themselves within the dimensions proposed by the `VStack` while respecting their aspect ratios.
*/

//struct TestView: View {
//    var body: some View {
//        VStack {
//            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam mattis mauris sed ornare gravida. In congue lorem dui, nec euismod ligula feugiat ut. Maecenas pharetra lacus eget aliquet tristique. Aenean ornare est nec odio scelerisque ullamcorper. Maecenas semper, metus vel vestibulum ullamcorper, est elit maximus risus, sed ultrices elit turpis id urna. Phasellus ut nulla sit amet erat cursus egestas. Nullam pulvinar auctor dui placerat congue. Maecenas a venenatis leo, nec mollis odio. Nunc sit amet cursus orci. Duis sodales sagittis risus, ultrices ornare lorem. Aliquam sed aliquam augue, id iaculis quam. Etiam ut maximus tortor.")
//                //.fixedSize(horizontal: false, vertical: true)
//                .redColored()
//
//            ForEach(0..<2) { _ in
//                Image(systemName: "flame")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .blueColored()
//            }
//        }
//        .greenColored()
//    }
//}

/*:
 We can of course specify ideal dimensions of view ourselves.
 Typically this can be useful if some computation is required as it is in case of the `Text` above.
 
 In this example we use the `GeometryReader` to see how much space is provided to our `IdealView`.
 The `IdealView` then takes the width provided to it by its parent view and creates as many yellow marbles as fit into the width provided capped at `numberOfCircles`.
 To make all marbles fit we need the view to be able to force its width, when asked to do so.
 
 We can use `idealWidth` for that to set the computed ideal width based on the number of marbles requested.
 
 In this case:
 1. The parent view proposes fullscreen dimensions to the `TestView`'s  `HStack`
 2. The `HStack` says "thank you, I will consider this but I will size myself according to my children".
 3. The `HStack` proposes and 1/3 of fullscreen width and fullcreen height to all its children`.
 4. The `Spacer`s says "awesome, thank you, we want to be as wide as possible and 30 points high".
 5. The `MarbleView`says "no, thank you, I must be my computed width and height of 20".
 6. The `TestView`'s `HStack`  takes the fullscreen width and substracts the `MarbleView`'s width from it.
 7. The `HStack` proposes 1/2 of the remaining width and fullscreen height to each of the two `Spacer`s.
 8. The `Spacer`s say "awesome, thank you, we want to be as wide as possible as 30 points high".
 9. The `MarbleView` renders itself as wide as computed and 30 points high.
 10. The `Spacer`s render themselves within the width proposed by the `VStack` and height of 30 points.
*/

//struct MarbleView: View {
//    static let circleDiameter: CGFloat = 20
//    static let circleDiameterWithPadding: CGFloat = 28
//
//    let numberOfCircles: Int
//
//    var body: some View {
//        GeometryReader { geometry in
//            HStack {
//                ForEach(self.getRange(width: geometry.size.width)) { _ in
//                    Circle()
//                        .foregroundColor(.black)
//                        .frame(width: Self.circleDiameter, height: Self.circleDiameter)
//                }
//            }
//        }
//        .frame(
//            idealWidth: CGFloat(numberOfCircles) * Self.circleDiameterWithPadding,
//            idealHeight: Self.circleDiameterWithPadding
//        )
//    }
//
//    func getRange(width proposedWidth: CGFloat) -> Range<Int> {
//        let upperBoundary = min(
//            Int(floor(proposedWidth/28)),
//            numberOfCircles
//        )
//
//        return 0..<upperBoundary
//    }
//}
//
//struct TestView: View {
//    var body: some View {
//        HStack {
//            Spacer()
//                .frame(height: 30)
//                .blueColored()
//
//            MarbleView(numberOfCircles: 10)
//                //.fixedSize()
//                .redColored()
//
//            Spacer()
//                .frame(height: 30)
//                .blueColored()
//        }
//        .greenColored()
//    }
//}

//: ## Layout priority
/*:
 Above we saw what happens if views compete for space and how `fixedSize` can alter the sizing mechanism.
 There is another way of altering how much space views get and that is using the `layoutPriority` view modifier.
 
 The discussion between views is similar to the other examples.
 It just happens grouped from highest to lowest layout priority.
*/

//struct TestView: View {
//    var body: some View {
//        HStack {
//            Spacer()
//                .frame(height: 100)
//                .blueColored()
//
//            Spacer()
//                .frame(height: 100)
//                .greenColored()
//                .layoutPriority(10)
//
//            Spacer()
//                .frame(height: 100)
//                .redColored()
//                .layoutPriority(10)
//        }
//    }
//}

let testView = TestView()
PlaygroundPage.current.setLiveView(testView)
