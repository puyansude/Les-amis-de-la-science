//
//  ViewController.swift
//  module 03.solution
//
//  Created by Alain on 2015-09-13.
//  Copyright (c) 2015 Production sur support. All rights reserved.
//  Module 04

import UIKit

class ViewControllerModule04D: UIViewController, UICollectionViewDataSource {
    
    var lesAmisDeLaScienceData:[Dictionary<String,String>] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Charger les données
        let pathFichierPlist = Bundle.main.path(forResource: "amisDelaScience", ofType: "plist")!
        lesAmisDeLaScienceData = NSArray(contentsOfFile: pathFichierPlist) as! Array
    }
    
    
    // MARK: - Les méthodes de protocoles de UICollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return lesAmisDeLaScienceData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // Attention, avec un CollectionView, il faut absolument utiliser le recyclage:
        
        var celluleCourante:CVCSavant
        
        let nomModele = (indexPath as NSIndexPath).row % 2 == 0 ? "modeleCelluleSavant":"modeleCelluleSavant2"
        
        // Recyclage obligatoire pour un UICollectionViewCell
        if let unPersonnageScientifique =
            collectionView.dequeueReusableCell(withReuseIdentifier: nomModele, for:indexPath) as? CVCSavant {
                celluleCourante = unPersonnageScientifique
        } else
        {
            print("# Erreur lors de la récupération de 'UICollectionViewCell'\n")
            celluleCourante = CVCSavant()
        }  //  if let unPersonnageScientifique = tableView.dequeueReusableCellWithIdentifier
        
        // Renseigner les élements de la cellule courante
        
        // Recette pour obtenir la valeur de l'année courante
        let date = Date()
        let calendar = NSCalendar.current
        
        let components = calendar.dateComponents([.year], from: date)
        let anneeCourante = components.year
        let anneeNaissance = lesAmisDeLaScienceData[(indexPath as NSIndexPath).row]["naissance"]!
        let age = " - \(anneeCourante! - Int(anneeNaissance)!) ans"
        
        celluleCourante.savantNom.text = lesAmisDeLaScienceData[indexPath.row]["nom"]! + age
        celluleCourante.savantTexte.text = lesAmisDeLaScienceData[(indexPath as NSIndexPath).row]["texte"]!
        
        celluleCourante.savantImage.image = UIImage(named: lesAmisDeLaScienceData[(indexPath as NSIndexPath).row]["photo"]!)
        
        return celluleCourante
    }
}

