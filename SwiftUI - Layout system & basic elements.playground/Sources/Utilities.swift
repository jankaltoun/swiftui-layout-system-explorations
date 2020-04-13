import SwiftUI

public extension View {
    func redColored() -> some View {
        self
            .background(Color(red: 255, green: 0, blue: 0, opacity: 0.2))
            .border(Color(red: 255, green: 0, blue: 0))
    }
    
    func greenColored() -> some View {
        self
            .background(Color(red: 0, green: 255, blue: 0, opacity: 0.2))
            .border(Color(red: 0, green: 255, blue: 0))
    }
    
    func blueColored() -> some View {
        self
            .background(Color(red: 0, green: 0, blue: 255, opacity: 0.2))
            .border(Color(red: 0, green: 0, blue: 255))
    }
}
