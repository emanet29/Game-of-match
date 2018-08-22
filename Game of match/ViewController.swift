//
//  ViewController.swift
//  Game of match
//
//  Created by Snoopy on 22/08/2018.
//  Copyright © 2018 EMANET. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var matchPossible: MatchPossibleVue!
    var frameDOrigine: CGRect?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Game of Match"
        
        matchPossible = MatchPossibleVue(frame: CGRect(x: 20, y: 100, width: view.frame.width - 40, height: view.frame.height - 150))
        view.addSubview(matchPossible)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard bonneVue(touches: touches)  else { return }
        frameDOrigine = matchPossible.frame
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard bonneVue(touches: touches)  else { return }
        guard let position = touches.first?.location(in: self.view).x else { return }
        matchPossible.center.x = position
        
        let distanceDuCentre = (self.view.frame.width / 2) - position
        let angleDeRotation = -distanceDuCentre / 360
        matchPossible.transform = CGAffineTransform(rotationAngle: angleDeRotation)
        
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard bonneVue(touches: touches)  else { return }
        matchPossible.transform = CGAffineTransform.identity
        matchPossible.center.x = self.view.frame.width / 2
    }
    
    func bonneVue(touches: Set<UITouch>) -> Bool {
        if let touch = touches.first, touch.view == matchPossible.masque {
            return true
        } else {
            return false
        }
    }
    
}

