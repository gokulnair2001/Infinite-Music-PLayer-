//
//  albumViewController.swift
//  INFINITE
//
//  Created by Gokul Nair on 22/06/20.
//  Copyright © 2020 Gokul Nair. All rights reserved.
//

import UIKit
import CardSlider

struct Item : CardSliderItem {
    var image: UIImage
    var rating: Int?
    var title: String
    var subtitle: String?
    var description: String?
}

class albumViewController: UIViewController, CardSliderDataSource {
    
    @IBOutlet var present: UIButton!
    
    var data = [Item]()

    override func viewDidLoad() {
        super.viewDidLoad()

                data.append(Item(image: UIImage(imageLiteralResourceName: "song1"),
                                        rating: 5 ,
                                        title: "Dariya",
                                        subtitle: "Manmarziya",
                                        description: "Music Description......."))
                
                data.append(Item(image: UIImage(imageLiteralResourceName: "song2"),
                                        rating: 5 ,
                                        title: "Khairiyat",
                                        subtitle: "Chichore",
                                        description: "Music Description......."))
                
                data.append(Item(image: UIImage(imageLiteralResourceName: "song3"),
                                        rating: 5 ,
                                        title: "Thodi jagah",
                                        subtitle: "Marjavan",
                                        description: "Music Description......."))
                
                data.append(Item(image: UIImage(imageLiteralResourceName: "song4"),
                                        rating: 5 ,
                                        title: "Naina De Kasoor",
                                        subtitle: "Andhadhun",
                                        description: "Music Description......."))
                
                data.append(Item(image: UIImage(imageLiteralResourceName: "song5"),
                                        rating: 5,
                                        title: "NAJA",
                                        subtitle: "NAJA",
                                        description: "Music Description......."))
                
                data.append(Item(image: UIImage(imageLiteralResourceName: "song6"),
                                        rating: 5 ,
                                        title: "Shayad",
                                        subtitle: "Love Aaj Kal",
                                        description: "Music Description......."))
                
                data.append(Item(image: UIImage(imageLiteralResourceName: "song7"),
                                        rating: 5 ,
                                        title: "Humraha",
                                        subtitle: "Malang",
                                        description: "Music Description......."))
                
                data.append(Item(image: UIImage(imageLiteralResourceName: "song8"),
                                        rating: 5 ,
                                        title: "Clarity",
                                        subtitle: "Clarity",
                                        description: "Music Description......."))
                
                data.append(Item(image: UIImage(imageLiteralResourceName: "song9"),
                                        rating: 5 ,
                                        title: "Girls Like You",
                                        subtitle: "Maroon 5",
                                        description: "Music Description......."))
                
    }
    
    @IBAction func present(_ sender: UIButton) {
        
       let vc = CardSliderViewController.with(dataSource: self)
        vc.title = "Album"
        vc.modalPresentationStyle = .fullScreen
        present(vc,animated: true)
    }
    

    func item(for index: Int) -> CardSliderItem {
           return data[index]
          }
          
          func numberOfItems() -> Int {
              return data.count
          }
}
