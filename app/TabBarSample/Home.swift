//
//  Home.swift
//  TabBarSample
//
//  Created by Shinya Ema on 2021/08/19.
//

import SwiftUI

struct Home: View {
    @State var selectedTab = trips[0]
    
    init() {
        UIScrollView.appearance().bounces = false
    }
    var body: some View {
        
        ZStack{
            GeometryReader(content: { geometry in
                let frame = geometry.frame(in: .global)
                
                Image(selectedTab.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: frame.width, height: frame.height, alignment: .center)
                    .cornerRadius(0)
            }).ignoresSafeArea()
            
            VStack{
                Text("Let's go with")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("TabTrip")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .padding(.bottom, 18)
                
                VStack {
                    GeometryReader(content: { geometry in
                        
                        let frame = geometry.frame(in: .global)
                        
                        TabView(selection: $selectedTab,
                                content:  {
                                    ForEach(trips) { trip in
                                        Image(trip.image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: frame.width, height: frame.height, alignment: .center)
                                            .cornerRadius(6)
                                            .tag(trip)
                                        
                                        
                                    }
                                }).tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                        
                    }).frame( height: UIScreen.main.bounds.height / 2)

                    Text(selectedTab.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.bottom)
                    
                    PageControll(maxPages: trips.count, currentPage: getIndex())
                    
                }
                .padding(.top)
                .padding(.horizontal, 12)
                .padding(.bottom,6)
                .background(Color.white.clipShape(CustomShape()).cornerRadius(10))
                .padding(.horizontal, 18)
                
                Button(action: {}, label: {
                    Text("Get started.")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical, 18)
                        .frame( maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(12)
                })
                .padding(.top, 24)
                .padding(.horizontal, 24)
                .padding(.bottom, 6)
            }
            .padding()
        }
    }
    
    func getIndex() -> Int {
        let index = trips.firstIndex { Trip in
            return selectedTab.id == Trip.id
        } ?? 0
        
        return index
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
