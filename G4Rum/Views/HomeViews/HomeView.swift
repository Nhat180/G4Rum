//
//  HomeView.swift
//  G4Rum
//
//  Created by Thang, Ta Quoc on 06/09/2022.
//

import SwiftUI
import CoreLocation

struct HomeView: View {
    @StateObject private var gameViewModel = GameViewModel()
    @ObservedObject var authViewModel = AuthViewModel()
    @State private var search: String = ""
    var body: some View {
        
        NavigationView  {
            
            ZStack {
                Color(#colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.937254902, alpha: 1))
                    .ignoresSafeArea()
                
                ScrollView (showsIndicators: false) {
                    VStack(alignment: .leading) {
                        
                        TitleView()
                            .padding()

                        SearchBar(search: $search)
                        Spacer()
                        Text("Trending Game")
                            .font(.custom("PlayfairDisplay-Bold", size: 24))
                            .padding(.horizontal)
                            .foregroundColor(Color("Primary"))
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack (spacing:0) {
                                ForEach (gameViewModel.randomGames) {
                                    i in NavigationLink (
                                        destination: GameCardView(game: i), label: {
                                            VStack {
                                                
                                                AsyncImage(url: URL(string: i.imageUrl)) { image in
                                                            image
                                                                .resizable()
                                                                .frame(width: 210, height: 200 * (210/210))
                                                                .cornerRadius(20.0)
                                                        } placeholder: {
                                                            Color.gray
                                                        }
                                                
                                                Spacer()
                                                Text(i.name)
                                                    .font(.system(size: 16))
                                                    .bold()
                                                    .foregroundColor(Color("Primary"))
                                                Spacer()
                                                HStack (spacing: 5) {
                                                    Text("Rate: " + i.ratings + "/5")
                                                        .font(.system(size: 15))
                                                        .foregroundColor(Color(.black))
                                                    Spacer()
                                                    Text( "Genre: " + i.genre)
                                                        .font(.system(size: 15))
                                                        .foregroundColor(Color(.black))
                                                    
                                                }
                                            }
                                            .frame(width: 210, height: 250 * (210/210))
                                            .padding()
                                            .background(Color.white )
                                            .cornerRadius(20.0)
                                        })
                                    Spacer()

                                }
                            }
                        }
                        Spacer()
                        Text("Categories")
                            .font(.custom("PlayfairDisplay-Bold", size: 24))
                            .padding(.horizontal)
                            .foregroundColor(Color("Primary"))
                    }
                }
            }
            
        }
        .onAppear(){
            self.gameViewModel.getRandomGames()
        }
        
//        VStack {
//            NavigationView {
//                List(gameViewModel.randomGames) { game in
//                    VStack(alignment: .leading) {
//                        Text(game.id)
//                            .font(.headline)
//                        Text(game.name)
//                            .font(.subheadline)
//                    }
//                }
//                .navigationBarTitle("Game testing")
//                .onAppear() {
//                    self.gameViewModel.getRandomGames()
//                }
//            }
//            Button(action: {
//                print("Hello")
//                authViewModel.signOut()
//            }) {
//                Text("LOG OUT")
//                    .foregroundColor(.white)
//                    .fontWeight(.bold)
//                    .padding(.vertical)
//                    .padding(.horizontal, 55)
//                    .background(ColorConstants.darkRed)
//                    .clipShape(Capsule())
//                    // shadow...
//                    .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 5)
//            }
//        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct TitleView: View {
    var body: some View {
        Text("Find the \nBest ")
            .font(.custom(FontManager.Playfair.regular, size: 28))
            .foregroundColor(Color("Primary"))
            + Text("Game!")
            .font(.custom(FontManager.Playfair.bold, size: 28))
                .fontWeight(.bold)
                .foregroundColor(Color("Primary"))
    }
}

struct SearchBar: View {
    @Binding var search: String
    var body: some View {
        HStack {
            HStack {
                Image("Search")
                    .padding(.trailing, 8)
                TextField("Search Game", text: $search)
                    .foregroundColor(.black.opacity(0.8))
            }
            .padding(.all, 20)
            .background(Color.white)
            .cornerRadius(10.0)
            .padding(.trailing, 8)
            
            Button(action: {}) {
                Image("Scan")
                    .padding()
                    .background(Color("Primary"))
                    .cornerRadius(10.0)
            }
        }
        .padding(.horizontal)
    }
}

extension View{
    func getSafeArea()->UIEdgeInsets {
        guard let screen = UIApplication.shared.connectedScenes.first as?
                UIWindowScene else {
            return .zero
        }

        guard let safeArea = screen.windows.first?.safeAreaInsets
        else {
            return .zero
        }
        return safeArea
    }
}


