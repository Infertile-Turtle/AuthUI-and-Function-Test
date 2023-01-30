//
//  ContentView.swift
//  UITestCode
//
//  Created by Matthew Nos on 1/25/23.
//

import SwiftUI
import CoreGraphics

struct ContentView: View {
    @EnvironmentObject var myClass: MyClass
    var body: some View {
        ZStack {
            Color("IPadBackground")
            if myClass.myCase == .none {
                SignUp()
                    .aspectRatio((3.00/2.00), contentMode: .fit)
                    .padding(100)
            } else if myClass.myCase == .isLoggedIn {
                Login()
            } else if myClass.myCase == .isRegister {
                Register()
            }
        }
        .ignoresSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static let myClass: MyClass = MyClass()
    static var previews: some View {
        ContentView()
            .environmentObject(myClass)
    }
}

//MARK: Sign Up View

struct SignUp: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    VStack {
                        Image("Icon")
                            .colorMultiply(colorScheme == .dark ? .white : .black)
                        Spacer()
                    }
                    .padding()
                    Spacer()
                }
                VStack {
                    VStack {
                        Spacer()
                        // Logo stack
                        HStack {
                            Text("Welcome to FormPlan!")
                                .font(.system(size: 50, weight: .bold))
                                .scaledToFill()
                                .minimumScaleFactor(0.01)
                        }
                        VStack {
                            MyButton(color: Color("ButtonGreen"), textAnimate: "Insert Animation Here", myActions: .none)
                            Spacer()
                        }
                       
                        VStack {
                           MyButton(color: Color("ButtonPurple"), textButton: "Register", myActions: .register)
                            MyButton(color: Color("ButtonGrey"), textButton: "Login", myActions: .login)
                        }
                        .padding([.top], 50)
                    }
                    .padding([.horizontal], 150)
                    .padding([.top], 50)
//                    .clipped()
                    
                    // Disclaimer text
                    VStack(alignment: .leading) {
                        HStack {
                            Text("By Continuing you agree to the [User agreement and the company's privacy policy](https://www.cloudingenuity.com/cloud-ingenuity-privacy-page).")
                            Spacer()
                        }.font(.system(size: 16, weight: .light))
//                            .border(Color.blue, width: 2.0)
                    }
                    .padding()
                }
            }
            
        }
        .clipped()
        .background(RoundedRectangle(cornerRadius: 24).fill(Color("WindowBackground")))
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(Color("BorderColor"), lineWidth: 2.0)
        )
    }
}

//MARK: Register View

struct Register: View {
    @EnvironmentObject var myClass: MyClass
    var body: some View {
        VStack(alignment: .center) {
            MyTextField(fieldName: "Username", fieldValue: $myClass.username)
            Button(action:{
                myClass.myCase = .none
            }){
                Text("Reset")
            }
        }
    }
}

//MARK: Login View

struct Login: View {
    @EnvironmentObject var myClass: MyClass
    var body: some View {
        VStack {
            Text("Welcome to FormPlan!")
                .foregroundColor(.white)
            Button(action:{
                myClass.myCase = .none
            }) {
                Text("Reset")
            }
        }
    }
}

//MARK: Buttons

struct MyButton: View {
    @EnvironmentObject var myClass: MyClass
    @State var color: Color
    @State var textAnimate: String = ""
    @State var textButton: String = ""
    @State var myActions: MyActions = .none
    var body: some View {
        ZStack {
            Text(textAnimate).foregroundColor(.white).italic()
                .font(.system(size: 24, weight: .bold))
            Text(textButton).foregroundColor(.white)
                .font(.system(size: 24, weight: .bold))
        }
        .frame(maxWidth: .infinity, maxHeight: (myActions == .none) ? 250 : 100)
//        .padding()
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(color)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color("BorderColor"), lineWidth: 2.0)
                )
        )
        .onTapGesture {
            switch myActions {
            case .register:
                myClass.myCase = .isRegister
                print("🟢 Register Action")
            case .login:
                myClass.myCase = .isLoggedIn
                print("🔵 Login Action")
            case .none:
                print("🛑 No Action")
            }
        }
    }
}


//MARK: Text Fields

struct MyTextField: View {
    @State var myActions: MyActions = .none
    @State var fieldName: String
    @Binding var fieldValue: String
    var body: some View {
        VStack {
            TextField(fieldName, text: $fieldValue)
        }.foregroundColor(Color("FieldTextColor"))
            .font(.system(size: 16, weight: .medium))
    }
}



//MARK: Enums and Classes


class MyClass: ObservableObject {
    @Published var myCase: MyCases = .none
    @Published var userInfo: UserInfo = .none
    @Published var username: String = ""
    @Published var email: String = ""
    @Published var phoneNumber: String = ""
    @Published var password: String = ""
}

public enum MyCases {
    case isRegister
    case isLoggedIn
    case none
}

public enum MyActions {
    case register
    case login
    case none
}

public enum UserInfo: String {
    case username
    case email
    case phoneNumber
    case password
    case none
}
