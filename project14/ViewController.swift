//
//  ViewController.swift
//  project14
//
//  Created by Mac on 2017/11/9.
//  Copyright © 2017年 sunnyleeyun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!
  enum DetailViewSection: Int{
    case one = 0
    case two = 1
    case three = 2
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

