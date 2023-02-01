//
//  ContentView.swift
//  UITestCode
//
//  Created by Andrew Fairchild on 1/25/23.
//

import SwiftUI
import LocalAuthentication
//import CoreGraphics

struct ContentView: View {
    @EnvironmentObject var myClass: MyClass
    var body: some View {
        ZStack {
            Color("IPadBackground")
            switch myClass.myCase {
            case .none:
                SignUp()
                    .aspectRatio((3.00/2.00), contentMode: .fit)
                    .padding(100)
            case .isLoggedIn:
                Login()
                    .aspectRatio((3.00/2.00), contentMode: .fit)
                    .padding(100)
            case .isRegister:
                Register()
                    .aspectRatio((3.00/2.00), contentMode: .fit)
                    .padding(100)
            case .isVerify:
                Verify()
                    .aspectRatio((3.00/2.00), contentMode: .fit)
                    .padding(100)
            case .isVerifyApproval:
                VerifyApproval()
                    .aspectRatio((3.00/2.00), contentMode: .fit)
                    .padding(100)
            case .isMFA:
                MFA()
                    .aspectRatio((3.00/2.00), contentMode: .fit)
                    .padding(100)
            case .isMFAApproval:
                MFAApproval()
                    .aspectRatio((3.00/2.00), contentMode: .fit)
                    .padding(100)
            case .isFaceId:
                FaceID()
                    .aspectRatio((3.00/2.00), contentMode: .fit)
                    .padding(100)
            case .isSignup:
                SignUp()
                    .aspectRatio((3.00/2.00), contentMode: .fit)
                    .padding(100)
            case .onApp:
                OnApp()
                    .aspectRatio((3.00/2.00), contentMode: .fit)
                    .padding(100)
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

//MARK: On App Screen

struct OnApp: View {
        @EnvironmentObject var myClass: MyClass
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
                            Spacer(minLength: 250)
                            HStack {
                                Text("You made it to the APP!!!")
                                    .font(.system(size: 60, weight: .bold))
                                    .scaledToFill()
                                    .minimumScaleFactor(0.01)
                            }
                            .padding([.bottom], 50)
                        }
                        Spacer()
                        .padding([.horizontal], 150)
                        .padding([.bottom], 50)
                        VStack(alignment: .leading) {
                            HStack {
                                Button(action:{
                                    myClass.myCase = .none
                                }){
                                    Text("Forgot Password")
                                }
                                Spacer()
                            }.font(.system(size: 16, weight: .light))
                        }
                        .padding()
                    }
                }
            }
            .background(RoundedRectangle(cornerRadius: 24).fill(Color("WindowBackground")))
            .overlay(
                RoundedRectangle(cornerRadius: 24)
                    .stroke(Color("BorderColor"), lineWidth: 2.0)
            )
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
                    VStack(alignment: .leading) {
                        HStack {
                            Text("By Continuing you agree to the [User agreement and the company's privacy policy](https://www.cloudingenuity.com/cloud-ingenuity-privacy-page).")
                            Spacer()
                        }.font(.system(size: 16, weight: .light))
                    }
                    .padding()
                    .foregroundColor(Color(.white))
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

//MARK: Login View

struct Login: View {
    @EnvironmentObject var myClass: MyClass
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
                        HStack {
                            Text("Sign In")
                                .font(.system(size: 50, weight: .bold))
                                .scaledToFill()
                                .minimumScaleFactor(0.01)
                        }
                        .padding([.bottom], 50)
                        VStack(alignment: .center) {
                            MyTextField(myActions: .none, fieldName: "Username", fieldValue: $myClass.username)
                            MyTextField(myActions: .none, fieldName: "Password", fieldValue: $myClass.password)
                        }
                        VStack {
                            HStack {
                                Spacer()
                                //TODO: 🟢 Add Forgot Password Workflow in place of below
                                Button(action:{
                                    myClass.myCase = .none
                                }){
                                    Text("Forgot Password")
                                }
                            }
                        }
                        VStack {
                            HStack {
                                MyButton(color: Color("ButtonPurple"), textButton: "Log In", myActions: .MFA)
                                
                                
                                MyCircle(myActions: .faceid)
                                    .padding(.leading, 25)
                            }
                        }
                        .padding([.top], 50)
                    }
                    .padding([.horizontal], 150)
                    .padding([.top], 50)
                    .padding([.bottom], 50)
                    VStack(alignment: .leading) {
                        HStack {
                            Text("By Continuing you agree to the [User agreement and the company's privacy policy](https://www.cloudingenuity.com/cloud-ingenuity-privacy-page).")
                            Spacer()
                        }.font(.system(size: 16, weight: .light))
                    }
                    .padding()
                }
            }
        }
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
                        HStack {
                            Text("Register and Verification")
                                .font(.system(size: 50, weight: .bold))
                                .scaledToFill()
                                .minimumScaleFactor(0.01)
                        }
                        .padding([.bottom], 50)
                        VStack(alignment: .center) {
                            MyTextField(myActions: .none, fieldName: "Username", fieldValue: $myClass.username)
                            MyTextField(myActions: .none, fieldName: "Email", fieldValue: $myClass.email)
                            MyTextField(myActions: .none, fieldName: "Phone Number", fieldValue: $myClass.phoneNumber)
                            MyTextField(myActions: .none, fieldName: "Password", fieldValue: $myClass.password)
                        }
                        VStack {
                            HStack {
                                Spacer()
                                //TODO: 🟢 Add Forgot Password Workflow in place of below
                                Button(action:{
                                    myClass.myCase = .none
                                }){
                                    Text("Forgot Password")
                                }
                            }
                        }
                        VStack {
                            HStack {
                                MyButton(color: Color("ButtonPurple"), textButton: "Send Verification Code to Email", myActions: .verify)
                            }
                        }
                        .padding([.top], 50)
                    }
                    .padding([.horizontal], 150)
                    .padding([.top], 50)
                    .padding([.bottom], 50)
                    VStack(alignment: .leading) {
                        HStack {
                            Text("By Continuing you agree to the [User agreement and the company's privacy policy](https://www.cloudingenuity.com/cloud-ingenuity-privacy-page).")
                            Spacer()
                        }.font(.system(size: 16, weight: .light))
                    }
                    .padding()
                }
            }
        }
        .background(RoundedRectangle(cornerRadius: 24).fill(Color("WindowBackground")))
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(Color("BorderColor"), lineWidth: 2.0)
        )
        }
    }

