//
//  SkeletonView.swift
//  Vollmed
//
//  Created by Michel Santos on 27/04/24.
//

import SwiftUI

struct SkeletonView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 16) {
                LinearGradient(colors: [.gray, .white, .white], startPoint: .leading, endPoint: .trailing)
                    .mask {
                        Circle()
                            .frame(width: 60, height: 60, alignment: .center)
                    }
                    .frame(width: 60, height: 60)
            }
        }
    }
}

#Preview {
    SkeletonView()
}
