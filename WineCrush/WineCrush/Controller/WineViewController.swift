//
//  WineViewController.swift
//  WineCrush
//
//  Created by Adam Mabrouki on 25/02/2022.
//

import UIKit

class WineViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    var wines: [ProductMatch]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "WineViewCell", bundle: nil), forCellReuseIdentifier: "WineCell")
        tableView.reloadData()
    }
}

extension WineViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wines?.count ?? 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let  cell = tableView.dequeueReusableCell(withIdentifier: "WineCell", for: indexPath) as? WineViewCell else { return
            UITableViewCell() }
        cell.wine = wines?.first
        return cell
    }
    
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
        
    }

