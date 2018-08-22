//
//  MatchPossibleVue.swift
//  Game of match
//
//  Created by Snoopy on 22/08/2018.
//  Copyright © 2018 EMANET. All rights reserved.
//

import UIKit

class MatchPossibleVue: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        miseEnPlaceUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        miseEnPlaceUI()
    }
    
    func miseEnPlaceUI() {
        self.backgroundColor = .lightGray
        
    }
    

}
