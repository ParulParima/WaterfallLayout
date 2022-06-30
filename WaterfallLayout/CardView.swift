//
//  CardView.swift
//  WaterfallLayout
//
//  Created by Parul Parima on 20/06/22.
//

import SwiftUI

struct CardView: View {
    let item: MenuItem
    
    var body: some View {
        VStack {
            Image(item.mainImage)
                .resizable()
                .scaledToFit()
            Text(item.description)
                .font(.system(size: 12, weight: .regular))
                .foregroundColor(Color.black)
                .multilineTextAlignment(.center)
                .padding(.bottom, 10)
        }
        .background(Color.white)
        .frame(width: (UIScreen.main.bounds.width-40)/2)
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(.black, lineWidth:1)
        )
    }
}


//
//  ContentView.swift
//  WaterfallLayout
//
//  Created by Parul Parima on 20/06/22.

//import SwiftUI
//import Grid
//
//struct ContentView: View {
//    let menu = Bundle.main.decode(MenuSection.self, from: "menu.json")
//    let width = (UIScreen.main.bounds.width-40)/2
//    private let creationDate: Date
//
//    init() {
//        creationDate = Date()
//    }
//
//    var body: some View {
//        VStack {
//            Text("Choose your Dish")
//                .font(.system(size: 20, weight: .bold))
//            ScrollView(showsIndicators: false) {
//                Grid(0..<menu.items.count) { item in
//                    CardView(item: menu.items[item])
//                                    }
//                                    .gridStyle(
//                                        StaggeredGridStyle(.vertical, tracks: 2, spacing: 10)
//                                    )
//                    Grid(menu.items, id:\.self) { item in
//                        CardView(item: item)
//                    }
//                    .gridStyle(
//                        StaggeredGridStyle(.vertical, tracks: 2, spacing: 10)
//                    )
//                    Grid(menu.items, id:\.self) { item in
//                        CardView(item: item)
//                    }
//                    .gridStyle(
//                        StaggeredGridStyle(.vertical, tracks: 2, spacing: 10)
//                    )
//                    Grid(menu.items, id:\.self) { item in
//                        CardView(item: item)
//                    }
//                    .gridStyle(
//                        StaggeredGridStyle(.vertical, tracks: 2, spacing: 10)
//                    )
//                    }
//            .padding([.top,.horizontal], 10)
//        }
//        .background(Color.yellow.opacity(0.2))
//        .onAppear {
//            let interval = Date().timeIntervalSince(creationDate)
//            print(interval)
//        }
//    }
//}
//

//import SwiftUI
//import WaterfallGrid

//struct ContentView: View {
//    let menu = Bundle.main.decode(MenuSection.self, from: "menu.json")
//    let width = (UIScreen.main.bounds.width-40)/2
//    private let creationDate: Date
//
//    init() {
//        creationDate = Date()
//    }
//
//    var body: some View {
//        VStack {
//            Text("Choose your Dish")
//                .font(.system(size: 20, weight: .bold))
//            ScrollView(showsIndicators: false) {
//
//                WaterfallGrid(menu.items) { item in
//                    CardView(item: item)
//                }
//                .gridStyle(columns: 2)
//                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
//                WaterfallGrid(menu.items) { item in
//                    CardView(item: item)
//                }
//                .gridStyle(columns: 2)
//                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
//                WaterfallGrid(menu.items) { item in
//                    CardView(item: item)
//                }
//                .gridStyle(columns: 2)
//                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
//                WaterfallGrid(menu.items) { item in
//                    CardView(item: item)
//                }
//                .gridStyle(columns: 2)
//                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
//
//            }
//        }
//        .background(Color.yellow.opacity(0.2))
//        .onAppear {
//            let interval = Date().timeIntervalSince(creationDate)
//            print(interval)
//        }
//    }
//}


