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
    case ProductPic = 0
    case ProductDet = 1
    case ProductSRF = 2
    case Other = 3
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

