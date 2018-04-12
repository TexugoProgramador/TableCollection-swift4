//
//  VCprincipal.swift
//  TableCollection-swift4
//
//  Created by Humberto Puccinelli on 10/04/2018.
//  Copyright © 2018 Humberto Puccinelli. All rights reserved.
//

import UIKit

class VCprincipal: UITableViewController {
    
    let dados = geradorArray2D(linhasQTD: 15, objetosQTD: 15)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dados.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = tableView.dequeueReusableCell(withIdentifier: "celula", for: indexPath)
        return celula
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let tableViewCell = cell as? celulaTabela{
            tableViewCell.setCollectionViewdelegate(delegate: self, forRow: indexPath.row)
        }
    }
}

extension VCprincipal: UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dados[collectionView.tag].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCelula", for: indexPath)
        cell.backgroundColor = dados[collectionView.tag][indexPath.row]
        cell.layer.cornerRadius = cell.bounds.height / 2
        return cell
    }
    
}

// função para gerar dados
func geradorArray2D(linhasQTD: Int, objetosQTD: Int) -> [[UIColor]] {
    let numeroLinhas = linhasQTD
    let itensLinha = objetosQTD
    var coresArray = [[UIColor]]()
    
    for row in 1...numeroLinhas {
        var cores = [UIColor]()
        for item in 1...itensLinha {
            if ((row + item) % 2) == 0 {
                cores.append(UIColor.red)
            }
            else {
                cores.append(UIColor.black)
            }
        }
        coresArray.append(cores)
    }
    return coresArray
}
