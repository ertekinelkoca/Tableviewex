//
//  ViewController.swift
//  TableViewApp
//
//  Created by mac on 27.09.2020.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var racingNames = [String]()
    var racingImages = [UIImage]()
    var chosenRacingName = ""
    var chosenRacingImages = UIImage()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        //DATAS
        racingNames.append("cbr1000rrsp")
        racingNames.append("gsxr1000")
        racingNames.append("h2")
        racingNames.append("HP4")
        racingNames.append("yzfr1")
        racingNames.append("zx10r")
        
        racingImages.append(UIImage(named: "cbr1000rrsp")!)
        racingImages.append(UIImage(named: "gsxr1000")!)
        racingImages.append(UIImage(named: "h2")!)
        racingImages.append(UIImage(named: "HP4")!)
        racingImages.append(UIImage(named: "yzfr1")!)
        racingImages.append(UIImage(named: "zx10r")!)
        
        navigationItem.title = "Racing Book"
        
    }
    
    //delegate cell seçildiğinde kullanıcı etkileşimi ne olacak , actionlarda table view'ı bilgilendirir
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            racingNames.remove(at: indexPath.row)
            racingImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return racingImages.count
    }
    
    //seçilen row ile ilgili bilgiler üzerindek işlemler.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = racingNames[indexPath.row]
        return cell
    }
    
    //seçilince ne olacak
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenRacingName = racingNames[indexPath.row]
        chosenRacingImages = racingImages[indexPath.row]
        performSegue(withIdentifier: "toImageViewController", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toImageViewController"{
            
            //To cast segue destination to imageViewController
            let destinationVC = segue.destination as! ImageViewController
            destinationVC.selectedRacingName = chosenRacingName
            destinationVC.selectedRacingImage = chosenRacingImages
        }
    }
    
}

