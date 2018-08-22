//
//  ItsAMatchVue.swift
//  Game of match
//
//  Created by Snoopy on 22/08/2018.
//  Copyright © 2018 EMANET. All rights reserved.
//

import UIKit

class ItsAMatchVue: UIView {
    
    var holder: UIView!
    var moiIV: UIImageView!
    var matchIV: UIImageView!
    var lbl : UILabel!
    var bouton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        layerDe(vue: self)
        holder = UIView(frame: bounds)
        holder.alpha = 0.85
        holder.backgroundColor = .black
        holder.clipsToBounds = true
        addSubview(holder)
        
        moiIV = UIImageView(frame: CGRect(x: 0, y: 50, width: 50, height: 50))
        moiIV.image = #imageLiteral(resourceName: "moi")
        imageArrondie(image: moiIV)
        addSubview(moiIV)
        
        matchIV = UIImageView(frame: CGRect(x: frame.width - 50, y: 50, width: 50, height: 50))
        imageArrondie(image: matchIV)
        addSubview(matchIV)
        
        lbl = UILabel(frame: CGRect(x: 0, y: frame.height - 100, width: frame.width, height: 40))
        lbl.text = "C'est un match !"
        lbl.font = UIFont.boldSystemFont(ofSize: 30)
        lbl.adjustsFontSizeToFitWidth = true
        lbl.textColor = .red
        lbl.textAlignment = .center
        addSubview(lbl)
        
        bouton = UIButton(frame: CGRect(x: 0, y: frame.height - 50, width: frame.width, height: 40))
        bouton.setTitle("Continuer", for: .normal)
        bouton.tintColor = .white
        bouton.addTarget(self, action: #selector(boutonAppuye), for: .touchUpInside)
        
        
    }
    
    func imageArrondie(image: UIImageView) {
        image.layer.cornerRadius = image.frame.width / 2
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.borderWidth = 2
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        
        
    }
    
    
    @objc func boutonAppuye() {
        
    }
    
    
    
    
    
    
    
    
    
    
}
