//
//  ContentView.swift
//  Arrow
//
//  Created by Garima Bothra on 02/07/20.
//  Copyright © 2020 Garima Bothra. All rights reserved.
//

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

        return path
    }
}

struct Arrow: View {

    var lineWidth: CGFloat

    var animatableData: CGFloat {
        get { (lineWidth) }
        set { self.lineWidth = (newValue)}
    }

    var body: some View {
        VStack(spacing: 0) {
            Triangle()
                .frame(width: (lineWidth * 2.5), height: (lineWidth * 2.5), alignment: .center)
            Rectangle()
                .frame(width: (lineWidth), height: (lineWidth * 2.5), alignment: .center)
        }
    }
}

struct ContentView: View {

    @State private var width: CGFloat = 100
    var body: some View {
        VStack {
        Arrow(lineWidth: width)
            .onTapGesture {
                withAnimation {
                self.width -= 10.0
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
