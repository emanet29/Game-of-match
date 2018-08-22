//
//  ViewController.swift
//  Game of match
//
//  Created by Snoopy on 22/08/2018.
//  Copyright © 2018 EMANET. All rights reserved.
//

import UIKit


enum Attirance {
    case neutre
    case oui
    case non
}

class ViewController: UIViewController {

    var matchPossible: MatchPossibleVue!
    var frameDOrigine: CGRect?
    var personnages = ["Emilia","Kit","Iwan","Natalie","Sophie","Peter"]
    var matchSuivant: MatchPossibleVue?
    var matchVue: ItsAMatchVue?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Game of Match"
        
        matchPossible = MatchPossibleVue(frame: CGRect(x: 20, y: 100, width: view.frame.width - 40, height: view.frame.height - 150))
        matchPossible.perso = personnaeAleatoire()
        view.addSubview(matchPossible)
        
        NotificationCenter.default.addObserver(self, selector: #selector(changerDePerso), name: Notification.Name("Continuer"), object: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard bonneVue(touches: touches)  else { return }
        frameDOrigine = matchPossible.frame
        matchSuivant = MatchPossibleVue(frame: frameDOrigine!)
        matchSuivant?.perso = personnaeAleatoire()
        view.addSubview(matchSuivant!)
        view.sendSubview(toBack: matchSuivant!)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard bonneVue(touches: touches)  else { return }
        guard let position = touches.first?.location(in: self.view).x else { return }
        matchPossible.center.x = position
        
        // rotation
        let distanceDuCentre = (self.view.frame.width / 2) - position
        let angleDeRotation = -distanceDuCentre / 360
        matchPossible.transform = CGAffineTransform(rotationAngle: angleDeRotation)
        
        // voir si distanceDuCentre est éloignée à droite/gauche
        if distanceDuCentre >= 150 {
            matchPossible.attr = .non
        } else if distanceDuCentre <= -150 {
            matchPossible.attr = .oui
        } else {
            matchPossible.attr = .neutre
        }
        
        
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard bonneVue(touches: touches)  else { return }
        matchPossible.transform = CGAffineTransform.identity
        matchPossible.center.x = self.view.frame.width / 2
        
        if matchPossible.attr != .neutre {
            //si oui check du match + on passe au suivant
            if matchPossible.attr == .oui && matchAleatoire() {
                // monteer vue de match
                guard let frame = frameDOrigine else { return }
                matchVue = ItsAMatchVue(frame: frame)
                matchVue?.persoMatch = matchPossible.perso
                view.addSubview(matchVue!)
                
            } else {
                changerDePerso()
            }
            
        }
    }
    
    @objc func changerDePerso() {
        if matchVue != nil {
            matchVue?.removeFromSuperview()
            matchVue = nil
        }
        guard matchSuivant != nil else { return }
        matchPossible.perso = matchSuivant?.perso
        matchPossible.attr = .neutre
        matchSuivant?.removeFromSuperview()
        matchSuivant = nil
        
        
        
    }
    
    func bonneVue(touches: Set<UITouch>) -> Bool {
        if let touch = touches.first, touch.view == matchPossible.masque {
            return true
        } else {
            return false
        }
    }
    
    func matchAleatoire() -> Bool {
        return Int(arc4random_uniform(2)) == 0
    }
    
    func personnaeAleatoire() -> String{
        return personnages[Int(arc4random_uniform(UInt32(personnages.count)))]
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
}

