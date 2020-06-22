//
//  ViewController.swift
//  INFINITE
//
//  Created by Gokul Nair on 18/06/20.
//  Copyright © 2020 Gokul Nair. All rights reserved.
//

import UIKit
import Lottie

class MusicPlayer: UIViewController, UITableViewDataSource,UITableViewDelegate {
   
    @IBOutlet weak var tableView: UITableView!
    
    
    
    var songs = [music]()
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startAnimation()
        configureSongs()
        tableView.delegate = self
        tableView.dataSource = self
    }
 //MARK:- SONG CONGIGURATION
    func configureSongs() {
        
        songs.append(music(Song: "Daryaa",
                           Album: "Manmarziya",
                           Artist: "Ammy Virk",
                           imageName: "song1.png",
                           trackName: "song1" ))
        
         songs.append(music(Song: "Khairiyat",
                            Album: "Chichore",
                            Artist: "Arijit Singh",
                            imageName: "song2.png",
                            trackName: "song02" ))
        
         songs.append(music(Song: "Thodi Jagah",
                            Album: "Marjavan",
                            Artist: "Arijit Singh",
                            imageName: "song3.png",
                            trackName: "song03" ))
        
         songs.append(music(Song: "Naina De Kasoor",
                            Album: "Andhadhun",
                            Artist: "Amit Trivedi",
                            imageName: "song4.png",
                            trackName: "song04" ))
        
         songs.append(music(Song: "NAJA",
                            Album: "NAJA",
                            Artist: "Pav Dhariya",
                            imageName: "song5.png",
                            trackName: "song05" ))
        
         songs.append(music(Song: "Shayad",
                            Album: "Love Aaj Kal",
                            Artist: "Arijit Singh",
                            imageName: "song6.png",
                            trackName: "song06" ))
        
         songs.append(music(Song: "Humraha",
                            Album: "Malang",
                            Artist: "Ved Sharma",
                            imageName: "song7.png",
                            trackName: "song07" ))
        
        
        songs.append(music(Song: "Clarity",
                           Album: "Clarity",
                           Artist: "Zedd",
                           imageName: "song8.png",
                           trackName: "song08" ))
        
        
        songs.append(music(Song: "Girls Like You",
                           Album: "Maroon 5",
                           Artist: "Cardi B",
                           imageName: "song9.png",
                           trackName: "song09" ))
    
    }
    
    
   //MARK:- TABLE CONGIGURATION
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           
        return songs.count
        
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let song = songs[indexPath.row]
        
        //configure music list
        cell.textLabel?.text = song.Song
        cell.detailTextLabel?.text = song.Album
        cell.accessoryType = .disclosureIndicator
        cell.imageView?.image = UIImage(named: song.imageName)
        cell.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 18)
        cell.detailTextLabel?.font = UIFont(name: "Helvetica", size: 16)
        
        return cell
       }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 100
       }
       
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        let position = indexPath.row
        guard let vc = storyboard?.instantiateViewController(identifier: "Player") as? PlayerViewController else {
                   return
         }
        vc.songs = songs
        vc.position = position
        present(vc, animated: true)
    }
    
    func startAnimation() {
          let animationView = AnimationView()
          animationView.animation = Animation.named("c")
          animationView.frame = view.bounds
          animationView.contentMode = .scaleAspectFit
          animationView.center = view.center
          animationView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
          animationView.play()
          view.addSubview(animationView)
          animationView.play{(finished) in               //Never forget this code used to stop animation and pop up screen
          animationView.removeFromSuperview()
        }
    }
    
}
    
struct music {
        
    public var Song: String
    public var Album: String
    public var Artist: String
    public var imageName: String
    public var trackName:String
    
    }
