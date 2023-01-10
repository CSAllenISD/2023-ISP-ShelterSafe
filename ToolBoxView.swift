//
//  ToolBoxView.swift
//  ShelterSafe
//
//  Created by Onik Houqe on 12/28/22.
//

import Foundation
import SwiftUI
import AVFoundation

struct ToolBoxView: View {
    
    
    @State private var flashlightOn = false
    @State private var strobeOn = false
    
    
    func toggleFlash(on: Bool) {
        guard let device = AVCaptureDevice.default(for: .video) else { return }
        
        if device.hasTorch {
            do {
                try device.lockForConfiguration()
                if on == true {
                    device.torchMode = .on
                } else {
                    device.torchMode = .off
                }
            } catch {
                print("An unexpected error occured.")
            }
        }
    }
    
    
    
    var body: some View {
        
        VStack {
            
        }
        
      
    }
    

}


struct ToolBoxView_Previews: PreviewProvider {
    static var previews: some View {
        ToolBoxView()
    }
}

