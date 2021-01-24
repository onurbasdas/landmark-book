//
//  ViewController.swift
//  LandMarkBook
//
//  Created by Onur Başdaş on 24.01.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var landmarkNames = [String]()
    var landmarkImages = [UIImage]()
    var landmarkText = [String]()
    var chosenLandmarkName = ""
    var chosenLandmarkImage = UIImage()
    var chosenLandmarkText = ""
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //        Landmark Book Data
        
        landmarkNames.append("Collesium")
        landmarkNames.append("Great Wall")
        landmarkNames.append("Kremlin")
        landmarkNames.append("Stonehenge")
        landmarkNames.append("Taj Mahal")
        
        landmarkImages.append(UIImage(named: "collesium")!)
        landmarkImages.append(UIImage(named: "greatwall")!)
        landmarkImages.append(UIImage(named: "kremlin")!)
        landmarkImages.append(UIImage(named: "stonehenge")!)
        landmarkImages.append(UIImage(named: "tacmahal")!)
        
        landmarkText.append("Also known as the Flavianus Amphitheater in Rome, the capital of Italy, the Coliseum is an arena. Its construction was started in AD 72 by Vespasian, a master commander, and was completed in AD 80 during the Titus period. Later changes were made during the Domitian reign.")
        landmarkText.append("The Chinese were already familiar with the techniques of wall-building by the time of the Spring and Autumn period between the 8th and 5th centuries BC.")
        landmarkText.append("The Moscow Kremlin (Russian: Московский Кремль, tr. Moskovskiy Kreml, IPA: [mɐˈskofskʲɪj krʲemlʲ]), or simply the Kremlin, is a fortified complex in the center of Moscow, overlooking the Moskva River to the south, Saint Basil's Cathedral and Red Square to the east, and the Alexander Garden to the west.")
        landmarkText.append("Stonehenge is a prehistoric monument in Wiltshire, England, two miles (3 km) west of Amesbury. It consists of a ring of standing stones, each around 13 feet (4.0 m) high, seven feet (2.1 m) wide, and weighing around 25 tons.")
        landmarkText.append("The Taj Mahal lit. 'Crown of the Palace', is an ivory-white marble mausoleum on the southern bank of the river Yamuna in the Indian city of Agra.")
        
        navigationItem.title = "Landmark Book"
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            landmarkNames.remove(at: indexPath.row)
            landmarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = landmarkNames[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenLandmarkName = landmarkNames[indexPath.row]
        chosenLandmarkImage = landmarkImages[indexPath.row]
        chosenLandmarkText = landmarkText[indexPath.row]
        
        performSegue(withIdentifier: "toImageViewController", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toImageViewController"{
            let destinationVC = segue.destination as! imageViewController
            destinationVC.selectedLandmarkName = chosenLandmarkName
            destinationVC.selectedLandmarkImage = chosenLandmarkImage
            destinationVC.selectedLandmarkText = chosenLandmarkText
        }
    }
}

