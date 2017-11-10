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
    tableView.delegate = self
    tableView.dataSource = self
    tableView.tableFooterView = UIView()

    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
  func numberOfSections(in tableView: UITableView) -> Int {
    return 3
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch section {
    case DetailViewSection.one.rawValue:
      return 1
    case DetailViewSection.two.rawValue:
      return 1
    case DetailViewSection.three.rawValue:
      return 1
    default: fatalError()
    }
    
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch indexPath.section {
    case DetailViewSection.one.rawValue:
      let cell = tableView.dequeueReusableCell(withIdentifier: "one", for: indexPath)
      return cell
    case DetailViewSection.two.rawValue:
      let cell = tableView.dequeueReusableCell(withIdentifier: "two", for: indexPath)
      return cell
    case DetailViewSection.three.rawValue:
      let cell = tableView.dequeueReusableCell(withIdentifier: "three", for: indexPath)
      return cell
    default: fatalError()
    }
  }
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    switch indexPath.section {
    case DetailViewSection.one.rawValue:
      return 240.0
    case DetailViewSection.two.rawValue:
      return 120.0
    case DetailViewSection.three.rawValue:
      return 240.0
    default:
      fatalError()
    }
  }
}

