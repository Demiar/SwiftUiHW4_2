//
//  SliderCustom.swift
//  SwiftUIHW4
//
//  Created by Алексей on 07.08.2021.
//

import SwiftUI



struct SliderCustom: UIViewRepresentable {
    let minimumValue: Int
    let maximumValue: Int
    
    @Binding var value: Double
    @Binding var alpha: Double
    
    
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        
        slider.minimumValue = Float(minimumValue)
        slider.maximumValue = Float(maximumValue)
        slider.value = Float(value)
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged(_:)),
            for: .valueChanged
         )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.thumbTintColor = UIColor(red: 255 / 255, green: 1 / 255, blue: 1 / 255, alpha: CGFloat(alpha / 100))
        uiView.value = Float(self.value)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value, alpha: $alpha)
    }
}
