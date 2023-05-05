//
//  ItemModelData.swift
//  FridGet
//
//  Created by Gaizka Valencia on 05/05/23.
//

import Foundation
import SwiftUI

class ViewModel2: ObservableObject {
    @Published var schedule: [Schedule] = []
    
    func loadSchedule() {
        guard let url = URL(string: "http://127.0.0.1:8000/api/schedule/") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {[weak
            self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let schedule = try JSONDecoder().decode([Schedule].self, from: data)
                DispatchQueue.main.async {
                    self?.schedule = schedule
                }
            }
            catch {
                print(error)
            }
        }
        
        
        task.resume()
    }
}

class ViewModel: ObservableObject {
    @Published var scheduleMember: [ScheduleMember] = []
    
    func loadSchedule() {
        guard let url = URL(string: "http://127.0.0.1:8000/api/schedulemember/") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {[weak
            self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let scheduleMember = try JSONDecoder().decode([ScheduleMember].self, from: data)
                DispatchQueue.main.async {
                    self?.scheduleMember = scheduleMember
                }
            }
            catch {
                print(error)
            }
        }
        
        
        task.resume()
    }
}

class ViewModelUser: ObservableObject {
    @Published var user: [User] = []
    
    func loadSchedule() {
        guard let url = URL(string: "http://127.0.0.1:8000/api/account/") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {[weak
            self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let user = try JSONDecoder().decode([User].self, from: data)
                DispatchQueue.main.async {
                    self?.user = user
                }
            }
            catch {
                print(error)
            }
        }
        
        
        task.resume()
    }
}

class GlobalString: ObservableObject {
  @Published var fullnamelogin = "Admin"
  @Published var emaillogin = "admin@gmail.com"
}
