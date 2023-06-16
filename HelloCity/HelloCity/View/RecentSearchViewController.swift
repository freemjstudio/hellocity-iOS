//
//  RecentSearchViewController.swift
//  HelloCity
//
//  Created by 우민지 on 2023/06/15.
//

import Foundation
import UIKit
import SnapKit
import TMapSDK
import CoreLocation



class RecentSearchViewController: UITableViewController, UISearchBarDelegate {
    
    var callBack: (() -> Void)?
    
    var destSearchBar : UISearchBar! = UISearchBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 56))
    // CGRect(x: 26, y: 108, width: UIScreen.main.bounds.width, height: 56)
    let endTextPlaceHolder = "도착지 입력"
    
    let backgroundView = UIView()
    let addrData = ["서울 특별시 성북구 보문사길 111", "서울 특별시 성북구 개운사 "]
    var filterData: [String]!
    let CELLID = "cell"
    let header = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 70))
    
    override func viewDidLoad() {
        super.viewDidLoad()

                // table view 만들기
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: self.CELLID)
        initializeView()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: destSearchBar)
    }
    

    
    
    func initializeView() {
        self.view.addSubview(backgroundView)
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        backgroundView.backgroundColor = .white
        filterData = addrData
      //  tableView.tableHeaderView = header
        self.tableView.separatorStyle = .none
        destSearchBar.backgroundColor = .white
        destSearchBar.placeholder = endTextPlaceHolder
        destSearchBar.searchTextField.backgroundColor = .white
        
        destSearchBar.barTintColor = .white
        
        destSearchBar.setImage(UIImage(named: "search_bar"), for: .search, state: .normal)
        destSearchBar.layer.borderWidth = 1
        destSearchBar.layer.borderColor = UIColor.black.cgColor
        destSearchBar.layer.cornerRadius = 12
        

        header.addSubview(destSearchBar)
        
       
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterData = []
        
        
        
        if searchText == ""
        {
            filterData = addrData
        }
        
        for addr in addrData {
            filterData.append(addr)
        }
        
        self.tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterData.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CELLID, for: indexPath)
        cell.textLabel?.text = filterData[indexPath.row]
        var image : UIImage = UIImage(named: "place")!
        cell.imageView?.image = image
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(ResultViewController(), animated: true)
    }
    
    @objc func switchVC(sender: UIButton) {
         print("btn Tapped ! ")
         let nextVC = RecentSearchViewController()
         self.navigationController?.pushViewController(nextVC, animated: true)
     }
}

