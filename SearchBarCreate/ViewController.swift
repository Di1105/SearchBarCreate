//
//  ViewController.swift
//  SearchBarCreate
//
//  Created by Dilara Elçioğlu on 21.12.2022.
//

import UIKit
import SnapKit

import SnapKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate {
   

    let tableView = UITableView()
    let array = ["yavuz","emine","dilaRa","DilrubA","MeliHa","MEHMET"]
    let searchBar = UISearchBar()
    var filteredArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
         setUpUI()
    }

    func setUpUI(){
        view.addSubview(tableView)
        view.addSubview(searchBar)
        
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        filteredArray = array
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            
        }
        tableView.backgroundColor = .lightGray
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        searchBar.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        searchBar.backgroundColor = .lightGray
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = filteredArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredArray.count
    }
    /*
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //DİĞER CELL'E GEÇİŞ SAĞLANACAK
        
        print("sfnhd")
    }
     */
    
    //SEARCHBAR CONFIG.
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredArray = []
        
        if searchText == ""{
            filteredArray = array
        }else{
            for names in array{
                if names.lowercased().contains(searchText.lowercased()){
                    filteredArray.append(names)
                }
            }
        }
        
        tableView.reloadData()
    }

}



