//
//  AirLinesDetailsViewController.swift
//  Challenge
//
//  Created by Hassan on 22/11/2021.
//

import UIKit

class AirLinesDetailsViewController: BaseViewController {
    
    var airLinesListElemnt : AirlinesModelElement?

    @IBOutlet weak var airLineNameLbl: UILabel!
    @IBOutlet weak var airLineCountryLbl: UILabel!
    @IBOutlet weak var airLineSloganLbl: UILabel!
    @IBOutlet weak var airLineAddressLbl: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setAirLineDetails()
        setupNavigationBar()


    }
    
    private func setAirLineDetails() {
        guard let airLineItem = airLinesListElemnt else{return}
        airLineNameLbl.text = airLineItem.name
        airLineCountryLbl.text = airLineItem.country
        airLineSloganLbl.text = airLineItem.slogan
        airLineAddressLbl.text = airLineItem.headQuaters
    }


    
    @IBAction func visitAirLineBtnPressed(_ sender: Any) {
        guard let webSiteUrlString = airLinesListElemnt?.website 
        else {return}
        if (webSiteUrlString).contains("https"){
            if let url = URL(string: (webSiteUrlString)) {
            UIApplication.shared.open(url)
            }
  
        }else{
            if let url =  URL(string: "https://"+(webSiteUrlString)){
                UIApplication.shared.open(url)

            }
            
        }
    

    }
    
}
