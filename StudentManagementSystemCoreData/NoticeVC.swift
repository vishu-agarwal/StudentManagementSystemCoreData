//
//  NoticeVC.swift
//  StudentAdmissionSystemUsingSqlite
//
//  Created by DCS on 12/07/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class NoticeVC: UIViewController {

    
    private var noticearray = [Note]()
    
    private let noticetbl = UITableView()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        noticearray = CoreDataHandler.shared.nfetch()
        noticetbl.reloadData()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "NOTICE-BOARD"
        
        view.addSubview(noticetbl)
        
        setuptbl()
        
        view.backgroundColor = .white
        let additem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(newNoticefunc))
        navigationItem.setRightBarButton(additem, animated: true)
       /* let additem2 = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(logoutFunc))
        navigationItem.setRightBarButton(additem2, animated: true)*/
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        noticetbl.frame = view.bounds
    }
    
    @objc private func newNoticefunc(){
        
        let vc = NewNoticeVC()
        navigationController?.pushViewController(vc, animated: true)
    }

}
extension NoticeVC : UITableViewDelegate, UITableViewDataSource{
    private func setuptbl(){
        
        noticetbl.register(UITableViewCell.self, forCellReuseIdentifier: "noticecell")
        noticetbl.delegate = self
        noticetbl.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noticearray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noticecell", for : indexPath)
        let note  = noticearray[indexPath.row]
        cell.textLabel?.text = "\(String(note.title!))"
        
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
       
        let notice  = noticearray[indexPath.row]
        
        CoreDataHandler.shared.ndelete(notice: notice)
        {
            [weak self] in
           
                self?.noticearray.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
                self?.noticetbl.reloadData()
            
            
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = NewNoticeVC()
        vc.notes = noticearray[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
