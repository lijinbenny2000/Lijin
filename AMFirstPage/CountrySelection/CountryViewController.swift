//
//  CountryViewController.swift
//  AMFirstPage
//
//  Created by Lijin Benny on 26/10/23.
//

import Foundation
import UIKit

protocol CountrySelectionDelegate: AnyObject {
    func didSelectCountry(icon: String, title: String)
}

class CountryViewController: UIViewController {
    
    @IBOutlet weak var countryTableView: UITableView!
    
    let localizedCountryNames: [Country: String] = [
        .jordan: Strings.jordan.localized,
        .palestine: Strings.palestine.localized,
        .egypt: Strings.egypt.localized,
        .lebanon: Strings.lebanon.localized,
        .unitedArabEmirates: Strings.uae.localized,
        .qatar: Strings.qatar.localized,
        .bahrain: Strings.beharain.localized,
        .algeria: Strings.algeria.localized
    ]
    var countries: [Country] = [.jordan, .palestine, .egypt, .lebanon, .unitedArabEmirates, .qatar, .bahrain, .algeria]
    var delegate: CountrySelectionDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        countryTableView.register(UINib(nibName: "countryCustomCell", bundle: nil), forCellReuseIdentifier: "countryCellIdentifier")
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage.remove, style: .plain, target: self, action: #selector(dismissApp))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage.add, style: .plain, target: self, action: #selector(moreOptions))
    }
    
    @objc func moreOptions() {
        let alertController = UIAlertController(title: "Alert", message: "Press 'Dismiss' to exit.", preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Dismiss", style: .destructive) { _ in
            exit(0)
        }
        alertController.addAction(dismissAction)
        self.present(alertController, animated: true, completion: nil)
        
    }
    @objc func dismissApp(){
        dismiss(animated: true, completion: nil)
    }
}

extension CountryViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = countries[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCellIdentifier", for: indexPath) as? countryCustomCell
        // Set the localized name in the cell
        if let localizedName = localizedCountryNames[data] {
            cell?.fillCustomCell(imageIcon: data.icon, imageTitle: localizedName, checklist: "checklist")
        }
        return cell ?? UITableViewCell()
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCountry = countries[indexPath.row]
        if let localizedName = localizedCountryNames[selectedCountry] {
            delegate?.didSelectCountry(icon: selectedCountry.icon, title: localizedName)
        }
        let cell = tableView.cellForRow(at: indexPath) as? countryCustomCell
            cell?.showSelectionIndicator()
            cell?.selectionStyle = .none
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
        let cell = tableView.cellForRow(at: indexPath) as? countryCustomCell
            cell?.hideSelectionIndicator()
    }
}


