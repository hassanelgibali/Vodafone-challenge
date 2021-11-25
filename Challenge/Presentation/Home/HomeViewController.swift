//
//  ViewController.swift
//  Challenge
//
//  Created by Hassan on 22/11/2021.
//

import UIKit

class HomeViewController: BaseViewController {
    
   
    
    @IBOutlet weak var searchAirLinesTF: UITextField!
    @IBOutlet weak var airLinesTableView: UITableView!
    
    private var homeViewModel:HomeViewModel!
    var airLinesList = [AirlinesModelElement]()
    var isAirLinesListfiltred = false
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.layer.masksToBounds = false
        self.navigationController?.navigationBar.layer.shadowColor = UIColor.lightGray.cgColor
        self.navigationController?.navigationBar.layer.shadowOpacity = 0.8
        self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.navigationController?.navigationBar.layer.shadowRadius = 2
        self.navigationItem.backButtonTitle = ""
        self.navigationController?.title = "Countries"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        searchAirLinesTF.delegate = self
        callToViewModelForUIUpdate()
        // Do any additional setup after loading the view.
    }

    func callToViewModelForUIUpdate(){
        
        airLinesList.removeAll()
        self.homeViewModel = HomeViewModel()
        showProgressBar()
        self.homeViewModel.bindHomeViewModelToController = { [weak self] in
            self!.hideProgressBar()
            guard let airlineList = self?.homeViewModel.airLinesData else{return}
            self?.airLinesList = airlineList
            self?.airLinesTableView.reloadData()
        }

    }
    @IBAction func openNewAirLineBu(_ sender: Any) {
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "NewAirLines") as! AddNewAirLineViewController
        self.addChild(vc)
                self.view.addSubview(vc.view)
                vc.view.frame = CGRect(x: 0, y: self.view.frame.height, width: self.view.frame.width, height: self.view.frame.height)
        vc.willMove(toParent: self)
        UIView.animate(withDuration: 0.5) {
                    vc.view.frame = self.view.frame
                }
    }
    
}




extension HomeViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !homeViewModel.filtrdAirLinesList.isEmpty {
            return homeViewModel.filtrdAirLinesList.count
        }
        return  isAirLinesListfiltred ? 0 : airLinesList.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AirlinesTableViewCell
        if !homeViewModel.filtrdAirLinesList.isEmpty {
            cell.airLineNameLbl.text = homeViewModel.filtrdAirLinesList[indexPath.row].name

        }else {
            cell.airLineNameLbl.text = airLinesList[indexPath.row].name

        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let airLineDetailsVC = self.storyboard!.instantiateViewController(withIdentifier: "AirLineDetailsVC") as! AirLinesDetailsViewController
        if !homeViewModel.filtrdAirLinesList.isEmpty {
            airLineDetailsVC.airLinesListElemnt = homeViewModel.filtrdAirLinesList[indexPath.row]

        }else {
            airLineDetailsVC.airLinesListElemnt = airLinesList[indexPath.row]

        }
        self.navigationController?.pushViewController(airLineDetailsVC, animated: false)
    }
    
    
}



extension HomeViewController : UITextFieldDelegate {
    func filterSearchAirLinesText(_ query:String?) {
        
        homeViewModel.filterAirLineData(query)

        airLinesTableView.reloadData()
        isAirLinesListfiltred = true
    }
    

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let textFieldRange = NSRange(location: 0, length: textField.text!.count)
        
        if textField == searchAirLinesTF {
          
            if let text = textField.text {
                if (NSEqualRanges(range, textFieldRange) && string.count == 0) {
                    isAirLinesListfiltred = false
                    homeViewModel.filtrdAirLinesList.removeAll()
                    airLinesTableView.reloadData()
                }else {
                    if let char = string.cString(using: String.Encoding.utf8) {
                        let isBackSpace = strcmp(char, "\\b")
                        if (isBackSpace == -92) {
                            textField.text = ""
                            isAirLinesListfiltred = false
                            homeViewModel.filtrdAirLinesList.removeAll()
                            airLinesTableView.reloadData()
                        }else{
                            filterSearchAirLinesText(text+string)
                        }
                    }
                    
                    
                }
            }
        }
        return true
    }
    
}
