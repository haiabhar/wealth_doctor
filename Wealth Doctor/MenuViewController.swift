//
//  MenuViewController.swift
//  Wealth Doctor
//
//  Created by Shamshir Anees on 19/03/17.
//  Copyright © 2017 indianmoney.com. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    var header = ["bussiness","Education"]
    var sideSelected : Int = 0
    
    @IBOutlet var collectionView: UICollectionView!
    
   
    @IBOutlet var tagsTableView: UITableView!
    var sectionItems2 = [String]()
    var sectionItem2_id = [String]()
    var sectionItems1 = [String]()
    var menuImagesArray : [UIImage]!
    var selectedmenuImagesArray : [UIImage]!
    var menuNameArray : [String]!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let btn1 = UIButton(type: .custom)
        btn1.setImage(UIImage(named: "home_close_menu"), for: .normal)
        btn1.frame = CGRect(x: -50, y: 0, width: 50, height: 50)
        //btn1.contentEdgeInsets = UIEdgeInsetsMake(5, 10, 5, 10)
        btn1.addTarget(self, action: #selector(leftMenuPressed), for: .touchUpInside)
        let item1 = UIBarButtonItem(customView: btn1)
        self.navigationItem.setRightBarButton(item1, animated: true)
        
        
        let rightBarButton = UIBarButtonItem(title: "Categories", style: .plain, target: self, action: nil)
            //UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: #selector(ViewController.myRightSideBarButtonItemTapped(_:)))
        rightBarButton.tintColor = ColorFile().getMarkerDarkAshColor()
        self.navigationItem.leftBarButtonItem = rightBarButton

        

//        let btn = UIButton(type: .custom)
//        btn.setTitle("Categories", for: .normal)
//                btn.setTitleColor(ColorFile().getMarkerDarkAshColor(), for: .normal)
//        btn.frame = CGRect(x: -25, y: 0, width: 150, height: 30)
//        btn.titleLabel?.textAlignment = .right
//        btn.backgroundColor = UIColor.black
//      //  btn.titleLabel?.text = "Categories"
//        let item = UIBarButtonItem(customView: btn)
      //  self.navigationItem.setLeftBarButton(item, animated: true)
        
        navigationController?.hidesBarsOnSwipe = false
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10)
        collectionView.collectionViewLayout = layout
        menuImagesArray = [#imageLiteral(resourceName: "me_menu"),#imageLiteral(resourceName: "feeds_menu"),#imageLiteral(resourceName: "unread_menu"),#imageLiteral(resourceName: "bookmarks_menu"),#imageLiteral(resourceName: "tip_menu")]
        selectedmenuImagesArray = [#imageLiteral(resourceName: "me_menu1"),#imageLiteral(resourceName: "feeds_menu1"),#imageLiteral(resourceName: "unread_menu1"),#imageLiteral(resourceName: "bookmarks_menu1"),#imageLiteral(resourceName: "tip_menu1")]
        menuNameArray = ["My Profile","Main Stream","Unread","Favorites","My Tips"]
       
tagLoad()
       
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 1{
    return sectionItems1.count
        
        }
        
        else if section == 2{
            return sectionItems2.count
            
        }
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = UICollectionViewCell()
        if indexPath.section  == 1{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tags", for: indexPath) as! TagsCollectionViewCell
            
            
            
                cell.tagLabel.text = sectionItems1[indexPath.row]
            
            cell.tagLabel.textColor = UIColor.gray
            
           
        cell.tagLabel.layer.cornerRadius = 8
            cell.tagLabel.layer.borderWidth = 1
            cell.tagLabel.layer.borderColor = UIColor.lightGray.cgColor
            cell.tagLabel.layer.masksToBounds = true
            return cell
        
        }
        else if indexPath.section  == 2{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tags", for: indexPath) as! TagsCollectionViewCell
                //
          
                                cell.tagLabel.text = sectionItems2[indexPath.row]
                
                cell.tagLabel.textColor = UIColor.gray
                
                
                        cell.tagLabel.layer.cornerRadius = 8
                            cell.tagLabel.layer.borderWidth = 1
                            cell.tagLabel.layer.borderColor = UIColor.lightGray.cgColor
                            cell.tagLabel.layer.masksToBounds = true
                            return cell
            
        }
        
        else if indexPath.section == 0{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)  as! MenuCollectionViewCell
        
        cell.bgView.layer.cornerRadius = 8
        cell.bgView.layer.borderWidth = 1
        cell.bgView.layer.borderColor = UIColor.lightGray.cgColor
        cell.bgView.layer.masksToBounds = true
        
        cell.menuImage.image = menuImagesArray[indexPath.row]
        cell.menuLabel.text = menuNameArray[indexPath.row]
            cell.menuLabel.textColor = UIColor.gray
            
            if indexPath.row == sideSelected{
                cell.bgView.layer.borderWidth = 0
                cell.bgView.backgroundColor = ColorFile().getPrimaryColor()
                cell.menuImage.image = selectedmenuImagesArray[indexPath.row]
                
            }
        return cell
        }
        
        return cell
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
////        if collectionView == tagCollectionView {
////        
////        
////        }
//        if indexPath.section == 0{
//        return CGSize(width: 100, height: 100)
//        }
//        else if indexPath.section == 1{
//        return CGSize(width: 100, height: 44)
//        }
//        return CGSize(width: 100, height: 44)
//    }
    
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
//                                                                         withReuseIdentifier: "header",
//                                                                         for: indexPath) as! CollectionReusableView
//        headerView.label.text = header[indexPath.row]
//        return headerView
//    }
//    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        
        if indexPath.section == 0{
                    return CGSize(width: 100, height: 100)
                    }
        else if indexPath.section == 1{
        let size = (sectionItems1[indexPath.row] as NSString).size(attributes: nil)
        return CGSize(width: size.width+6, height: 30.0)
        }
        let width = UIScreen.main.bounds.size.width
        //calculation of cell size
        let size = (sectionItems2[indexPath.row] as NSString).size(attributes: nil)
        return CGSize(width: ((width / 2) - 15)   , height: 35.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
     //   if indexPath.section == 1{
        if indexPath.section == 1{
        
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "SectionHeader", for: indexPath) as! SectionHeaderCollectionReusableView
            
            header.label.text = "Suggested Topics"
            header.label.layer.cornerRadius = 3
            header.label.layer.borderColor = UIColor(colorLiteralRed: 28/255, green: 126/255, blue: 211/255, alpha: 1.0).cgColor
          header.label.layer.borderWidth = 1
            header.label.layer.masksToBounds = true
            return header
        }
        else if indexPath.section == 2{
        
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "SectionHeader", for: indexPath) as! SectionHeaderCollectionReusableView
            
            header.label.text = "Education"
            header.label.layer.cornerRadius = 3
            header.label.layer.borderColor = UIColor(colorLiteralRed: 28/255, green: 126/255, blue: 211/255, alpha: 1.0).cgColor
            header.label.layer.borderWidth = 1
            header.label.layer.masksToBounds = true
            return header
        
        }
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "SectionHeader", for: indexPath) as! SectionHeaderCollectionReusableView
        
        header.label.text = ""
        
        return header
        
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0{
        
        return CGSize(width: 0, height: 0)
        }
    return CGSize(width: 300, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 1 || indexPath.section == 2{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier :"articleViewController") as! ViewController
            viewController.tagSelected = "\(sectionItem2_id[indexPath.row])"
            viewController.tagForTitle = "\(sectionItems2[indexPath.row])"
            viewController.tagIsClicked = true
            self.navigationController?.pushViewController(viewController, animated: true)
        
        
        }
        
        else{
        switch indexPath.row {
        case 0:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier :"ProfileViewController") as! ProfileViewController
            
            self.navigationController?.pushViewController(viewController, animated: true)
        case 1:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier :"articleViewController") as! ViewController
           
            self.navigationController?.pushViewController(viewController, animated: true)
        case 2:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier :"articleViewController") as! ViewController
            viewController.fromUnread = 1
            viewController.scrollToUnreadNews = true
            
            self.navigationController?.pushViewController(viewController, animated: true)
            
            
        case 3:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier :"articleViewController") as! ViewController
            viewController.loadFavorited = true
            
            self.navigationController?.pushViewController(viewController, animated: true)
        case 4:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier :"tipsViewController") as! TipsViewController
            
            self.navigationController?.pushViewController(viewController, animated: true)

       
            
        default:
            break
        }
        }
    }
    
 
    
    func tagLoad(){
    
        let userdata = DataBaseManager.shared.fetchData(Query: "select * from USERTAGS;")
        while userdata.next() {
            let x = userdata.string(forColumn: "tag_name")
            let y = userdata.string(forColumn: "tag_id")
            
            self.sectionItems2.append(x!)
            self.sectionItem2_id.append(y!)
        }
        self.collectionView.reloadData()
       // self.tagsTableView.reloadData()
    }
    
    func leftMenuPressed() {
        self.navigationController?.popViewController(animated: true)
        //self.navigationController?.pushViewController(viewController, animated: false)
    }
}
