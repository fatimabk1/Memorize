//
//  ContentView.swift
//  Memorize
//
//  Created by Fatima Kahbi on 8/3/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            GameView(theme: .flag).tabItem { Image(systemName: "flag") }.tag(1)
                .toolbar(.visible, for: .tabBar)
                .toolbarBackground(Color.cyan, for: .tabBar)
            GameView(theme: .food).tabItem { Image(systemName: "carrot") }.tag(2)
            GameView(theme: .fun).tabItem { Image(systemName: "football") }.tag(3)
            GameView(theme: .animal).tabItem { Image(systemName: "pawprint") }.tag(4)
        }
    }
}

struct GameView: View{
    let columns = [GridItem(.adaptive(minimum: 65))]
    let theme: GameType
    
    var body: some View{
        var themeValues = getTheme(game: theme)
        VStack{
            Text("Memorize!")
                .font(.largeTitle)
            LazyVGrid(columns: columns, spacing:10){
                ForEach(themeValues[0..<themeValues.count], id: \.self){ element in
                    CardView(face: element).aspectRatio(2/3, contentMode: .fit)
                }
            }.padding(.horizontal)
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

enum GameType{
    case flag,food,fun,animal
}

func getTheme(game: GameType) -> [String] {
    switch(game){
        case .animal:
           return ["🐶", "🐱", "🐭", "🐰", "🦊", "🐻", "🐼", "🐨", "🐯", "🦁", "🐮", "🐷", "🐸", "🐵", "🐔", "🦆", "🦉", "🦇", "🐝", "🐴"]
        case .flag:
            return ["🇾🇪", "🇦🇪", "🇹🇷", "🇹🇳", "🇹🇲", "🇸🇾", "🇸🇩", "🇸🇦", "🇸🇳", "🇵🇰", "🇳🇪", "🇳🇬", "🇲🇲", "🇲🇻", "🇲🇷", "🇯🇴", "🇰🇼", "🇱🇧", "🇮🇷", "🇮🇶"]
        case .food:
            return ["🍎", "🍐", "🍊", "🍋", "🫐", "🍓", "🍇", "🍉", "🍌", "🍒", "🥭", "🍍", "🥥", "🥒", "🫑", "🧅", "🧄", "🥕", "🌽", "🥦"]
        case .fun:
            return ["⛸️", "🥊", "🥋", "🪁", "🏀", "⚽️", "🏈", "⚾️", "🎾", "🏐", "🥏", "⛳️", "🏹", "⛷️", "🪂", "🏂", "🧗‍♀️", "🚣🏾‍♀️", "🚴🏿‍♀️", "🎹"]
    }
}
    
   
// THEME BUTTONS ---------------------------------------------------------

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
