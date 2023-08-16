//
//  ContentView.swift
//  Memorize
//
//  Created by Fatima Kahbi on 8/3/23.
//

import SwiftUI



struct ContentView: View {
    let columns = [GridItem(.adaptive(minimum: 65))]
    
    // default theme is animals
    @State var theme = ["🐶", "🐱", "🐭", "🐰", "🦊", "🐻", "🐼", "🐨", "🐯", "🦁", "🐮", "🐷", "🐸", "🐵", "🐔", "🦆", "🦉", "🦇", "🐝", "🐴"]

    var body: some View {
        VStack{
            Text("Memorize!")
                .font(.largeTitle)
            LazyVGrid(columns: columns, spacing:10){
                ForEach(theme[0..<theme.count], id: \.self){ element in
                    CardView(face: element).aspectRatio(2/3, contentMode: .fit)
                }
            }.padding(.horizontal)
        }.padding(.horizontal)
        HStack{
            SetFlagTheme(theme: $theme)
            SetFoodTheme(theme: $theme)
            SetFunTheme(theme: $theme)
            SetAnimalTheme(theme: $theme)
        }.padding(.horizontal)
    }
}

struct ThemeSelectionView: View{
    @Binding var card_count: Int
    let max_count: Int
    
    var body: some View{
        HStack{

        }
        .font(.title)
        .padding(.horizontal)
    }
}

struct CardView: View {
    @State var isFaceUp: Bool = false
    var face: String
    let shape = RoundedRectangle(cornerRadius: 20)
    
    var body: some View{
        ZStack{
            shape.fill(.blue)
            shape.strokeBorder(lineWidth: 3)
                
            if isFaceUp {
                Text(face)
                    .font(.title)
            } else {
                shape.fill(.red)
                shape.strokeBorder(lineWidth: 3)
            }
        }
        .onTapGesture{
            isFaceUp.toggle()
        }
    }
}

// THEME BUTTONS ---------------------------------------------------------

struct SetFlagTheme: View{
    let flags = ["🇾🇪", "🇦🇪", "🇹🇷", "🇹🇳", "🇹🇲", "🇸🇾", "🇸🇩", "🇸🇦", "🇸🇳", "🇵🇰", "🇳🇪", "🇳🇬", "🇲🇲", "🇲🇻", "🇲🇷", "🇯🇴", "🇰🇼", "🇱🇧", "🇮🇷", "🇮🇶"]
    @Binding var theme: [String]
    
    var body: some View{
        Button {
            theme = flags.shuffled()
        } label: {
            Image(systemName: "flag")
                .font(.largeTitle)
        }

    }
}

struct SetFoodTheme: View{
    let food = ["🍎", "🍐", "🍊", "🍋", "🫐", "🍓", "🍇", "🍉", "🍌", "🍒", "🥭", "🍍", "🥥", "🥒", "🫑", "🧅", "🧄", "🥕", "🌽", "🥦"]
    @Binding var theme: [String]
    
    var body: some View{
        Button {
            theme = food.shuffled()
        } label: {
            Image(systemName: "carrot")
                .font(.largeTitle)
        }

    }
}

struct SetFunTheme: View{
    let fun = ["⛸️", "🥊", "🥋", "🪁", "🏀", "⚽️", "🏈", "⚾️", "🎾", "🏐", "🥏", "⛳️", "🏹", "⛷️", "🪂", "🏂", "🧗‍♀️", "🚣🏾‍♀️", "🚴🏿‍♀️", "🎹"]
    @Binding var theme: [String]
    
    var body: some View{
        Button {
            theme = fun.shuffled()
        } label: {
            Image(systemName: "football")
                .font(.largeTitle)
        }

    }
}

struct SetAnimalTheme: View{
    let animals = ["🐶", "🐱", "🐭", "🐰", "🦊", "🐻", "🐼", "🐨", "🐯", "🦁", "🐮", "🐷", "🐸", "🐵", "🐔", "🦆", "🦉", "🦇", "🐝", "🐴"]
    @Binding var theme: [String]
    
    var body: some View{
        Button {
            theme = animals.shuffled()
        } label: {
            Image(systemName: "pawprint")
                .font(.largeTitle)
        }

    }
}
// THEME BUTTONS ---------------------------------------------------------

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