//import SwiftUI
//import SwiftUIMasonry
//
//struct ContentView: View {
//    let menu = Bundle.main.decode(MenuSection.self, from: "menu.json")
//    let width = (UIScreen.main.bounds.width-40)/2
//
//    private let creationDate: Date
//
//    init() {
//        creationDate = Date()
//    }
//
//    var body: some View {
//        VStack {
//            Text("Choose your Dish")
//                .font(.system(size: 20, weight: .bold))
//            ScrollView(showsIndicators: false) {
//                VMasonry(columns: 2) {
//                    ForEach(menu.items, id:\.self) { item in
//                        CardView(item: item)
//                    }
//                    ForEach(menu.items, id:\.self) { item in
//                        CardView(item: item)
//                    }
//                    ForEach(menu.items, id:\.self) { item in
//                        CardView(item: item)
//                    }
//                    ForEach(menu.items, id:\.self) { item in
//                        CardView(item: item)
//                    }
//                }
//            }
//            .padding([.top,.horizontal], 10)
//        }
//        .background(Color.yellow.opacity(0.2))
//        .onAppear {
//            let interval = Date().timeIntervalSince(creationDate)
//            print(interval)
//        }
//    }
//}
//
//import SwiftUI
//
//struct ContentView: View {
//    let menu = Bundle.main.decode(MenuSection.self, from: "menu.json")
//    let width = (UIScreen.main.bounds.width-40)/2
//    @State var leftStack: [MenuItem] = []
//    @State var rightStack: [MenuItem] = []
//    private let creationDate: Date
//
//        init() {
//            creationDate = Date()
//        }
//
//    var body: some View {
//        VStack {
//            Text("Choose your Dish")
//                .font(.system(size: 20, weight: .bold))
//            ScrollView(showsIndicators: false) {
//                HStack(alignment:.top) {
//                    LazyVStack(spacing: 20) {
//                        ForEach(leftStack, id:\.self) { i in
//                            CardView(item: i)
//                        }
//                    }
//                    LazyVStack(spacing: 20) {
//                        ForEach(rightStack, id:\.self) { i in
//                            CardView(item: i)
//                        }
//                    }
//                }
//            }
//            .padding([.top,.horizontal], 10)
//        }
//        .background(Color.yellow.opacity(0.2))
//        .onAppear{
//            getdata()
//            let interval = Date().timeIntervalSince(creationDate)
//            print(interval)
//        }
//    }
////
//    func getdata()
//    {
//        if menu.items.count == 1 {
//            leftStack.append(menu.items[0])
//            return
//        }
//        if menu.items.count == 2 {
//            if (getHeight(menu.items[0].mainImage) > getHeight(menu.items[1].mainImage)) {
//                leftStack.append(menu.items[0])
//                rightStack.append(menu.items[1])
//            }
//            else {
//                leftStack.append(menu.items[1])
//                rightStack.append(menu.items[0])
//            }
//            return
//        }
//        var leftHeight : CGFloat = getHeight(menu.items[0].mainImage) + 48.5
//        var rightHeight : CGFloat = getHeight(menu.items[1].mainImage) + 48.5
//        var currentHeight: CGFloat = 0
//        leftStack.append(menu.items[0])
//        rightStack.append(menu.items[1])
////
//        for i in 2..<(menu.items.count-2) {
//            currentHeight = getHeight(menu.items[i].mainImage) + 48.5
//            if (leftHeight - rightHeight) <= 0 {
//                leftStack.append(menu.items[i])
//                leftHeight = leftHeight + currentHeight
//            }
//            else {
//                rightStack.append(menu.items[i])
//                rightHeight = rightHeight + currentHeight
//            }
//        }
//        var lastHeight = getHeight(menu.items[menu.items.count-1].mainImage)
//        var secondLastHeight = getHeight(menu.items[menu.items.count-2].mainImage)
//
//        if abs((leftHeight + secondLastHeight) - (rightHeight + lastHeight)) <= abs((leftHeight + lastHeight) - (rightHeight + secondLastHeight))  {
//            leftStack.append(menu.items[menu.items.count-2])
//            leftHeight = leftHeight + secondLastHeight
//            rightStack.append(menu.items[menu.items.count-1])
//            rightHeight = rightHeight + lastHeight
//        }
//        else {
//            leftStack.append(menu.items[menu.items.count-1])
//            leftHeight = leftHeight + lastHeight
//            rightStack.append(menu.items[menu.items.count-2])
//            rightHeight = rightHeight + secondLastHeight
//        }
//        for i in 0..<(menu.items.count-2) {
//            currentHeight = getHeight(menu.items[i].mainImage) + 48.5
//            if (leftHeight - rightHeight) <= 0 {
//                leftStack.append(menu.items[i])
//                leftHeight = leftHeight + currentHeight
//            }
//            else {
//                rightStack.append(menu.items[i])
//                rightHeight = rightHeight + currentHeight
//            }
//        }
//        lastHeight = getHeight(menu.items[menu.items.count-1].mainImage)
//        secondLastHeight = getHeight(menu.items[menu.items.count-2].mainImage)
//
//        if abs((leftHeight + secondLastHeight) - (rightHeight + lastHeight)) <= abs((leftHeight + lastHeight) - (rightHeight + secondLastHeight))  {
//            leftStack.append(menu.items[menu.items.count-2])
//            leftHeight = leftHeight + secondLastHeight
//            rightStack.append(menu.items[menu.items.count-1])
//            rightHeight = rightHeight + lastHeight
//        }
//        else {
//            leftStack.append(menu.items[menu.items.count-1])
//            leftHeight = leftHeight + lastHeight
//            rightStack.append(menu.items[menu.items.count-2])
//            rightHeight = rightHeight + secondLastHeight
//        }
//        for i in 0..<(menu.items.count-2) {
//            currentHeight = getHeight(menu.items[i].mainImage) + 48.5
//            if (leftHeight - rightHeight) <= 0 {
//                leftStack.append(menu.items[i])
//                leftHeight = leftHeight + currentHeight
//            }
//            else {
//                rightStack.append(menu.items[i])
//                rightHeight = rightHeight + currentHeight
//            }
//        }
//        lastHeight = getHeight(menu.items[menu.items.count-1].mainImage)
//        secondLastHeight = getHeight(menu.items[menu.items.count-2].mainImage)
//
//        if abs((leftHeight + secondLastHeight) - (rightHeight + lastHeight)) <= abs((leftHeight + lastHeight) - (rightHeight + secondLastHeight))  {
//            leftStack.append(menu.items[menu.items.count-2])
//            leftHeight = leftHeight + secondLastHeight
//            rightStack.append(menu.items[menu.items.count-1])
//            rightHeight = rightHeight + lastHeight
//        }
//        else {
//            leftStack.append(menu.items[menu.items.count-1])
//            leftHeight = leftHeight + lastHeight
//            rightStack.append(menu.items[menu.items.count-2])
//            rightHeight = rightHeight + secondLastHeight
//        }
//
//    }
//    func getHeight(_ image: String) -> CGFloat {
//        return (((UIImage(named:image)?.size.height)!) * width)/(UIImage(named:image)?.size.width)!
//    }
//}
