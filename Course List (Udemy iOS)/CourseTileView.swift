//
//  CourseTileView.swift
//  Course List (Udemy iOS)
//
//  Created by Pedro Marques on 13/04/24.
//

import SwiftUI

struct CourseTileView: View {
    
    let course: Course
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: course.image)) { response in
                switch response {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                    
                default:
                    DefaultImageView()
                }
            }
            VStack {
                Spacer()
                HStack {
                    Text(course.title)
                        .padding(.vertical, 4)
                        .padding(.horizontal)
                        .foregroundStyle(.white)
                        .bold()
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .background {
                    Color.purple
                }
            }
        }
    }
}

#Preview {
    CourseTileView(course: Course(id: 1, image: "https://zappycode.com/media/course_images/CourseImageTake2NoBorder_A1jzclC.png", title: "iPhone Apps for Complete Begginers - Swift, SwiftUI & iOS17", subtitle: "You'll go from a complete begginer to having your own app in the App Store. Brand new (Filmed Fall 2023) using Xcode 15"))
        .frame(height: 200)
}
