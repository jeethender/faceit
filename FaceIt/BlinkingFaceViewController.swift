//
//  BlinkingFaceViewController.swift
//  FaceIt
//
//  Created by maisapride8 on 10/06/16.
//  Copyright © 2016 maisapride8. All rights reserved.
//

import UIKit

class BlinkingFaceViewController: FaceViewController {

    
    var blinking: Bool = false {
        didSet{
            startBlink()
        }
    }

    private struct BlinkRate {
        static let closedDuration = 0.4
        static let openDuration = 2.5
    }
    
    func startBlink()
    {
        if blinking {
            faceView.eyesOpen = false
            NSTimer.scheduledTimerWithTimeInterval(
                BlinkRate.closedDuration,
                target: self, selector: #selector(BlinkingFaceViewController.endBlink),
                userInfo: nil,
                repeats: false
            )
            
        }
    }
     func endBlink()
    {
        faceView.eyesOpen = true
        NSTimer.scheduledTimerWithTimeInterval(
            BlinkRate.openDuration,
            target: self, selector: #selector(BlinkingFaceViewController.startBlink),
            userInfo: nil,
            repeats: false
        )
        
    }
    
    override func viewDidAppear(animated: Bool) {
       super.viewDidAppear(animated)
        blinking = true
    }
 
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        blinking = false
    }
    
    
    
    
}
