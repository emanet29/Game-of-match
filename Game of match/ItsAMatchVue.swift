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
    
    var persoMatch: String? {
        didSet {
            guard persoMatch != nil else { return }
            setup(perso: persoMatch!)
            animation()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func animation() {
        UIView.animate(withDuration: 0.5, animations: {
            self.moiIV.frame = CGRect(x: self.frame.width / 2 - 150, y: 80, width: 150, height: 150)
            self.imageArrondie(image: self.moiIV)
            self.matchIV.frame = CGRect(x: self.frame.width / 2, y: 80, width: 150, height: 150)
            self.imageArrondie(image: self.matchIV)
            self.transform = CGAffineTransform(scaleX: 1.15, y: 1.15)
        }) { (success) in
            self.transform = CGAffineTransform.identity
        }
    }
    
    func setup(perso: String) {
        layerDe(vue: self)
        holder = UIView(frame: bounds)
        holder.alpha = 0.85
        holder.layer.cornerRadius = 25
        holder.backgroundColor = .black
        holder.clipsToBounds = true
        addSubview(holder)
        
        moiIV = UIImageView(frame: CGRect(x: 0, y: 50, width: 50, height: 50))
        moiIV.image = #imageLiteral(resourceName: "moi")
        imageArrondie(image: moiIV)
        addSubview(moiIV)
        
        matchIV = UIImageView(frame: CGRect(x: frame.width - 50, y: 50, width: 50, height: 50))
        imageArrondie(image: matchIV)
        matchIV.image = UIImage(named: perso)
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
        addSubview(bouton)
        
    }
    
    func imageArrondie(image: UIImageView) {
        image.layer.cornerRadius = image.frame.width / 2
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.borderWidth = 2
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        
        
    }
    
    
    @objc func boutonAppuye() {
        NotificationCenter.default.post(name: Notification.Name("Continuer"), object: nil, userInfo: nil)
        for v in subviews {
            v.removeFromSuperview()
        }
        
    }
    
    
    
    
    
    
    
    
    
    
}
