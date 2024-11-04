//
//  ContentViewViewModel.swift
//  SliderGame
//
//  Created by Winky51 on 01.11.2024.
//

import Observation
import SwiftUI
@Observable final class ContentViewViewModel {
    
    var targetValue = 0
    var currentValue = Double.random(in: (0...100))
    var result = 0
    var targetText:String {
        targetValue.formatted()
    }
    var alpha = 1.0
    
    func setTargetValue() {
        targetValue = Int.random(in: 0...100)
    }
    
    func checkValue() {
        result = computeScore()
        
    }
    
    func setAlpha(){
        alpha = Double(computeScore())
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
    
   
   
    
}





