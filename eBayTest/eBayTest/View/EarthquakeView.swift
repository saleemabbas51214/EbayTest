//
//  EarthquakeView.swift
//  eBayTest
//
//  Created by abbas on 25.06.23.
//

import SwiftUI

struct EarthquakeView: View {
    
    let model: Earthquake
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text(model.datetime.displayDate ?? "N/A").font(.title2).bold()
                    Spacer()
                    Text(model.magnitude >= 8.0 ? AppLabels.EarthQuakeList.Cell.high : AppLabels.EarthQuakeList.Cell.low)
                        .frame(height: 30)
                        .frame(maxWidth: 70)
                        .foregroundColor(Color.white)
                        .background(
                            RoundedRectangle(cornerRadius: 30, style: .continuous).fill(model.magnitude >= 8.0 ? Color.red : .green)
                        )
                }
                HStack {
                    VStack(spacing: 5) {
                        Text(model.depth.asString)
                        Text(AppLabels.EarthQuakeList.Cell.depth)
                            .font(.caption)
                            .fontWeight(.heavy)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    VStack(spacing: 5) {
                        Text(model.magnitude.asString)
                        Text(AppLabels.EarthQuakeList.Cell.magnitude)
                            .font(.caption)
                            .fontWeight(.heavy)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    VStack {
                        Image(systemName: "map")
                            .foregroundColor(.blue)
                    }
                }.padding(.horizontal)
            }
        }
        .padding()
        .frame(height: 120, alignment: .center)
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.white)
                .shadow(color: .gray, radius: 2, x: 0, y: 0)
        )
        
    }
}

struct EarthQuakeCell_Previews: PreviewProvider {
    static var previews: some View {
        EarthquakeView(model: Earthquakes.dummyData)
    }
}
