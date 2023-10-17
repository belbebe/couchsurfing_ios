//
//  CarouselView.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 18/10/2023.
//

import SwiftUI

struct CarouselView<Content: View, Item, ID>: View where Item: RandomAccessCollection, ID: Hashable, ID: Equatable {
    var content: (Item.Element) -> Content
    var id: KeyPath<Item.Element, ID>
    
    // view properties
    var spacing: CGFloat
    var cardPadding: CGFloat
    var items: Item
    @Binding var index: Int
    
    init(index: Binding<Int>, spacing: CGFloat = 30, cardPadding: CGFloat = 80, items: Item, id: KeyPath<Item.Element, ID>, @ViewBuilder content: @escaping (Item.Element) -> Content) {
        self.content = content
        self.id = id
        
        self._index = index
        self.spacing = spacing
        self.cardPadding = cardPadding
        self.items = items
    }
    var body: some View {
        GeometryReader {proxy in
            let size = proxy.size
            let cardWidth = size.width - (cardPadding - spacing)
            
            LazyHStack(spacing: spacing) {
                ForEach(items, id: id) {image in
                    content(image)
                }
            }
        }
    }
}

/*
 #Preview {
 CarouselView()
 }
 */
