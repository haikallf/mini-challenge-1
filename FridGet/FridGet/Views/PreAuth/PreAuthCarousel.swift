//
//  PreAuthCarousel.swift
//  FridGet
//
//  Created by Haikal Lazuardi on 29/04/23.
//

import SwiftUI

struct PreAuthCarousel: View {
    @State private var pageIndex = 1
    private let intros: [PreAuthIntro] = PreAuthIntro.all
    private let dotAppearance = UIPageControl.appearance()
    
    var body: some View {
        VStack {
            TabView(selection: $pageIndex) {
                ForEach(intros, id: \.id) { intro in
                    VStack {
                        PreAuthAdapter(text: intro.text, filename: intro.filename)
                        
                    }
                    .tag(intro.id)
                }
            }
            .animation(.easeInOut, value: pageIndex)
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .interactive))
            .onAppear {
                dotAppearance.currentPageIndicatorTintColor = UIColor(.gray)
                dotAppearance.pageIndicatorTintColor = UIColor(Color("grayBg"))
            }
            .frame(maxHeight: 480)
            .padding(.bottom, 10)
        }
    }
    
    func incrementPage() {
            pageIndex += 1
        }
        
    func goToFirst() {
        pageIndex = 1
    }
}

struct PreAuthCarousel_Previews: PreviewProvider {
    static var previews: some View {
        PreAuthCarousel()
    }
}
