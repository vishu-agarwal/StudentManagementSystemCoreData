//
//  NewNoticeVC.swift
//  StudentAdmissionSystemUsingSqlite
//
//  Created by DCS on 12/07/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class NewNoticeVC: UIViewController {

    
    var notes : Note?
    
    private let txttitle:UITextField = {
        let txt = UITextField()
        txt.placeholder = "Enter tile Name"
        txt.textColor = .blue
        txt.borderStyle = .roundedRect
        txt.font = UIFont(name : "", size : 20.0)
        txt.textAlignment = .center
        
        return txt
    }()
    private let contentView:UITextView = {
        let txtView = UITextView()
        txtView.textColor = .black
        
        return txtView
    }()
    private let mybtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Save Me!!", for: .normal)
        btn.addTarget(self, action: #selector(saveNote), for: .touchUpInside)
        btn.backgroundColor = .green
        btn.layer.cornerRadius = 10
        return btn
    }()
    
    @objc private func saveNote()
    {
        let name = txttitle.text!
       
        let cont = contentView.text!
        
      //  let notice = Note(nid: 0, ntitle: name, msg: cont)
        if let notice = notes
        {
            
            CoreDataHandler.shared.nupdate(note: notice, title: name, msg : cont)
            {
                [weak self]  in
               
                    self?.navigationController?.popViewController(animated: false)
            }
                
        }
        else{
            CoreDataHandler.shared.ninsert(title: name, msg: cont)
            {
                
                  [weak self] in
                self?.navigationController?.popViewController(animated: false)
                
            }
        }
        
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        view.addSubview(mybtn)
        view.addSubview(txttitle)
        view.addSubview(contentView)
        
        if let notice = notes
        {
            
            txttitle.text = notice.title
           
            contentView.text = notice.msg
            
        }

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        txttitle.frame = CGRect(x: 40, y: view.safeAreaInsets.top + 20, width: view.width - 80, height: 40)
        contentView.frame = CGRect(x: 40, y: txttitle.bottom + 20, width: view.width - 80, height: 400)
        mybtn.frame = CGRect (x: 40, y: contentView.bottom + 20, width: view.width - 80, height: 40)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
