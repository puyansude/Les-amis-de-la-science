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
        
        let pathFichierPlist = NSBundle.mainBundle().pathForResource("amisDelaScience", ofType: "plist")!
        lesAmisDeLaScienceData = NSArray(contentsOfFile: pathFichierPlist) as! Array
        
    } // viewDidLoad
    
    
    // MARK: - Méthodes de protocole du UITableView
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lesAmisDeLaScienceData.count
    }
    
    // *****************************************************
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var celluleCourante:Savant
        
        // Depuis Xcode 6, dequeueReusableCellWithIdentifier retourne une cellule vide
        // si aucune de disponible en recyclage.
        celluleCourante = tableView.dequeueReusableCellWithIdentifier("celluleSavant") as! Savant
        
        // Ici, nous avons une nouvelle cellule ou une cellule recyclée!
        celluleCourante.savantNom.text = lesAmisDeLaScienceData[indexPath.row]["nom"]!
        celluleCourante.savantTexte.text = lesAmisDeLaScienceData[indexPath.row]["texte"]!
        celluleCourante.savantImage.image = UIImage(named: lesAmisDeLaScienceData[indexPath.row]["photo"]!)
        
        // Recette pour obtenir la valeur de l'année courante
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components(NSCalendarUnit.CalendarUnitYear, fromDate: date)
        let anneeCourante = components.year
        
        let anneeNaissance = lesAmisDeLaScienceData[indexPath.row]["naissance"]!
        println("\(anneeCourante), \(anneeNaissance)")
        celluleCourante.savantAge.text = "\(anneeCourante - anneeNaissance.toInt()!) ans"
        
        return celluleCourante
    } // tableView: cellForRowAtIndexPath
    
}  // ViewController