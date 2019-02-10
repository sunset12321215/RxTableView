//
//  ViewController.swift
//  RxTableView
//
//  Created by mac on 2/7/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let nameArray = ["1. Bùi Kim Quyên 8/7/1991", "2. Võ An Phước Thiện 25/1/1989", "3. Phạm Nguyễn QuỳnhTrân 28/4/1987", "4. Dương Hoài Phương 30/5/1981", "5. Phan Vinh Bính 28/8/1992", "6. Võ Minh Thư 21/10/1994", "7. Phan Huỳnh Ngọc Dung 10/10/1996", "8. Nguyễn Vân Anh 22/1/1993", "9. Nguyễn Thế Vinh 6/9/1993", "10. Nguyen Thi Thanh Bích 3/8/1992"]
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {        
        //  1.  Tạo Observable
        let observable = Observable.just(nameArray)
        
        observable.bind(to: tableView.rx.items(cellIdentifier: "TableViewCell")) {
            _, name, cell in
            cell.textLabel?.text = name
        }.disposed(by: disposeBag)
    }
}

