//
//  ViewController.swift
//  module 03
//
//  Created by Alain on 2015-09-13.
//  Copyright (c) 2015 Production sur support. All rights reserved.
//  Module 03

import UIKit

class ViewController: UIViewController {

    var lesAmisDeLaScienceData:[Dictionary<String,String>] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        @IBOutlet weak var CVSavant: UICollectionView!
        // Chargement des données
        let pathFichierPlist = NSBundle.mainBundle().pathForResource("amisDelaScience", ofType: "plist")!
        lesAmisDeLaScienceData = NSArray(contentsOfFile: pathFichierPlist) as! Array
        
        println(lesAmisDeLaScienceData)
    }



}

