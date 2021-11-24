//
//  AddNewAirLineViewController.swift
//  Challenge
//
//  Created by Hassan on 23/11/2021.
//

import UIKit

class AddNewAirLineViewController: BaseViewController {
    
    @IBOutlet weak var blurView: UIView!
    @IBOutlet weak var airLineNameTxtField: UITextField!
    @IBOutlet weak var sloganTxtField: UITextField!
    @IBOutlet weak var countryTxtField: UITextField!
    @IBOutlet weak var headquarterTxtField: UITextField!
    
    private var addNewAirLineViewModel:AddNewAirLineViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addGetureView()
        
        // Do any additional setup after loading the view.
    }
    
    func addGetureView(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        self.view.addGestureRecognizer(tap)
    }
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        self.view.removeFromSuperview()
    }
    
    
    func callToViewModelForUIUpdate(){
        
        self.addNewAirLineViewModel = AddNewAirLineViewModel()
        self.addNewAirLineViewModel.getAirLinesData(name: airLineNameTxtField.text!, country: countryTxtField.text!, slogan: sloganTxtField.text!, headquaters: headquarterTxtField.text!)
        showProgressBar()
        self.addNewAirLineViewModel.bindAddNewAirLineViewModelToController = { [weak self] in
            self!.hideProgressBar()
            self?.alert(message:self?.addNewAirLineViewModel.message ?? "")
        }
        
    }
    
    @IBAction func addingNewAirLineBuPressed(_ sender: Any) {
        if airLineNameTxtField.text! != "" && countryTxtField.text! != "" && sloganTxtField.text! != "" &&  headquarterTxtField.text! != "" {
            callToViewModelForUIUpdate()
        }else{
            self.alert(message: "please fill all date")
        }
    }
    @IBAction func cancelNewAirLineBuPressed(_ sender: Any) {
        self.view.removeFromSuperview()
    }
    
    
}