//MARK: Verify

struct Verify: View {
    @EnvironmentObject var myClass: MyClass
    @Environment(\.colorScheme) var colorScheme
    
    //TODO: 🟢 Put Amplify workflow here
    
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
                        HStack {
                            Text("Enter Verification Code")
                                .font(.system(size: 50, weight: .bold))
                                .scaledToFill()
                                .minimumScaleFactor(0.01)
                        }
                        .padding([.bottom], 50)
                        VStack(alignment: .center) {
                            MyTextField(myActions: .none, fieldName: "Username", fieldValue: $myClass.username)
                            MyTextField(myActions: .none, fieldName: "Verification Code", fieldValue: $myClass.verification)
                        }
                        VStack {
                            HStack {
                                Spacer()
                                Button(action:{
                                    //TODO: 🟢 Put Amplify workflow here
                                    myClass.myCase = .none
                                }){
                                    Text("Resend Verification Code")
                                }
                            }
                        }
                        VStack {
                            HStack {
                                MyButton(color: Color("ButtonPurple"), textButton: "Enter Code", myActions: .verifyapproved)
                            }
                        }
                        .padding([.top], 50)
                    }
                    .padding([.horizontal], 150)
                    .padding([.top], 50)
                    .padding([.bottom], 50)
                    VStack(alignment: .leading) {
                        HStack {
                            Text("By Continuing you agree to the [User agreement and the company's privacy policy](https://www.cloudingenuity.com/cloud-ingenuity-privacy-page).")
                            Spacer()
                        }.font(.system(size: 16, weight: .light))
                    }
                    .padding()
                }
            }
        }
        .background(RoundedRectangle(cornerRadius: 24).fill(Color("WindowBackground")))
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(Color("BorderColor"), lineWidth: 2.0)
        )
        }
    }

