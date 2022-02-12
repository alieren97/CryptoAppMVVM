//
//  StatisticView.swift
//  CryptoApp
//
//  Created by Ali Eren on 8.02.2022.
//

import SwiftUI

struct StatisticView: View {
    let stat : Statistic
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(stat.title)
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
            Text(stat.value)
                .font(.headline)
                .foregroundColor(Color.theme.accent)
            HStack(spacing:4){
                Image(systemName : "triangle.fill")
                    .font(.caption2)
                    .rotationEffect(Angle(degrees: (stat.percenteageChange ?? 0) >= 0 ? 0 : 180))
                Text(stat.percenteageChange?.asPercentString() ?? "")
                    .font(.caption)
                    .bold()
            }
            .foregroundColor((stat.percenteageChange ?? 0) >= 0 ? Color.theme.green : Color.theme.red)
            .opacity(stat.percenteageChange == nil ? 0.0 : 1.0)
        }
        
    }
}

struct StatisticView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticView(stat:dev.stat3)
            .previewLayout(.sizeThatFits)
    }
}
