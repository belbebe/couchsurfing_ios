//
//  CarouselView.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 18/10/2023.
//

import SwiftUI

struct CarouselView<Content: View, Item, ID>: View where Item: RandomAccessCollection, ID: Hashable, ID: Equatable {
    var content: (Item.Element, CGSize) -> Content
    var id: KeyPath<Item.Element, ID>
    
    //MARK: view properties
    var spacing: CGFloat
    var cardPadding: CGFloat
    var items: Item
    @Binding var index: Int
    
    //MARK: gesture properties
    @GestureState var translation: CGFloat = 0
    @State var offset: CGFloat = 0
    @State var lastStoredOffset: CGFloat = 0
    
    @State var currentIndex: Int = 0
    
    init(index: Binding<Int>, spacing: CGFloat = 30, cardPadding: CGFloat = 80, items: Item, id: KeyPath<Item.Element, ID>, @ViewBuilder content: @escaping (Item.Element, CGSize) -> Content) {
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
            let cardWidth = size.width - (cardPadding - spacing) // reduced after applying card spacing and padding
            
            // memory efficient
            LazyHStack(spacing: spacing) {
                ForEach(items, id: id) {image in
                    content(image, CGSize(width: size.width - cardPadding, height: size.height))
                        .frame(width: size.width - cardPadding, height: size.height)
                        .contentShape(Rectangle())
                }
            }
            .padding(.horizontal, spacing)
            .offset(x: limitScroll())
            .contentShape(Rectangle())
            .gesture(
                DragGesture(minimumDistance: 5)
                    .updating($translation, body: {value, out, _ in
                        out = value.translation.width
                    })
                    .onChanged{onChanged(value: $0, cardWidth: cardWidth)}
                    .onEnded{onEnd(value: $0, cardWidth: cardWidth)}
            )
        }
        .padding(.bottom, 20)
        .onAppear{
            let extraSpace = (cardPadding / 2) - spacing
            offset = extraSpace
            lastStoredOffset = extraSpace
        }
        .animation(.easeInOut, value: translation == 0)
    }
    
    func onChanged(value: DragGesture.Value, cardWidth: CGFloat) {
        let translationX = value.translation.width
        offset = translationX + lastStoredOffset
    }
    
    func onEnd(value: DragGesture.Value, cardWidth: CGFloat) {
        // current index
        var _index = (offset / cardWidth).rounded()
        _index = max(-CGFloat(items.count - 1), _index)
        _index = min(_index, 0)
        
        currentIndex = Int(_index)
        index = -currentIndex
        withAnimation(.easeInOut(duration: 0.25)){
            // removing extra space
            let extraSpace = (cardPadding / 2) - spacing
            offset = (cardWidth * _index) + extraSpace
        }
        lastStoredOffset = offset
    }
    
    //MARK: limiting scroll on first and last items
    func limitScroll() -> CGFloat {
        let extraSpace = (cardPadding / 2) - spacing
        
        if index == 0 && offset > extraSpace {
            return extraSpace + (offset / 4)
        } else if index == items.count - 1 && translation < 0 {
            return offset - (translation / 2)
        } else {
            return offset
        }
    }
}

/*
 #Preview {
 CarouselView()
 }
 */