//MARK: VerifyApproval

struct VerifyApproval: View {
    @EnvironmentObject var myClass: MyClass
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
                        Spacer(minLength: 250)
                        HStack {
                            Text("Your Verification code was Accepted!")
                                .font(.system(size: 60, weight: .bold))
                                .scaledToFill()
                                .minimumScaleFactor(0.01)
                        }
                        .padding([.bottom], 50)
                        VStack {
                            Image("CheckMark")
                                .colorMultiply(Color("CheckMarkColor"))
                        }
                    }
                    Spacer()
                    .padding([.horizontal], 150)
                    .padding([.bottom], 50)
                    VStack(alignment: .leading) {
                        HStack {
                            Text("By Continuing you agree to the [User agreement and the company's privacy policy](https://www.cloudingenuity.com/cloud-ingenuity-privacy-page).")
                            Spacer()
                        }.font(.system(size: 16, weight: .light))
                    }
                    .padding()
                }
            }
        }
        .background(RoundedRectangle(cornerRadius: 24).fill(Color("WindowBackground")))
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(Color("BorderColor"), lineWidth: 2.0)
        )
        }
    }

//MARK: MFA

struct MFA: View {
    @EnvironmentObject var myClass: MyClass
    @Environment(\.colorScheme) var colorScheme
    
    //TODO: 🟢 Put Amplify workflow here
    
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
                        VStack {
                            Text("Please Enter Multi-Factor")
                            Text("Authentication Code")
                        }
                                .font(.system(size: 50, weight: .bold))
                                .minimumScaleFactor(0.01)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                        .padding([.bottom], 50)
                        VStack {
                            MyTextField(myActions: .none, fieldName: "MFA Code", fieldValue: $myClass.mfa)
                        }
                        VStack {
                            HStack {
                                Spacer()
                                Button(action:{
                                    //TODO: 🟢 Put Amplify workflow here
                                    myClass.myCase = .none
                                }){
                                    Text("Resend MFA Code")
                                }
                            }
                        }
                        VStack {
                            HStack {
                                MyButton(color: Color("ButtonPurple"), textButton: "Submit", myActions: .verifyapproved)
                            }
                        }
                        .padding([.top], 50)
                    }
                    .padding([.horizontal], 150)
                    .padding([.top], 50)
                    .padding([.bottom], 50)
                    VStack(alignment: .leading) {
                        HStack {
                            Text("By Continuing you agree to the [User agreement and the company's privacy policy](https://www.cloudingenuity.com/cloud-ingenuity-privacy-page).")
                            Spacer()
                        }.font(.system(size: 16, weight: .light))
                    }
                    .padding()
                }
            }
        }
        .background(RoundedRectangle(cornerRadius: 24).fill(Color("WindowBackground")))
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(Color("BorderColor"), lineWidth: 2.0)
        )
        }
    }

//MARK: MFAApproval

struct MFAApproval: View {
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
                        HStack {
                            Text("Your Code was Accepted!")
                                .font(.system(size: 50, weight: .bold))
                                .scaledToFill()
                                .minimumScaleFactor(0.01)
                        }
                        VStack {
                            MyButton(color: Color("ButtonGreen"), textAnimate: "Insert Animation Here", myActions: .MFAapproval)
                            Spacer()
                        }
                        .padding([.top], 50)
                    }
                    .padding([.horizontal], 150)
                    .padding([.top], 50)
                    VStack(alignment: .leading) {
                        HStack {
                            Text("By Continuing you agree to the [User agreement and the company's privacy policy](https://www.cloudingenuity.com/cloud-ingenuity-privacy-page).")
                            Spacer()
                        }.font(.system(size: 16, weight: .light))
                    }
                    .padding()
                    .foregroundColor(Color(.white))
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

//MARK: FaceID

struct FaceID: View {
    @EnvironmentObject var myClass: MyClass
    var body: some View {
        Button(action:{
            myClass.myCase = .none
        }){
            Text("Reset")
        }
    }
}

//MARK: Buttons
struct test {
    //Take up space for navigator view
}

