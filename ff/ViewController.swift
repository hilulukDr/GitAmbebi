//
//  ViewController.swift
//  ff
//
//  Created by iMac on 5/29/18.
//  Copyright © 2018 iMac. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource
{
    var  satauri = [Welcome]()
    var aray = [String]()
    var aray1 = [String]()
    var aray2 = [String]()
    var page = 0
    @IBOutlet weak var collectionview: UICollectionView!
    var someString = [UIImage]()
    var UiTableviewArray = [UITableView]()
    @IBOutlet weak var tableview: UITableView!

    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    var menuShoving = false
    let animals = ["one","two", "three","four","five","six","seven","eight","nine", "ten"]
    let ListOfMenu = ["მთავარი","პოლიტიკა","საზოგადოება","სამართალი","მსოფლიო","სამხედრო"]
    let list = ["sazogadoeba","politika","sazogadoeba","politika","sazogadoeba","politika","sazogadoeba","politika","sazogadoeba","politika"]
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadJSON {
            self.reloadInputViews()
        }
        ScroolTableview()
        scrollview.tag = 2
        collectionview.tag = 1
        
    }
    
    
    
    func downloadJSON(completed: @escaping () -> ()) {

        let jsonUrlString = "https://www.ambebi.ge/api/category/" + list[page] + "/?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhdXRoMCJ9.urUECF7BxkKHIW-WsEbSkEwyn8I_pHkTPhPzfsjeXuo"
        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            
            guard let data = data else { return }
            
            do {
                self.satauri = [try JSONDecoder().decode(Welcome.self, from: data)]
                
                for one in self.satauri {
                    for on in one.latestArticles{
                        
                        self.aray.append(on.title)
                        self.aray1.append(on.publishUp)
                        self.aray2.append(on.image)
                    }
                    DispatchQueue.main.async {
                        completed()
                        
                    }
                }
            } catch let jsonErr {
                print("Error serializing json:", jsonErr)
            }
            }.resume()
        
    }
    
    
    
    
    
    let t1 = UITableView()
    let t2 = UITableView()
    let t3 = UITableView()
    let t4 = UITableView()
    let t5 = UITableView()
    let t6 = UITableView()

    private func ScroolTableview(){
        
        scrollview.frame = CGRect(x: 0, y: 102, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-102)
        
        
        
        t1.contentSize = scrollview.contentSize
        t2.contentSize = scrollview.contentSize
        t3.contentSize = scrollview.contentSize
        t4.contentSize = scrollview.contentSize
        t5.contentSize = scrollview.contentSize
        t6.contentSize = scrollview.contentSize

        t1.backgroundColor = UIColor(hue: 0.5667, saturation: 1, brightness: 0.8, alpha: 1.0)
        t2.backgroundColor = UIColor(hue: 0.5667, saturation: 1, brightness: 0.8, alpha: 1.0)
        t3.backgroundColor = UIColor(hue: 0.5667, saturation: 1, brightness: 0.8, alpha: 1.0)
        t4.backgroundColor = UIColor(hue: 0.5667, saturation: 1, brightness: 0.8, alpha: 1.0)
        t5.backgroundColor = UIColor(hue: 0.5667, saturation: 1, brightness: 0.8, alpha: 1.0)
        t6.backgroundColor = UIColor(hue: 0.5667, saturation: 1, brightness: 0.8, alpha: 1.0)
        UiTableviewArray.append(t1)
        UiTableviewArray.append(t2)
        UiTableviewArray.append(t3)
        UiTableviewArray.append(t4)
        UiTableviewArray.append(t5)
        UiTableviewArray.append(t6)
        for i in 0..<UiTableviewArray.count{
            UiTableviewArray[i].dataSource = self
            UiTableviewArray[i].delegate = self
            // let uit = UITableView()
            //uit.backgroundView = UiTableviewArray[i]
            UiTableviewArray[i].contentMode = .scaleToFill
            let xposition = self.view.frame.width*CGFloat(i)
            UiTableviewArray[i].frame = CGRect(x: xposition, y: 0, width: self.scrollview.frame.width, height: self.scrollview.frame.height)
            scrollview.contentSize.width = scrollview.frame.width*CGFloat(i+1)
            let nibname = UINib(nibName: "TableViewCellHighDesign", bundle: nil)
            UiTableviewArray[i].register(nibname, forCellReuseIdentifier: "tableViewCellHighDesign")
            scrollview.addSubview(UiTableviewArray[i])
            
            
        }
    }
    

    
    
    //მენიუს ქოლექშენი
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return ListOfMenu.count
        
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView.tag == 2 { // scrollView scrolled
            
            
            
            let indexOfPage = round(scrollview.contentOffset.x / scrollview.frame.size.width)
    UIView.animate(withDuration: 0.2, animations: {
                self.collectionview.scrollToItem(at:IndexPath(item: Int(indexOfPage), section: 0), at: .centeredHorizontally, animated: false)
            })
            
            
        }
        else {                    // collectionView scrolled
            print("collectionview")
        }
        
        
        collectionview.reloadData()
        
    }
    
    //    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    //
    //        if(velocity.y>0) {
    //     page = +1
    //            UIView.animate(withDuration: 2.5, delay: 0, options: UIViewAnimationOptions(), animations: {
    //                self.navigationController?.setNavigationBarHidden(true, animated: true)
    //
    //
    //            }, completion: nil)
    //
    //        } else {
    //            page = -1
    //            UIView.animate(withDuration: 2.5, delay: 0, options: UIViewAnimationOptions(), animations: {
    //                self.navigationController?.setNavigationBarHidden(false, animated: true)
    //
    //
    //            }, completion: nil)
    //        }
    //        collectionview.reloadData()
    //    }
    //
    //     func scrollViewDidScroll(_ scrollView: UIScrollView) {
    //        collectionview.reloadData()
    //
    //
    //
    //    }
    //
    //    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
    //        let indexOfPage = round(scrollview.contentOffset.x / scrollview.frame.size.width)
    //        UIView.animate(withDuration: 0.5, animations: {
    //            self.collectionview.scrollToItem(at:IndexPath(item: Int(indexOfPage), section: 0), at: .right, animated: false)
    //
    //        })
    //        collectionview.reloadData()
    //    }
    var selectedIndex = Int ()
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "mycell", for: indexPath) as! MenuListCollectionViewCell
        cell.commoninit(name: ListOfMenu[indexPath.row])
        
        let IndexForCol = (scrollview.contentOffset.x / scrollview.frame.size.width).rounded()
        
        if selectedIndex == Int(indexPath.row)
        {
           
            cell.backgroundColor = UIColor(hue: 0.6167, saturation: 1, brightness: 0.97, alpha: 1.0)
            cell.layer.cornerRadius = 14
        
        }
        if indexPath.row == Int(IndexForCol) {
          
            cell.backgroundColor = UIColor(hue: 0.6167, saturation: 1, brightness: 0.97, alpha: 1.0)
       
        }
        else
        {
            cell.backgroundColor = UIColor.clear
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         UIView.animate(withDuration: 0.3, animations: {
            self.scrollview.contentOffset.x = self.scrollview.frame.width*CGFloat(indexPath.row)
        })
    }
    
    //მენიუს ქოლექშენი
    
    func get_image(_ url_str:String, _ imageView:UIImageView)
    {
        
        let url:URL = URL(string: url_str)!
        let session = URLSession.shared
        
        let task = session.dataTask(with: url, completionHandler: {
            (
            data, response, error) in
            
            
            if data != nil
            {
                let image = UIImage(data: data!)
                
                if(image != nil)
                {
                    
                    DispatchQueue.main.async(execute: {
                        
                        imageView.image = image
                        imageView.alpha = 0
                        
                        UIView.animate(withDuration: 2.0, animations: {
                            imageView.alpha = 1.0
                        })
                        
                    })
                    
                }
                
            }
            
            
        })
        
        task.resume()
    }
    
    //თეიბლვიუ
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cel = tableView.dequeueReusableCell(withIdentifier: "tableViewCellHighDesign", for: indexPath) as! TableViewCellHighDesign
        UIView.animate(withDuration: 2.0, animations: {
        cel.layer.cornerRadius = 5
        cel.layer.borderWidth = 0.5
        cel.layer.borderColor = UIColor(hue: 0.5667, saturation: 1, brightness: 0.8, alpha: 1.0).cgColor
        })
        downloadJSON {
            cel.HighCellPostInfo.text = self.aray[indexPath.row]
            cel.HighCellDateTime.text = self.aray1[indexPath.row]
            let urlstring = "http:" + self.aray2[indexPath.row]
            self.get_image(urlstring,cel.ImageCellView)
            
        }
        
        return cel
    }
    

    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return   1
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }

}

