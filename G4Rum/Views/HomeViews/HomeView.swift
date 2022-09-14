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
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [
                    .black,
                    ColorConstants.darkRed
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
                
                ScrollView (showsIndicators: false) {
                    VStack(alignment: .leading) {
                        
                        Menu {
                            Button(action: {}, label: {
                                Text("Log Out")
                            })
                        } label: {
                            Label (
                                title: {},
                                icon: {
                                    Image(systemName: "person.circle")
                                        .resizable()
                                        .frame(width: 40, height: 40, alignment: .center)
                                        .foregroundColor(Color(.white))
                                }
                            )
                        }
                        
                        
                        
                        TitleView()
                            .padding()
                        
                        Divider()
                            .overlay(.white)
                            .padding()

                        Text("Trending Game")
                            //.font(.custom("PlayfairDisplay-Bold", size: width / 10))
                            .font(.system(size: width / 15))
                            .bold()
                            .padding(.horizontal)
                            .foregroundColor(.white)
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack (spacing:0) {
                                ForEach (gameViewModel.randomGames) {
                                    i in NavigationLink (
                                        destination: GameCardView(game: i), label: {
                                            VStack {
                                                AsyncImage(url: URL(string: i.imageUrl)) { image in
                                                            image
                                                                .resizable()
                                                                .frame(width: width / 2, height: width / 2)
                                                                .cornerRadius(20.0)
                                                        } placeholder: {
                                                            Color.gray
                                                        }
                                                
                                                Spacer()
                                                Text(i.name)
                                                    .font(.system(size: width / 25))
                                                    .bold()
                                                    .foregroundColor(Color("Primary"))
                                                Spacer()
                                                HStack (spacing: 5) {
                                                    Text("Rate: " + i.ratings + "/5")
                                                        .font(.system(size: width / 30))
                                                        .foregroundColor(Color(.white))
                                                    Spacer()
                                                    Text( "Genre: " + i.genre)
                                                        .font(.system(size: width / 30))
                                                        .foregroundColor(Color(.white))
                                                    
                                                }
                                            }
                                            .frame(width: width / 2, height: width / 5 * 3)
                                            .padding()
                                            .background(.clear)
                                            .cornerRadius(20.0)
                                        })
                                    Spacer()

                                }
                            }
                        }
                        Divider()
                            .overlay(.white)
                            .padding()
                        Text("Categories")
                            //.font(.custom("PlayfairDisplay-Bold", size: 24))
                            .font(.system(size: width / 15))
                            .bold()
                            .padding(.horizontal)
                            .foregroundColor(.white)
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            
                        }
                    }
                }
            }.onAppear(){
                self.gameViewModel.getRandomGames()
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
        .accentColor(Color(.white))
        .background(.clear)
        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct TitleView: View {
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    var body: some View {
        Text("Find the \nBest ")
            //.font(.custom(FontManager.Playfair.regular, size: width / 12))
            .font(.system(size: width / 12))
            .foregroundColor(.white)
            + Text("Game!")
            //.font(.custom(FontManager.Playfair.bold, size: width / 10))
            .font(.system(size: width / 10))
                .fontWeight(.bold)
                .foregroundColor(.white)
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


