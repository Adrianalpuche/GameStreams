//
//  ContentView.swift
//  GameStream
//
//  Created by Adrián Alpuche on 14/03/23.
//

import SwiftUI

struct ContentView: View {
  
    var body: some View {
        NavigationView{
            ZStack{
                Color(red: 19/255, green: 30/255, blue: 53/255).ignoresSafeArea()
                VStack{
                    Image("appLogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250, height: 100, alignment: .center)
                    
                    //El.fit hace que se acomode la imagen a la pantalla de manera bonita y ajustada
                    
                    //Se acomoda con .frame la imagen en el centro
                    
                    LoginAndRegisterView()
                    
                }
                
            } .navigationBarHidden(true)
        }
        }
    }

  

  

struct LoginAndRegisterView: View{
    @State var typeLogin = false //La priemra vez que se inicie sesion va a mostrar por default el login
    var body: some View {
        VStack {
            HStack{
                Spacer()
                Button("INICIA SESIÓN"){
                    typeLogin = true
                    print("Pantalla de inicio de sesión")
                }.foregroundColor(typeLogin ? .white : .gray)
                Spacer()
                Button("REGISTRATE"){
                    typeLogin = false
                    print("Pantalla de registro")
                }.foregroundColor(typeLogin ? .gray : .white)
                Spacer()
            }

            Spacer()
            if typeLogin == true {
                LoginView()
            } else{
                RegisterView()
            }
        }
    }
}

  

struct LoginView: View {
    @State var email=""
    @State var password=""
    @State var show = true
    @State var isHomeScreenActive = false
    
    var body: some View {
        ScrollView{
            VStack {
                //Text("LoginView").foregroundColor(Color("dark-cian"))
                Text("Correo electronico").foregroundColor(Color("dark-cian"))
                ZStack(alignment: .leading){
                    if email.isEmpty{
                        Text(verbatim:"example@example.com").font(.caption).foregroundColor(.gray)
                    }
                    TextField("", text:$email)
                }
                
                Divider().frame(height: 1).background(Color("dark-cian")).padding(.bottom)
                
                Text("Contraseña").foregroundColor(.white)
                
                ZStack(alignment: .leading){
                    if password.isEmpty{
                        Text(verbatim: "Escribe tu contraseña").font(.caption).foregroundColor(.white)
                    }
                    if show{
                        TextField("", text:$password).foregroundColor(.white)
                    }
                    else{
                        SecureField("",text:$password).foregroundColor(.white)
                    }
                    HStack{
                        Spacer()
                    Button(action: {
                        show.toggle()
                    }) {
                        Image(systemName: self.show ? "eye" : "eye.slash").accentColor(.gray)}

                }
            }
                
                Divider().frame(height: 1).background(Color("dark-cian")).padding(.bottom)
                Text("¿Olvidaste tu contraseña?").font(.footnote).frame(width: 300,alignment: .trailing).foregroundColor(Color("dark-cian"))
                
                Button(action: login, label: {
                    Text("Iniciar Sesion").fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity,alignment: .center).padding(EdgeInsets(top:11,leading: 18,bottom: 11,trailing: 18)).overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color ("dark-cian"),lineWidth: 1.0).shadow(color: .white, radius: 6))
                }).navigationDestination(isPresented: $isHomeScreenActive, destination:{Home()})
                
            }
        }.padding(.horizontal, 77)
        
        NavigationLink(
        destination: Home(),
        isActive: $isHomeScreenActive,
        label: {
        EmptyView()
        })
    }
    func login(){
        isHomeScreenActive = true
    }
    
    
  
}

struct RegisterView: View {
    @State var email=""
    @State var password=""
    @State var confirm=""
    @State var show = true
    var body: some View {
        
        ScrollView{
            VStack {
                VStack{
                    Spacer()
                    Text("Elige una foto de perfil").fontWeight(.bold).foregroundColor(.white)
                    Text("Puedes cambiar o eligirla mas tarde").lineLimit(1)
                        .foregroundColor(.gray)
                    ZStack{
                        Spacer()
                        Image("foto-perfil").resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:300 ,height:100 )
                            .clipShape(Circle())
                        
                        Button(action: {}){Image(systemName: "camera")               .resizable().aspectRatio(contentMode: .fit)
                            .foregroundColor(.white)}.frame(width: 35,height: 35)
                    }
                    VStack(alignment: .leading){
                        Spacer()
                        Spacer()
                        Spacer()
                        Text("Correo electronico").foregroundColor(Color ("dark-cian"))
                        ZStack(alignment: .leading){
                            if email.isEmpty{
                                Text(verbatim:"ejemplo@gmail.com").font(.caption).foregroundColor(.gray)
                            }
                            TextField("", text:$email)
                        }
                        Divider().frame(height: 1).background(Color("dark-cian")).padding(.bottom)
                        Text("Contraseña").foregroundColor(.white)
                        
                        ZStack(alignment: .leading){
                            if password.isEmpty{
                                Text(verbatim: "Escribe una contraseña").font(.caption).foregroundColor(.white)
                            }
                            SecureField("", text:$password).foregroundColor(.white)
                        }
                        
                        Divider().frame(height: 1).background(.white).padding(.bottom)
                        
                        VStack(alignment: .leading){
                            Text("Confirmar contraseña").foregroundColor(.white)
                            
                            ZStack(alignment: .leading){
                                if confirm.isEmpty{
                                    Text(verbatim: "Escribe otra vez la contraseña ").font(.caption).foregroundColor(.white)
                                }
                                SecureField("", text:$confirm).foregroundColor(.white)
                            }
                            
                            Divider().frame(height: 1).background(.white).padding(.bottom)
                            Button(action: register, label: {
                                Text("Registrate").font(.system(size:23)).fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity,alignment: .center).padding(EdgeInsets(top:11,leading: 18,bottom: 11,trailing: 18)).overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color ("dark-cian"),lineWidth: 1.0).shadow(color: .white, radius: 6))
                            })
                        }
                    }.padding(.horizontal, 20)
                    Spacer()
                    Spacer()
                    Text("Registrate con redes sociales").foregroundColor(.white)
                    HStack{
                        Button {
                            
                        } label: {
                            Text("Facebook").foregroundColor(.white)
                                .frame(width: 75,alignment: .center).padding(EdgeInsets(top:10,leading: 18,bottom: 10,trailing: 18))
                        } .background(Color(red: 40/255, green: 55/255, blue: 88/255)).cornerRadius(9)
                        
                        Button{
                            
                        }label: {
                            Text("Twitter").foregroundColor(.white) .frame(width: 75,alignment: .center).padding(EdgeInsets(top:10,leading: 18,bottom: 10,trailing: 18))
                        }.background(Color(red: 40/255, green: 55/255, blue: 88/255)).cornerRadius(9)

                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {

    static var previews: some View {

        ContentView()

    }

}



func register(){
    print("Estoy registrandome")
}
