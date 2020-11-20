//
//  MainView.swift
//  Mapiever
//
//  Created by Mete Alp Kizilcay on 15.11.2020.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        MapView()
            .edgesIgnoringSafeArea(.all)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
