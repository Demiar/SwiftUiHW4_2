//
//  Coordinator.swift
//  SwiftUIHW4
//
//  Created by Алексей on 08.08.2021.
//

import SwiftUI

final class Coordinator: NSObject {
    var value: Binding<Double>
    var alpha: Binding<Double>

    init(value: Binding<Double>, alpha: Binding<Double>) {
        self.value = value
        self.alpha = alpha
    }

    @objc func valueChanged(_ sender: UISlider) {
        self.value.wrappedValue = Double(sender.value)
    }
}
