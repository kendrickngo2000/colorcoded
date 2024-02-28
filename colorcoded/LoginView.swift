//
//  LoginView.swift
//  colorcoded
//
//  Created by Kendrick Ngo on 2/23/24.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""   // does this have to be private var?
    @State var password = ""
    var body: some View {
        ZStack {
            Color.black
            
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .foregroundStyle(.linearGradient(colors: [.purple, .blue], startPoint:
                        .topLeading, endPoint: .bottomLeading))
                .frame(width: 1000, height: 1000)
//                .rotationEffect(.degrees(-150))
            
            // colorcoded main logo/text
            VStack(spacing: 20) {
                Text("colorcoded.")
                    .foregroundColor(.white)
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .offset(x: -65, y: -150)
                // enter email field
                TextField("Email", text: $email)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: email.isEmpty) {
                        Text("Email")
                            .foregroundStyle(.white)
                            .bold()
                    }
                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundColor(.white)
                // password field
                SecureField("Password", text: $password)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: password.isEmpty) {
                        Text("Password")
                            .foregroundStyle(.white)
                            .bold()
                    }
                Rectangle()
                    .frame(width: 350, height: 1)
                // sign up button
                Button {
                } label: {
                    Text("Sign up")
                        .bold()
                        .frame(width: 200, height: 40)
                        .background(RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(.linearGradient(colors: [.purple, .blue], startPoint: .top, endPoint: .bottomTrailing))
                        )
                        .foregroundColor(.white)
                        .offset()
                }
                // button spacing
                .padding(.top)
                .offset(y: 100)
                // sign up button
                Button {
                } label: {
                    Text("Already have an account? Login")
                        .bold()
                        .foregroundColor(.white)
                }
                .padding(.top)
                .offset(y:100)
            }
            .frame(width: 350)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    LoginView()
}

extension View {
    func placeholder<Content: View>( when shouldShow: Bool, 
                                     alignment: Alignment = .leading, @ViewBuilder placeholder: () -> Content) -> some View {
        
        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}

