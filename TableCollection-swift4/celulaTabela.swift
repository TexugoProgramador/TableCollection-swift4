//
//  celulaTabela.swift
//  TableCollection-swift4
//
//  Created by Humberto Puccinelli on 10/04/2018.
//  Copyright © 2018 Humberto Puccinelli. All rights reserved.
//

import UIKit

class celulaTabela: UITableViewCell {
    
    @IBOutlet weak var minhaCollectionView: UICollectionView!
    
    func setCollectionViewdelegate<D: UICollectionViewDelegate & UICollectionViewDataSource> (delegate: D, forRow row: Int){
        minhaCollectionView.delegate = delegate
        minhaCollectionView.dataSource = delegate
        minhaCollectionView.tag = row
        minhaCollectionView.reloadData()
    }
    
}
