//
//  ViewController.swift
//  module 03.solution
//
//  Created by Alain on 2015-09-13.
//  Copyright (c) 2015 Production sur support. All rights reserved.
//  Module 04

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource {
    
    var lesAmisDeLaScienceData:[Dictionary<String,String>] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Charger les données
        let pathFichierPlist = NSBundle.mainBundle().pathForResource("amisDelaScience", ofType: "plist")!
        lesAmisDeLaScienceData = NSArray(contentsOfFile: pathFichierPlist) as! Array
    }
    
    
    // MARK: - Les méthodes de protocoles de UICollectionView
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return lesAmisDeLaScienceData.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        // Attention, avec un CollectionView, il faut absolument utiliser le recyclage:
        
        var celluleCourante:CVCSavant
        
        let nomModele = indexPath.row % 2 == 0 ? "modeleCelluleSavant":"modeleCelluleSavant2"
        
        // Recyclage obligatoire pour un UICollectionViewCell
        if let unPersonnageScientifique =
            collectionView.dequeueReusableCellWithReuseIdentifier(nomModele, forIndexPath:indexPath) as? CVCSavant {
                celluleCourante = unPersonnageScientifique
        } else
        {
            println("Erreur lors de la récupération de 'UICollectionViewCell'")
            celluleCourante = CVCSavant()
        }  //  if let unPersonnageScientifique = tableView.dequeueReusableCellWithIdentifier
        
        // Renseigner les élements de la cellule courante
        
        // Recette pour obtenir la valeur de l'année courante
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components(NSCalendarUnit.CalendarUnitYear, fromDate: date)
        let anneeCourante = components.year
        let anneeNaissance = lesAmisDeLaScienceData[indexPath.row]["naissance"]!
        let age = " - \(anneeCourante - anneeNaissance.toInt()!) ans"
        
        celluleCourante.savantNom.text = lesAmisDeLaScienceData[indexPath.row]["nom"]! + age
        celluleCourante.savantTexte.text = lesAmisDeLaScienceData[indexPath.row]["texte"]!
        
        celluleCourante.savantImage.image = UIImage(named: lesAmisDeLaScienceData[indexPath.row]["photo"]!)
        
        return celluleCourante
    }
}

