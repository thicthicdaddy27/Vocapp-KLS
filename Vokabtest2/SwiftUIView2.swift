//
//  SwiftUIView2.swift
//  Vokabtest2
//
//  Created by Luca-Valentin Scheller on 28.02.22.
//

import SwiftUI

struct SwiftUIView2: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    func Form() {
       TextField("Eingabe", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
    }
    
    
}

struct SwiftUIView2_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView2()
    }
}
