//
//  SkeletonView.swift
//  Vollmed
//
//  Created by Michel Santos on 27/04/24.
//

import SwiftUI

struct SkeletonView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 35) {
            ForEach(0..<5, id: \.self) { _ in
                SkeletonRow()
            }
        }
    }
}

struct SkeletonRow: View {
    private var placeholderString = "**************************"
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 16) {
                LinearGradient(gradient: Gradient(colors: [.gray,.white, .gray]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
                    .mask {
                        Circle()
                            .frame(width: 60, height: 60, alignment: .center)
                            .redactedAnimation()
                    }
                    .frame(width: 60, height: 60)
                
                VStack(alignment: .leading, spacing: 8.0) {
                    LinearGradient(gradient: Gradient(colors: [.gray,.white, .gray]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
                        .mask {
                            Text(placeholderString)
                                .redacted(reason: .placeholder)
                                .redactedAnimation()
                        }
                    LinearGradient(gradient: Gradient(colors: [.gray,.white, .gray]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
                        .mask {
                            Text(placeholderString)
                                .redacted(reason: .placeholder)
                                .redactedAnimation()
                        }
                }
            }
        }.frame(height: 80)
    }
}

#Preview {
    SkeletonView()
}
