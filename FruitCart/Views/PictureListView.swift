//
//  SecondTabView.swift
//  FruitCart
//
//  Created by Bhat, Rohit on 5/3/24.
//

import SwiftUI

struct PictureListView: View {
    var body: some View {
        NavigationView {
            Text("second tabview")
        }
        .navigationBarHidden(true)
    }
}

struct PictureListView_Previews: PreviewProvider {
    static var previews: some View {
        PictureListView()
    }
}
