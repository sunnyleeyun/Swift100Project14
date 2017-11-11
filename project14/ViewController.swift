//
//  ViewController.swift
//  project14
//
//  Created by Mac on 2017/11/9.
//  Copyright © 2017年 sunnyleeyun. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class ViewController: UIViewController {

  var databaseRef: DatabaseReference!
  
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

    databaseRef = Database.database().reference()

    fetchData()
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
//  var movieList = [Movie]()
  
  var oneList = [One]()
  var twoList = [Two]()
  var threeList = [Three]()
  
  func fetchData(){
    databaseRef.child("Movie").observe(.childAdded) { (snapshot) in
      
      if let dictionary = snapshot.value as? [String: AnyObject]{
        print("dictionary is \(dictionary)")
//        let movie = Movie()
        
        let one = One()
        let two = Two()
        let three = Three()
        
//        movie.name = dictionary["name"] as? String
//        movie.chinese = dictionary["chinese"] as? String
//        movie.english = dictionary["english"] as? String
//        movie.imageUrl = dictionary["image"] as? String
//        movie.detail = dictionary["detail"] as? String
//
//        self.movieList.append(movie)
        
        one.imageUrl = dictionary["image"] as? String
        two.chinese = dictionary["chinese"] as? String
        two.english = dictionary["english"] as? String
        three.detail = dictionary["detail"] as? String
        
        self.oneList.append(one)
        self.twoList.append(two)
        self.threeList.append(three)
        
        DispatchQueue.main.async {
          self.tableView.reloadData()
        }
        
      }
      
    }
  }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
  func numberOfSections(in tableView: UITableView) -> Int {
    return 3
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch section {
    case DetailViewSection.one.rawValue:
      return oneList.count
    case DetailViewSection.two.rawValue:
      return twoList.count
    case DetailViewSection.three.rawValue:
      return threeList.count
    default: fatalError()
    }
    
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch indexPath.section {
    case DetailViewSection.one.rawValue:
      let cell = tableView.dequeueReusableCell(withIdentifier: "one", for: indexPath) as! OneTableViewCell
      if let imgUrl = URL(string: oneList[indexPath.row].imageUrl!){
        cell.imageUrl.downloadedFrom(url: imgUrl)
      }
      
      return cell
    case DetailViewSection.two.rawValue:
      let cell = tableView.dequeueReusableCell(withIdentifier: "two", for: indexPath) as! TwoTableViewCell
      cell.chinese.text = twoList[indexPath.row].chinese
      cell.english.text = twoList[indexPath.row].english


      return cell
    case DetailViewSection.three.rawValue:
      let cell = tableView.dequeueReusableCell(withIdentifier: "three", for: indexPath) as! ThreeTableViewCell
      cell.detail.text = threeList[indexPath.row].detail
    
      

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

