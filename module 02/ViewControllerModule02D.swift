//
//  ViewController.swift
//  Les amis de la science
//
//  Created by Alain on 2015-09-13.
//  Copyright (c) 2015 Alain. All rights reserved.
//
//  Module 02

import UIKit

class ViewControllerModule02D: UIViewController, UITableViewDataSource {
    
    let lesAmisDeLaScienceData:[Dictionary<String,String>] = [
        
        ["nom":"Albert Einstein",       "photo":"Albert Einstein.jpg",          "texte":"lorem ipsum01 ...", "naissance":"1900"],
        ["nom":"Albert Jacquard",       "photo":"Albert Jacquard.jpg",          "texte":"lorem ipsum02 ...", "naissance":"1900"],
        ["nom":"Blaise Pascal",         "photo":"Blaise Pascal.jpg",            "texte":"lorem ipsum03 ...", "naissance":"1900"],
        ["nom":"Braun",                 "photo":"Braun.jpg",                    "texte":"lorem ipsum04 ...", "naissance":"1900"],
        ["nom":"Christian Huygens",     "photo":"Christian Huygens.jpg",        "texte":"lorem ipsum05 ...", "naissance":"1900"],
        ["nom":"Daniel Fahrenheit",     "photo":"Daniel Fahrenheit.jpg",        "texte":"lorem ipsum06 ...", "naissance":"1900"],
        ["nom":"Dennis Ritchie",        "photo":"Dennis Ritchie.jpg",           "texte":"lorem ipsum07 ...", "naissance":"1900"],
        ["nom":"Galileo Galilei",       "photo":"Galilée.jpg",                  "texte":"lorem ipsum08 ...", "naissance":"1900"],
        ["nom":"Henri Becquerel",       "photo":"Henri Becquerel.jpg",          "texte":"lorem ipsum09 ...", "naissance":"1900"],
        ["nom":"Heinrich Hertz",        "photo":"Hertz.jpg",                    "texte":"lorem ipsum10 ...", "naissance":"1900"],
        ["nom":"Jean Perrin",           "photo":"Jean Perrin.jpg",              "texte":"lorem ipsum11 ...", "naissance":"1900"],
        ["nom":"Karl Guthe Jansky",     "photo":"Karl Guthe Jansky.jpg",        "texte":"lorem ipsum12 ...", "naissance":"1900"],
        ["nom":"Marie Curie",           "photo":"Marie Curie.jpg",              "texte":"lorem ipsum13 ...", "naissance":"1900"],
        ["nom":"James Clerk Maxwell",   "photo":"maxwell.jpg",                  "texte":"lorem ipsum14 ...", "naissance":"1900"],
        ["nom":"Steve Jobs",            "photo":"Steve Jobs.jpg",               "texte":"lorem ipsum15 ...", "naissance":"1900"],
        ["nom":"Wilhelm Conrad Rontgen","photo":"Wilhelm Conrad Rontgen.jpg",   "texte":"lorem ipsum16 ...", "naissance":"1900"],
    ] // lesAmisDeLaScienceData
    
    
    // *****************************************************
    override func viewDidLoad()
        // *****************************************************
    {
        super.viewDidLoad()
        
        // let uneImage = UIImageView(image: UIImage(named: lesAmisDeLaScienceData[0]["photo"]!))
        // view.addSubview(uneImage)
        
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
        return celluleCourante
    } // tableView: cellForRowAtIndexPath
    
}  // ViewController
