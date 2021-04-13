//
//  ContentView.swift
//  H4X0R News
//
//  Created by Nadia Ahmadian on 2021-04-12.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManger()
    
    var body: some View {
        NavigationView{
            List(networkManager.posts){ post in
                NavigationLink(
                    destination: DetailView(url: post.url)){
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
                
                
            }
            .navigationBarTitle("H4X0R News")
        }
        .onAppear{
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
