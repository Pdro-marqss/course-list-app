//
//  ContentView.swift
//  Course List (Udemy iOS)
//
//  Created by Pedro Marques on 12/04/24.
//

import SwiftUI

struct CourseListView: View {
    
    @State var courses: [Course] = []
    
    var body: some View {
        if courses.count == 0 {
            VStack {
                Text("Loading courses")
                ProgressView()
            }
            .foregroundStyle(.purple)
            .bold()
            .onAppear { getCourses() }
        } else {
            ScrollView {
                VStack {
                    ForEach(courses) { course in
                        AsyncImage(url: URL(string: course.image)) { response in
                            switch response {
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFill()
                                
                            default:
                                Text("It didn't work")
                            }
                        }
                    }
                }
            }
        }
    }
    
    func getCourses() {
        //Deixa de usar Optionals e somente executa o código se apiURL for de fato uma URL e nao URL ou Nill
        if let apiUrl = URL(string: "https://zappycode.com/api/courses?format=json") {
            
            var request = URLRequest(url: apiUrl)
            
            request.httpMethod = "GET"
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let courseData = data {
                    //                    print(String(data: courseData, encoding: .utf8) ?? "Request error")
                    
                    if let coursesFromAPI = try? JSONDecoder().decode([Course].self, from: courseData) {
                        courses = coursesFromAPI
                    }
                }
            }.resume()
        }
        
    }
    
}

#Preview {
    CourseListView()
}
