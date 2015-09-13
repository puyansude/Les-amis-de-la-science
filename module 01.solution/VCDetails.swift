//
//  VCDetails.swift
//  Les amis de la science
//
//  Created by Alain on 2015-09-13.
//  Copyright (c) 2015 Production sur support. All rights reserved.
//

import UIKit

class VCDetails: UIViewController {

    @IBOutlet weak var savantNom: UILabel!
    @IBOutlet weak var savantImage: UIImageView!
    @IBOutlet weak var savantTexte: UITextView!
    
    @IBAction func retourALaListe(sender: AnyObject) {
 self.dismissViewControllerAnimated(true, completion:nil)
    
    }
    
    // Propriété pour recevoir les informations de la sélection
    var informationsDuSavantCourant =  Dictionary<String,String> ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("Nous avons reçu les données suivantes:\n\(informationsDuSavantCourant)")
        
        savantNom.text      = informationsDuSavantCourant["nom"]!
        savantImage.image   =  UIImage(named: informationsDuSavantCourant["photo"]!)
        savantTexte.text    = informationsDuSavantCourant["texte"]!
        
        
    } // viewDidLoad

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
