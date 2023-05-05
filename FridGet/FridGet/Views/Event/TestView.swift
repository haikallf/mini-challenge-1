//
//  TestView.swift
//  FridGet
//
//  Created by Gaizka Valencia on 02/05/23.
//

import SwiftUI

class ViewModel1: ObservableObject {
    @Published var schedule: [Schedule] = []
    
    func loadSchedule() {
        guard let url = URL(string: "http://127.0.0.1:8000/api/schedule") else {
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
        
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//        request.addValue("application/json", forHTTPHeaderField: "Accept")
////        request.addValue("Basic YWRtaW46YWRtaW4='", forHTTPHeaderField: "Authorization")
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let data = data {
//                if let response = try?
//                    JSONDecoder().decode([Schedule].self, from: data) {
//                    DispatchQueue.main.async{
//                        self.schedule = response
//                    }
//                    return
//                }
//            }
//        }.resume()
        task.resume()
    }
}

struct TestView: View {
//    @State var schedule = [Schedule]()
    @StateObject var viewModel = ViewModel1()
    
    var body: some View {
//        ForEach(schedule, id:\.self) { item in
//            HStack{
//                Text(item.created_at)
//                Spacer()
//                Text(item.nama)
//            }
//        }.onAppear(perform: loadSchedule)
        NavigationView{
            List {
                ForEach(viewModel.schedule, id: \.self) { schedule in
                    HStack {
                        Text(schedule.nama)
                    }
                }
            }
        }
        .navigationTitle("Schedule")
        .onAppear {
            viewModel.loadSchedule()
        }
    }
    
//    func loadSchedule() {
//        guard let url = URL(string: "http://127.0.0.1:8000/api/schedule") else {
//            print("api is down")
//            return
//        }
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//        request.addValue("application/json", forHTTPHeaderField: "Accept")
////        request.addValue("Basic YWRtaW46YWRtaW4='", forHTTPHeaderField: "Authorization")
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let data = data {
//                if let response = try?
//                    JSONDecoder().decode([Schedule].self, from: data) {
//                    DispatchQueue.main.async{
//                        self.schedule = response
//                    }
//                    return
//                }
//            }
//        }.resume()
//    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
