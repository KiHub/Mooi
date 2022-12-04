//
//  UserView.swift
//  Mooi
//
//  Created by  Mr.Ki on 03.12.2022.
//

import SwiftUI

struct UserView: View {
    @ObservedObject var global = Global()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button {
                    
                    dismiss()
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 30))
                        .foregroundColor(Color("dark"))
                }
                .padding()
                Spacer()
            }
            Text("\(global.userName), here you can find your achievements")
                .padding()
                .foregroundColor(Color("dark"))
            
            CalendarView()
            Spacer()
            
        }
        .background(Color("light"))
        
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
