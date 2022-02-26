//
//  ViewController.swift
//  WineCrush
//
//  Created by Adam Mabrouki on 21/02/2022.
//

import UIKit

class ViewController: UIViewController {
    
    let wineService = WineService()
    private var wines: [ProductMatch]?
    
    @IBOutlet var backroundGradientView: UIView!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var foodTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBackroundGradient()
        searchViewUI()
    }
    
    // Create a gradient layer.
    func addBackroundGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1).cgColor, UIColor(red: 252/255, green: 170/255, blue: 200/255, alpha: 1).cgColor]
        gradientLayer.shouldRasterize = true
        backroundGradientView.layer.insertSublayer(gradientLayer, at: 0)
    }
    @IBAction func searchButtonTapped(_ sender: Any) {
        let foodToSearch = foodTextField.text ?? ""
        wineService.getWineMatch(food: foodToSearch) { result in
            
            switch result {
            case .success(let search):
                DispatchQueue.main.async {
                self.wines = search
                    self.presentWineVc()
                    print(result)
                    
                }
            case .failure(let error):
                print(error)
            }
    
        }
        
    }
    
    func presentWineVc() {
    let vc2 = self.storyboard?.instantiateViewController(withIdentifier: "wine") as! WineViewController
        vc2.wines = wines
        vc2.modalPresentationStyle = .pageSheet
       present(vc2, animated: true, completion: nil)
    }
    func searchViewUI() {
        searchView.layer.cornerRadius = 10
    }
    
}



