//
//  NewStudvc.swift
//  StudentManagementSystemCoreData
//
//  Created by DCS on 08/07/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class NewStudvc: UIViewController {

    private let spidtxt:UITextField = {
        let txt = UITextField()
        txt.placeholder = "Enter SPID"
        txt.textColor = .blue
        txt.borderStyle = .roundedRect
        txt.font = UIFont(name : "", size : 20.0)
        txt.textAlignment = .center
        
        return txt
    }()
    
    private let nametxt:UITextField = {
        let txt = UITextField()
        txt.placeholder = "Enter Name"
        txt.textColor = .blue
        txt.borderStyle = .roundedRect
        txt.font = UIFont(name : "", size : 20.0)
        txt.textAlignment = .center
        
        return txt
    }()
    private let agetxt:UITextField = {
        let txt = UITextField()
        txt.placeholder = "Enter Age"
        txt.textColor = .blue
        txt.borderStyle = .roundedRect
        txt.font = UIFont(name : "", size : 20.0)
        txt.textAlignment = .center
        
        return txt
    }()
    private let citytxt:UITextField = {
        let txt = UITextField()
        txt.placeholder = "Enter File Name"
        txt.textColor = .blue
        txt.borderStyle = .roundedRect
        txt.font = UIFont(name : "", size : 20.0)
        txt.textAlignment = .center
        
        return txt
    }()
    
    private let phonetxt:UITextField = {
        let txt = UITextField()
        txt.placeholder = "Enter Phone No"
        txt.textColor = .blue
        txt.borderStyle = .roundedRect
        txt.font = UIFont(name : "", size : 20.0)
        txt.textAlignment = .center
        
        return txt
    }()

    private let stdtxt:UITextField = {
        let txt = UITextField()
        txt.placeholder = "Enter Class"
        txt.textColor = .blue
        txt.borderStyle = .roundedRect
        txt.font = UIFont(name : "", size : 20.0)
        txt.textAlignment = .center
        
        return txt
    }()
    
    
    private let mybtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Save Me!!", for: .normal)
        btn.addTarget(self, action: #selector(savestud), for: .touchUpInside)
        btn.backgroundColor = .green
        btn.layer.cornerRadius = 10
        return btn
    }()
    
    
    @objc private func    savestud()
    {
        let name = nametxt.text!
        
        let stud  = Student(id : spid, name : studName)
        
        if let stud = Student {
            
            CoreDataHandler.shared.update(stud: stud, id: spid, name: <#T##String#>, city: <#T##String#>, phone: <#T##String#>, std: <#T##String#>, age: <#T##Int#>, completion: <#T##() -> Void#>){
                [weak self] in
                
                self?.navigationController?.popViewController(animated: true)
                
            }
            
        }
        else{
            CoreDataHandler.shared.insert(id: <#T##String#>, name: <#T##String#>, city: <#T##String#>, phone: <#T##String#>, std: <#T##String#>, age: <#T##Int#>, completion: <#T##() -> Void#>)
            {
                
            }
        }
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(spidtxt)
        view.addSubview(agetxt)
        view.addSubview(citytxt)
        view.addSubview(nametxt)
        view.addSubview(phonetxt)
        view.addSubview(stdtxt)
        view.addSubview(mybtn)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
       spidtxt.frame = CGRect(x: 40, y: view.safeAreaInsets.top + 20, width: view.width - 80, height: 40)
        
        
    }

}

