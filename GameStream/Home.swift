//
//  Home.swift
//  GameStream
//
//  Created by Adrián Alpuche on 18/04/23.
//

import SwiftUI
import AVKit


struct Home: View {
    @State var selectedTab:Int = 2
   
    var body: some View {
        
        
        TabView(selection: $selectedTab) {
        Text("ProfileScreen").font(.system(size: 30,weight: .bold, design: .rounded))
        
        .tabItem{

        Image(systemName: "person")

        Text("Perfil")

        }.tag(0)

        Text("GamesScreen").font(.system(size: 30,weight: .bold, design: .rounded))

        .tabItem{

        Image(systemName: "gamecontroller")

        Text("Juegos")

        }.tag(1)

           HomeScreen()
            
        .tabItem{

        Image(systemName: "house")

        Text("Inicio")

        }.tag(2)

        Text("FavoritesScreen").font(.system(size: 30,weight: .bold, design: .rounded))
        .tabItem{
        Image(systemName: "heart")
        Text("Favoritos")
        }.tag(3)
            
            
        }.accentColor(.white)
    }
    init(){

    UITabBar.appearance().backgroundColor = UIColor(Color("TabBar-Color"))

    UITabBar.appearance().isTranslucent = true

    UITabBar.appearance().unselectedItemTintColor = UIColor.gray

    }
}

struct HomeScreen:View {
    @State var searchText = ""
    var body: some View{
        ZStack {
            Color("Marine").ignoresSafeArea()
            VStack {
                Image("appLogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250).padding(.horizontal, 11.0)
                HStack{
                    Button(action: search, label: {
                        Image(systemName: "magnifyingglass").foregroundColor(searchText.isEmpty ? Color(.yellow) : Color("dark-cian"))
                    })
                    TextField(text: $searchText,
                    label: {
                    Text("Buscar un video").foregroundColor(.gray)
                    }).foregroundColor(.white)
                }.padding([.top,.leading,.bottom],11.0).background(Color("blue-gray")).clipShape(Capsule())
                ScrollView(showsIndicators: false){ SubModuleHome() }
            }.padding(.horizontal,18)
            
        }.navigationBarHidden(true).navigationBarBackButtonHidden(true)
        
    }
    func search () {
    print("El usuario está buscando \(searchText)")
    }
}


struct SubModuleHome:View {
    //URL default
    @State var url = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
    //To not activate the player by default
    @State var isPlayerActive = false
    //All videos that we want to show
    let urlVideos:[String] = ["https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256671638/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256720061/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256814567/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256705156/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256801252/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256757119/movie480.mp4"]
    var body: some View {
        VStack{
            Text("Los más populares").font(.title3).foregroundColor(.white).bold().frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).padding(.top)
            NavigationLink {
                VideoPlayer(player: AVPlayer(url: URL(string: url)!)).frame(width: 420, height: 360, alignment: .center)
            } label: {
                ZStack{
                    Button {
                        url = urlVideos[0]
                        print("URL: \(url)")
                        isPlayerActive = true
                    } label: {
                        VStack(spacing: 0){
                            Image("The Witcher 3")
                                .resizable()
                                .scaledToFill()
                            Text("The Witcher 3")
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color("blue-gray"))
                        }
                    }
                    Image(systemName: "play.circle.fill")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 42, height: 42)
                }.frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                    .padding(.vertical)
            }
        }.frame(minWidth: 0, maxWidth: .infinity, alignment: .center).padding(.vertical)
        Text("Categorías sugeridas para ti").font(.title3).foregroundColor(.white).bold().frame(minWidth: 0, maxWidth: .infinity,alignment: .leading)

        ScrollView(.horizontal,showsIndicators: false){
        HStack{
            
        Button(action: {}, label: {
        ZStack{
        RoundedRectangle(cornerRadius: 8)
        .fill(Color("blue-gray"))
        .frame(width: 160, height: 90)
        Image("FPS")
        .resizable()
        .scaledToFit()
        .frame(width: 42, height: 42)
        }
        })
            
        Button(action: {}, label: {
        ZStack{
        RoundedRectangle(cornerRadius: 8)
        .fill(Color("blue-gray"))
        .frame(width: 160, height: 90)
        Image("RPG").resizable().scaledToFit().frame(width: 42, height: 42)
        }
        })
            
        Button(action: {}, label: {
        ZStack{
        RoundedRectangle(cornerRadius: 8)
        .fill(Color("blue-gray"))
        .frame(width: 160, height: 90)
        Image("OpenWorld").resizable().scaledToFit().frame(width: 42, height: 42)
            }
        })
        }
        }

        //Carrusel

        Text("Recomendados para ti").font(.title3).foregroundColor(.white).bold().frame(minWidth: 0, maxWidth: .infinity,alignment: .leading)

        ScrollView(.horizontal, showsIndicators: false){

        HStack{
        NavigationLink {
        VideoPlayer(player: AVPlayer(url: URL(string: urlVideos[1])!)).frame(width: 420, height: 360, alignment: .center)

        } label: {

        Image("Abzu")
        .resizable()
        .scaledToFit()
        .frame(width: 240, height: 135)

        }
        NavigationLink {
        VideoPlayer(player: AVPlayer(url: URL(string: urlVideos[2])!)).frame(width: 420, height: 360, alignment: .center)
        } label: {
        Image("Crash bandicoot")
        .resizable()
        .scaledToFit()
        .frame(width: 240, height: 135)
        }

        NavigationLink {
        VideoPlayer(player: AVPlayer(url: URL(string: urlVideos[3])!)).frame(width: 420, height: 360, alignment: .center)
        } label: {
        Image("Death Stranding")
        .resizable()
        .scaledToFit()
        .frame(width: 240, height: 135)
        }
        }
        }

        //Carrusel

        Text("Videojuegos que podrían gustarte").font(.title3).foregroundColor(.white).bold().frame(minWidth: 0, maxWidth: .infinity,alignment: .leading)

        ScrollView(.horizontal, showsIndicators: false){

        HStack{
        NavigationLink {
        VideoPlayer(player: AVPlayer(url: URL(string: urlVideos[6])!)).frame(width: 420, height: 360, alignment: .center)
        } label: {
        Image("Grand Theft Auto V")
        .resizable()
        .scaledToFit()
        .frame(width: 240, height: 135)
        }

        NavigationLink {
        VideoPlayer(player: AVPlayer(url: URL(string: urlVideos[5])!)).frame(width: 420, height: 360, alignment: .center)
        } label: {
        Image("Hades")
        .resizable()
        .scaledToFit()
        .frame(width: 240, height: 135)
        }

        NavigationLink {
        VideoPlayer(player: AVPlayer(url: URL(string: urlVideos[4])!)).frame(width: 420, height: 360, alignment: .center)
        } label: {
        Image("Cuphead")
        .resizable()
        .scaledToFit()
        .frame(width: 240, height: 135)

        }

        }

        }
        
        NavigationLink(destination: VideoPlayer(player: AVPlayer(url: URL(string: url)!)), isActive: $isPlayerActive,
            label: {EmptyView()})
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

