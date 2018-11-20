//
//  ViewController.swift
//  SwiftJson
//
//  Created by hint on 07/11/18.
//  Copyright © 2018 ZidniRyi. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

//Todo 3 kasih Data Source sama Delegate
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableViewHero: UITableView!
    //Membuat Link end Poit (Todo 1)
    let URL_GET_DATA = "https://simplifiedcoding.net/demos/marvel/"
    
    //Memanggil Object Class
    var heroes = [Hero]()
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ViewControllerTableViewCell
        
        let hero: Hero
        hero = heroes[indexPath.row]
        
        //Memanggil wadah yang telah di buat
        cell.lblName.text = hero.name
        cell.lblTeam.text = hero.team
        cell.txtBio.text = hero.bio
        //Menampilkan gambar dari link url menggunakan Alamofire Image
        //Image Response
        
        Alamofire.request(hero.imageurl!).responseImage { response in
            debugPrint(response)
            if let image = response.result.value {
                cell.imgHero.image = image

            }
        }
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Response and Handling di Alamofire 2
        Alamofire.request(URL_GET_DATA).responseJSON { response in
            if let json = response.result.value{
                let heroesArray : NSArray = json as! NSArray
                for i in 0..<heroesArray.count{
                    self.heroes.append(Hero(
                        name: (heroesArray[i] as AnyObject).value(forKey: "name") as! String,
                        team: (heroesArray[i] as AnyObject).value(forKey: "team") as! String,
                        imageurl: (heroesArray[i] as AnyObject).value(forKey: "imageurl") as! String,
                        bio: (heroesArray[i] as AnyObject).value(forKey: "bio") as! String
                      
                    ))
                }
                self.tableViewHero.reloadData()
            }
        }
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

