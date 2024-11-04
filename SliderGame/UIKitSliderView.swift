//
//  UIKitSliderView.swift
//  SliderGame
//
//  Created by Winky51 on 04.11.2024.
//

import Foundation
import SwiftUI
struct UIKitSliderView: UIViewRepresentable {
    @Binding var value: Double
    @Binding var alpha: Double
    
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged(_:)),
            for: .valueChanged
        )
        
        
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
        uiView.thumbTintColor = (
            UIColor(
                red: 1,
                green: 0,
                blue: 0,
                alpha: alpha / 100
            )
        )
    }
    
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(value: $value, alpha: $alpha)
    }
    
    
}

extension UIKitSliderView {
    final class Coordinator: NSObject {
        @Binding var value: Double
        @Binding var alpha: Double
        
        init(value: Binding<Double>, alpha: Binding<Double>) {
            self._value = value
            self._alpha = alpha
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            self.$value.wrappedValue = Double(sender.value)
        }
    }
    
}
