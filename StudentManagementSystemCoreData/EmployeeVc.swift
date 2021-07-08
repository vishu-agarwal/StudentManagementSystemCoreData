//
//  EmployeeVc.swift
//  StudentManagementSystemCoreData
//
//  Created by DCS on 08/07/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class EmployeeVc: UIViewController {

    
    private let studtbl = UITableView()
    private var studArray = [Student]()
    
    
    override func viewDidLoad()
    {
        
        super.viewDidLoad()
        view.addSubview(studtbl)
        title = "Student"
        setuptbl()
        let additem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(newstudfunc))
        navigationItem.setLeftBarButton(additem, animated: true)
        
        // Do any additional setup after loading the view.
    }
    
    @objc private func newstudfunc(){
        
        let vc = NewStudvc()
        navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        studtbl.frame = view.bounds
    }

    override func viewWillAppear(_ animated: Bool)
    {
        studArray = CoreDataHandler.shared.fetch()
        studtbl.reloadData()
        
    }
}
extension EmployeeVc : UITableViewDelegate, UITableViewDataSource{
    private func setuptbl(){
        
        studtbl.register(UITableViewCell.self, forCellReuseIdentifier: "studcell")
        studtbl.delegate = self
        studtbl.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studcell", for : indexPath)
        let stud  = studArray[indexPath.row]
        cell.textLabel?.text = "\(stud.spid)\t|\t\(stud.studName)\t|\t\(stud.standard)"
        
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let stud = studArray[indexPath.row]
        
        CoreDataHandler.shared.delete(stud: stud){
            [weak self ] in
            self?.studArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
        }
    }
    
    
}
