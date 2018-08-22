//
//  MatchPossibleVue.swift
//  Game of match
//
//  Created by Snoopy on 22/08/2018.
//  Copyright © 2018 EMANET. All rights reserved.
//

import UIKit

class MatchPossibleVue: UIView {
    
    var holder: UIView!
    var persoIV: UIImageView!
    var persoNom: UILabel!
    var masque: UIView!
    var perso: String? {
        didSet {
            guard perso != nil else { return }
            persoNom.text = perso!
            persoIV.image = UIImage(named: perso!)
        }
    }
    
    var attr: Attirance = Attirance.neutre {
        didSet {
            switch attr {
            case .neutre:
                masque.backgroundColor = .clear
            case .oui:
                masque.backgroundColor = .green
            case .non:
                masque.backgroundColor = .red
                
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        miseEnPlaceUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        miseEnPlaceUI()
    }
    
    func miseEnPlaceUI() {
        layer.cornerRadius = 25
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowRadius = 5
        layer.shadowOffset = CGSize(width: 5, height: 5)
        layer.shadowOpacity = 0.75
        
        self.backgroundColor = .lightGray
        
        holder = UIView(frame: bounds)
        holder.backgroundColor = .clear
        holder.clipsToBounds = true
        holder.layer.cornerRadius = 25
        addSubview(holder)
        
        persoIV = UIImageView(frame: CGRect(x: 0, y: 0, width: holder.frame.width, height: holder.frame.height - 100))
        persoIV.contentMode = .scaleAspectFill
        persoIV.clipsToBounds = true
        holder.addSubview(persoIV)
        
        persoNom = UILabel(frame: CGRect(x: 0, y: holder.frame.height - 100, width: holder.frame.width, height: 100))
        persoNom.textColor = UIColor.black
        persoNom.textAlignment = .center
        persoNom.font = UIFont.boldSystemFont(ofSize: 30)
        persoNom.adjustsFontSizeToFitWidth = true
        holder.addSubview(persoNom)
        
        masque = UIView(frame: holder.bounds)
        masque.clipsToBounds = true
        masque.alpha = 0.25
        masque.backgroundColor = .clear
        holder.addSubview(masque)
        
        
    }
    

}
