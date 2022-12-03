//
//  UserView.swift
//  Mooi
//
//  Created by  Mr.Ki on 03.12.2022.
//

import SwiftUI

struct UserView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button {
                   
                    dismiss()
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 30))
                        .foregroundColor(Color("light"))
                }
                .padding()
                Spacer()
            }
            Spacer()
        }
        
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
