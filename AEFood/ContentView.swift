//
//  ContentView.swift
//  AEFood
//
//  Created by Linda Rocha on 02/01/23.
//

import SwiftUI

struct ContentView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showingLoggingScreen = false
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.blue.ignoresSafeArea()
                Circulo(escala: 1.7, cor: .white.opacity(0.15))
                Circulo(escala: 1.35, cor: .white)
                
                VStack{
                    Text("AEFood")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    TextField("Usuário", text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width:  CGFloat(wrongUsername))
                    
                    SecureField("Senha", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongPassword))
                    
                    Button("Entrar"){
                        // autenticação
                        autenticaUsuario(usuario: username, senha: password)
                    }
                        .foregroundColor(.white)
                        .frame(width:300, height: 50)
                        .background(.blue)
                        .cornerRadius(10)
                    
                    NavigationLink(destination: Text("Bem vindo @\(username)"), isActive: $showingLoggingScreen){
                        EmptyView()
                    }
                    
                }
                
            }
            .navigationBarHidden(true)
        }
    }
    
    func autenticaUsuario(usuario: String, senha: String){
        if(usuario.lowercased() == "teste"){
            wrongUsername = 0;
            if(senha.lowercased() == "teste"){
                wrongPassword = 0
                showingLoggingScreen = true
            }else{
                wrongPassword = 2
            }
        }else{
            wrongUsername = 2
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Circulo: View {
    var escala: CGFloat
    var cor: Color
    var body: some View {
        Circle()
            .scale(escala)
            .foregroundColor(cor)
    }
}
