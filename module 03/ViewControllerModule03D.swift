//
//  ViewController.swift
//  module 03
//
//  Created by Alain on 2015-09-13.
//  Copyright (c) 2015 Production sur support. All rights reserved.
//  Module 03

import UIKit

class ViewControllerModule03D: UIViewController {

    @IBOutlet weak var CVSavant: UICollectionView!

    var lesAmisDeLaScienceData:[Dictionary<String,String>] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Chargement des données
        let pathFichierPlist = Bundle.main.path(forResource: "amisDelaScience", ofType: "plist")!
        lesAmisDeLaScienceData = NSArray(contentsOfFile: pathFichierPlist) as! Array
        
        print(lesAmisDeLaScienceData)
    }



}

