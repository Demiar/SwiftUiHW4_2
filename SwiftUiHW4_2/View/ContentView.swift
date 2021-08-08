//
//  ContentView.swift
//  SwiftUIHW4
//
//  Created by Алексей on 07.08.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var sliderValue: Double = Double.random(in: 0...100)
    @State private var alertOn = false
    @State private var number = Int.random(in: 1...100)
    @State private var alpha = 100.0
    
    var body: some View {
        VStack{
            Text("Подвиньте слайдер, как можно ближе к: \(number)")
                .lineLimit(2)
                .padding(.bottom, 10)
            HStack{
                Text("0")
                SliderCustom(minimumValue: 0,
                             maximumValue: 100,
                             value: $sliderValue,
                             alpha: $alpha
                )
                .onChange(of: sliderValue, perform: { value in
                    alpha = Double(computeScore())
                })
                Text("100")
            }
            .alert(isPresented: $alertOn, content: {
                .init(title: Text("Результаты"),
                      message: Text("Ваш результат \(computeScore())"),
                      dismissButton: .cancel()
                )
            })
            .padding(.bottom, 10)
            Button(action: {
                alertOn = true
            }, label: {
                Text("Проверь меня!")
            })
            .padding(.bottom, 10)
            Button(action: {
                number = Int.random(in: 1...100)
                sliderValue = Double.random(in: 0...100)
            }, label: {
                Text("Начать заново")
            })
        }
        .padding()
    }
    

}

extension ContentView {
    private func computeScore() -> Int {
        let difference = abs(Int(number) - Int(lround(Double(sliderValue))))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
