//
//  ContentView.swift
//  EcoDo
//
//  Created by YesVladess on 03.07.2022.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        TabView {
            MyTasks()
                .tabItem {
                    Label("MyTasks", systemImage: "list.bullet.rectangle.portrait.fill")
                }
            Planet()
                .tabItem {
                    Label("Planet", systemImage: "arrow.clockwise.heart.fill")
                }
            Wiki()
                .tabItem {
                    Label("Wiki", systemImage: "books.vertical.fill")
                }
            Settings()
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
