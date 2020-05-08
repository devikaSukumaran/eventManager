//
//  ContentView.swift
//  Organiser
//
//  Created by Devika Sukumaran on 08/05/20.
//  Copyright © 2020 Devika Sukumaran. All rights reserved.
//

import SwiftUI

import InvitationManager

struct ContentView: View {
    init() {
        InvitationManagerService.getGuestList()
    }
    var body: some View {
        Text("Hello, World!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
