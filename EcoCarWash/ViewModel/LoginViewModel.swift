//
//  LoginViewModel.swift
//  EcoCarWash
//
//  Created by Indium Software on 10/09/21.
//

import Foundation

protocol LoginDelegate {
    func loginSuccessfull(message: String)
    func loginFailed(message : String)
}

class LoginViewModel {
    
    var delegate: LoginDelegate!
    
    func loginUser(email: String, password: String) {

        LoginServiceHelper.requestFormData(router: SignupServiceManager.login(email: email, password: password), completion: { (result : Result<UserDetails, CustomError>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let data) :
                    
                    if let status = data.status, status == true {
                        UserManager.shared.currentUser = data.data
                        
                        UserDefaults.standard.set(data.data?.name, forKey: "USER_NAME")
                        UserDefaults.standard.set(data.data?.email, forKey: "USER_EMAIL")
                        UserDefaults.standard.set(data.data?.mobileNo, forKey: "USER_PHONE")
                        UserDefaults.standard.set(data.data?.profileImage, forKey: "PROFILE_URL_STRING")

                        self.delegate.loginSuccessfull(message: data.message ?? "")
                    } else {
                        self.delegate.loginFailed(message: data.message ?? "")
                    }

                case .failure(let error):
                    
                    self.delegate.loginFailed(message: "\(error)")
                }
            }
        })
    }
}
