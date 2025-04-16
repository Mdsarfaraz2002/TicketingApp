//
//  WrapTagsView.swift
//  Ticketing App
//
//  Created by Mohd Sarfaraz  on 09/04/25.
//

import SwiftUI

struct WrapTagsView: View {
    let tags: [String]

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            FlexibleTagWrapView(tags: tags)
        }
    }
}

struct FlexibleTagWrapView: View {
    let tags: [String]
    let spacing: CGFloat = 8
    let horizontalPadding: CGFloat = 12

    var body: some View {
        var totalWidth = CGFloat.zero
        var rows: [[String]] = [[]]
        
        // Split tags into rows
        for tag in tags {
            let tagWidth = tag.size(withAttributes: [.font: UIFont.systemFont(ofSize: 13)]).width + 24
            if totalWidth + tagWidth + spacing > UIScreen.main.bounds.width - horizontalPadding * 2 {
                rows.append([tag])
                totalWidth = tagWidth + spacing
            } else {
                rows[rows.count - 1].append(tag)
                totalWidth += tagWidth + spacing
            }
        }

        return VStack(alignment: .leading, spacing: spacing) {
            ForEach(rows, id: \.self) { row in
                HStack(spacing: spacing) {
                    ForEach(row, id: \.self) { tag in
                        Text(tag)
                            .font(.caption)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 4)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.gray.opacity(0.4), lineWidth: 0.5)
                            )
                    }
                }
            }

        }
    }
}

