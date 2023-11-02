//
//  languageViewController.swift
//  AMFirstPage
//
//  Created by Lijin Benny on 30/10/23.
//

import Foundation
import UIKit

protocol LanguageSelectionDelegate {                //Can use AnyObject as well   :AnyObject
    func didSelectlanguage(lang: String)
}

class languageViewController: UIViewController {
    @IBOutlet weak var countryImage: UIImageView!
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var languageTableView: UITableView!

    var delegate: LanguageSelectionDelegate?
    var languages: [String] = ["English", "عربي"]
    var country: String?
    var countryImageIcon: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countryName.text = country
        countryImage.image = countryImageIcon
        languageTableView.register(UINib(nibName: "languageCustomCell", bundle: nil), forCellReuseIdentifier: "languageCell")
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(image: UIImage.add, style: .plain, target: self, action: #selector(moreOptions))]
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage.remove, style: .plain, target: self, action: #selector(dismissApp))
    }
    
    @objc func moreOptions() {
        let alertController = UIAlertController(title: "Alert", message: "Press 'Dismiss' to exit the application.", preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Dismiss", style: .destructive) { _ in
            exit(0)
        }
        alertController.addAction(dismissAction)
        self.present(alertController, animated: true, completion: nil)
    }
    @objc func dismissApp(){
        dismiss(animated: true, completion: nil)
    }
    func alertforLanguageSelection() {
        let alertController = UIAlertController(title: "Alert", message: "Please quit the application to change the language.", preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Quit", style: .destructive) { _ in
            exit(0)
        }
        alertController.addAction(dismissAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

extension languageViewController: UITableViewDelegate,UITableViewDataSource {
    
    func setAppLanguage(_ languageCode: String) {
        UserDefaults.standard.set([languageCode], forKey: "AppleLanguages")
        UserDefaults.standard.synchronize()
        alertforLanguageSelection()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = languages[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "languageCell", for: indexPath) as? languageCustomCell
        cell?.fillCustomlanguageCell(languageTitle: data, checklist: "checklist")
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedlanguage = languages[indexPath.row]
        delegate?.didSelectlanguage(lang: selectedlanguage)
        if selectedlanguage == "عربي" {
            setAppLanguage("ar")
        }
        else if selectedlanguage == "English" {
            setAppLanguage("en")
        }
        else {
            print("Language not identified")
        }
        let cell = tableView.cellForRow(at: indexPath) as? languageCustomCell
            cell?.showSelectionIndicator()
            cell?.selectionStyle = .none
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
        let cell = tableView.cellForRow(at: indexPath) as? languageCustomCell
            cell?.hideSelectionIndicator()
    }
}