//MARK: Rectangular

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
        .frame(maxWidth: .infinity, maxHeight: {
            if myActions == .none {
                return 250
            } else if myActions == .MFAapproval {
                return 400
            } else {
                return 100
            }
        }())
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
            case .signup:
                myClass.myCase = .isSignup
                print("Signup Action")
            case .register:
                myClass.myCase = .isRegister
                print("🟢 Register Action")
            case .verify:
                myClass.myCase = .isVerify
                print("Verify Action")
            case .verifyapproved:
                myClass.myCase = .isVerifyApproval
                print("Verify Approved Action")
            case .login:
                myClass.myCase = .isLoggedIn
                print("🔵 Login Action")
            case .MFA:
                myClass.myCase = .isMFA
                print("MFA Action")
            case .MFAapproval:
                myClass.myCase = .isMFAApproval
                print("MFA Approval Action")
            case .faceid:
                myClass.myCase = .isFaceId
                print("👻 FaceID Action")
            case .none:
                myClass.myCase = .none
                print("🛑 No Action")
            }
        }
    }
}

//MARK: Circle

struct MyCircle: View {
    @EnvironmentObject var myClass: MyClass
    @Environment(\.colorScheme) var colorScheme
    @State var myActions: MyActions = .none
    var body: some View {
        ZStack (alignment: .center){
            Image("FaceID")
        }
        .frame(maxWidth: 100, maxHeight: 100)
        .foregroundColor(Color("ButtonPurple"))
        .font(.system(size: 24, weight: .bold))
            .background(
                Circle()
                    .fill(Color("ButtonPurple"))
                    .overlay(
                        Circle()
                            .stroke(Color("BorderColor"), lineWidth: 2.0)
                    )
            )
            .onTapGesture {
                switch myActions {
                case .signup:
                    myClass.myCase = .isSignup
                    print("Signup Action")
                case .register:
                    myClass.myCase = .isRegister
                    print("🟢 Register Action")
                case .verify:
                    myClass.myCase = .isVerify
                    print("Verify Action")
                case .verifyapproved:
                    myClass.myCase = .isVerifyApproval
                    print("Verify Approved Action")
                case .login:
                    myClass.myCase = .isLoggedIn
                    print("🔵 Login Action")
                case .MFA:
                    myClass.myCase = .isMFA
                    print("MFA Action")
                case .MFAapproval:
                    myClass.myCase = .isMFAApproval
                    print("MFA Approval Action")
                case .faceid:
                    authenticate()
                    print("👻 FaceID Action")
                case .none:
                    myClass.myCase = .none
                    print("🛑 No Action")
                }
            }
    }
    
    
   func authenticate() {
        let context = LAContext()
        var error: NSError?

        // check whether biometric authentication is possible
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // it's possible, so go ahead and use it
            let reason = "We need to unlock your data."

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                // authentication has now completed
                if success {
                    // authenticated successfully
                    DispatchQueue.main.async {
                        myClass.myCase = .onApp
                    }
                    print("Authentication Successful!")
                } else {
                    // there was a problem
                    print("There was an error: \(String(describing: error))")
                }
            }
        } else {
            // no biometrics
            print("No Biometrics.")
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
        }
        .frame(maxWidth: .infinity, maxHeight: 100)
        .foregroundColor(Color("FieldTextColor"))
        .font(.system(size: 24, weight: .bold))
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color("ButtonGrey"))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color("BorderColor"), lineWidth: 2.0)
                    )
            )
    }
}


//MARK: Enums and Classes


class MyClass: ObservableObject {
    @Published var myCase: MyCases = .none
    @Published var username: String = ""
    @Published var email: String = ""
    @Published var phoneNumber: String = ""
    @Published var password: String = ""
    @Published var verification: String = ""
    @Published var mfa: String = ""
}

public enum MyCases {
    case isSignup
    case isRegister
    case isVerify
    case isVerifyApproval
    case isLoggedIn
    case isMFA
    case isMFAApproval
    case isFaceId
    case onApp
    case none
}

public enum MyActions {
    case signup
    case register
    case verify
    case verifyapproved
    case login
    case MFA
    case MFAapproval
    case faceid
    case none
}

