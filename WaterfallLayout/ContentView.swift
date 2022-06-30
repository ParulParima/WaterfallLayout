//
//  ContentView.swift
//  WaterfallLayout
//
//  Created by Parul Parima on 20/06/22.

import SwiftUI

struct ContentView: View {
    let menu = Bundle.main.decode(MenuSection.self, from: "menu.json")
    let width = (UIScreen.main.bounds.width-40)/2
    @State var stack: [[MenuItem]] = [[],[]]
    private let creationDate: Date

        init() {
            creationDate = Date()
        }

    var body: some View {
        VStack {
            Text("Choose your Dish")
                .font(.system(size: 20, weight: .bold))
            ScrollView(showsIndicators: false) {
                HStack(alignment:.top) {
                    ForEach(0..<stack.count) { j in 
                    LazyVStack(spacing: 20) {
                        ForEach(stack[j], id:\.self) { i in
                            CardView(item: i)
                        }
                     }
                }
                }
            .padding([.top,.horizontal], 10)
            }
        }
        .background(Color.yellow.opacity(0.2))
        .onAppear{
            getdata()
            let interval = Date().timeIntervalSince(creationDate)
            print(interval)
        }
    }
//
    func getdata()
    {
        let count = menu.items.count
        if count == 1 {
            stack[0].append(menu.items[0])
            return
        }
        if count == 2 {
            if (getHeight(menu.items[0].mainImage) > getHeight(menu.items[1].mainImage)) {
                stack[0].append(menu.items[0])
                stack[1].append(menu.items[1])
            }
            else {
                stack[0].append(menu.items[1])
                stack[1].append(menu.items[0])
            }
            return
        }
        var leftHeight : CGFloat = getHeight(menu.items[0].mainImage) + 48.5
        var rightHeight : CGFloat = getHeight(menu.items[1].mainImage) + 48.5
        var currentHeight: CGFloat = 0
        stack[0].append(menu.items[0])
        stack[1].append(menu.items[1])
//
        for i in 2..<(count-2) {
            currentHeight = getHeight(menu.items[i].mainImage)
            if (leftHeight - rightHeight) <= 0 {
                stack[0].append(menu.items[i])
                leftHeight = leftHeight + currentHeight
            }
            else {
                stack[1].append(menu.items[i])
                rightHeight = rightHeight + currentHeight
            }
        }
        let lastHeight = getHeight(menu.items[count-1].mainImage)
        let secondLastHeight = getHeight(menu.items[count-2].mainImage)

        if abs((leftHeight + secondLastHeight) - (rightHeight + lastHeight)) <= abs((leftHeight + lastHeight) - (rightHeight + secondLastHeight))  {
            stack[0].append(menu.items[count-2])
            stack[1].append(menu.items[count-1])
        }
        else {
            stack[0].append(menu.items[count-1])
            stack[1].append(menu.items[count-2])
        }
        

    }
    func getHeight(_ image: String) -> CGFloat {
        let size = UIImage(named:image)?.size
        return (size!.height * width)/size!.width
    }
}
