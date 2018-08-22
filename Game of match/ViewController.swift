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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Game of Match"
        
        matchPossible = MatchPossibleVue(frame: CGRect(x: 20, y: 100, width: view.frame.width - 40, height: view.frame.height - 150))
        view.addSubview(matchPossible)
    }


}

