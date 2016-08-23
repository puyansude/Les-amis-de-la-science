//
//  ViewController.swift
//  Les amis de la science
//
//  Created by Alain on 2015-09-13.
//  Copyright (c) 2015 Alain. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    var lesAmisDeLaScienceData:[Dictionary<String,String>] = []
    
    // *****************************************************
    @IBOutlet weak var CVSavant: UICollectionView!
    override func viewDidLoad()
        // *****************************************************
    {
        super.viewDidLoad()
        
        let pathFichierPlist = Bundle.main.path(forResource: "amisDelaScience", ofType: "plist")!
        lesAmisDeLaScienceData = NSArray(contentsOfFile: pathFichierPlist) as! Array
        
    } // viewDidLoad
    
    
    // MARK: - Méthodes de protocole du UITableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lesAmisDeLaScienceData.count
    }
    
    // *****************************************************
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var celluleCourante:Savant
        
        // Depuis Xcode 6, dequeueReusableCellWithIdentifier retourne une cellule vide
        // si aucune de disponible en recyclage.
        celluleCourante = tableView.dequeueReusableCell(withIdentifier: "celluleSavant") as! Savant
        
        // Ici, nous avons une nouvelle cellule ou une cellule recyclée!
        celluleCourante.savantNom.text = lesAmisDeLaScienceData[(indexPath as NSIndexPath).row]["nom"]!
        celluleCourante.savantTexte.text = lesAmisDeLaScienceData[(indexPath as NSIndexPath).row]["texte"]!
        celluleCourante.savantImage.image = UIImage(named: lesAmisDeLaScienceData[(indexPath as NSIndexPath).row]["photo"]!)
        
        // Recette pour obtenir la valeur de l'année courante
        let date = Date()
        let calendar = NSCalendar.current
        let components = calendar.dateComponents([.year], from: date)
        let anneeCourante = components.year
        
        let anneeNaissance = lesAmisDeLaScienceData[(indexPath as NSIndexPath).row]["naissance"]!
        print("# \(anneeCourante), \(anneeNaissance)\n")
        celluleCourante.savantAge.text = "\(anneeCourante! - Int(anneeNaissance)!) ans"
        
        return celluleCourante
    } // tableView: cellForRowAtIndexPath
    
}  // ViewController
