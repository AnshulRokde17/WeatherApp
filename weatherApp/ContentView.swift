//
//  ContentView.swift
//  weatherApp
//
//  Created by Anshul Rokade on 22/07/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var cityVM = CityViewViewModel()
    var body: some View {
        ZStack(alignment: .bottom){
            VStack(spacing: 0){
                menuheaderView(cityVM: cityVM).padding()
                ScrollView(showsIndicators: false){
                    CityView(cityVM: cityVM)
                }.padding(.top, 10)
            }.padding(.top, 40)
        }.background(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.5),Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
