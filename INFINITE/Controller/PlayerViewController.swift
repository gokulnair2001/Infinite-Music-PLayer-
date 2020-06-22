//
//  PlayerViewController.swift
//  INFINITE
//
//  Created by Gokul Nair on 18/06/20.
//  Copyright © 2020 Gokul Nair. All rights reserved.
//

import  AVFoundation
import UIKit

class PlayerViewController: UIViewController {

    public var position: Int = 0
    public var songs: [music] = []
    
    @IBOutlet var holder: UIView!
       
    var player: AVAudioPlayer?
  
    //MARK:- ALMBUM COVER
    
    private let albumImage: UIImageView = {
       
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
     let playPauseButton = UIButton()
    
     let FavButton = UIButton()
    
    let repeatButton = UIButton()
    
  //MARK:- TITLE
    
    private let songTitle: UILabel = {
          
           let title = UILabel()
        title.textAlignment = .center
       // title.text = UIFont(name: "Helvetica", size: 18)
        title.numberOfLines = 0 //to wrap
           return title
        
    }()
    
    //MARK:- ALBUM
    
    private let album: UILabel = {
          
           let albumName = UILabel()
        albumName.textAlignment = .center
        albumName.numberOfLines = 0 //to wrap
           return albumName
        
    }()
    
    //MARK:- ARTIST
    
    private let artist: UILabel = {
          
           let artistName = UILabel()
        artistName.textAlignment = .center
        artistName.numberOfLines = 0 //to wrap
           return artistName
        
    }()
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if holder.subviews.count == 0 {
            configure()
        }
    }

    func configure() {
        
        //set up player
        let song = songs[position]
        let urlString = Bundle.main.path(forResource: song.trackName, ofType: "mp3")
        
        do{
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            
            guard let urlString = urlString else{
               // print("error1")
                return
            }
            //print("here")
            player = try AVAudioPlayer.init(contentsOf: URL(string: urlString)!)
            
            guard let player = player else{
               // print("error2")
                return
            }
            player.volume = 0.5
            player.play()
        }
        catch{
            print("error occoured")
        }
        //set up user interface
        
        albumImage.frame = CGRect(x: 10,
                                  y: 10,
                                  width: holder.frame.size.width-20,
                                  height: holder.frame.size.width-20)
        
        albumImage.image = UIImage(named: song.imageName)
        holder.addSubview(albumImage)
        
        //LABELS:- song title, album name, artist
        songTitle.frame = CGRect(x: 10,
                                 y: albumImage.frame.size.height+10,
                                 width: holder.frame.size.width-20,
                                 height: 70)
        
        album.frame = CGRect(x: 10,
                             y: albumImage.frame.size.height+10+70,
                             width: holder.frame.size.width-20,
                             height: 70)
        
        artist.frame = CGRect(x: 10,
                              y: albumImage.frame.size.height+10+140,
                              width: holder.frame.size.width-20,
                              height: 70)
        
        songTitle.text = song.Song
        album.text = song.Album
        artist.text = song.Artist
        holder.addSubview(songTitle)
        holder.addSubview(artist)
        holder.addSubview(album)
        holder.addSubview(repeatButton)
        
        //MARK:- PLAYER BUTTON
        
       // let playPauseButton = UIButton()
        let nextButton = UIButton()
        let backButton = UIButton()
        
        //images for buttons
        
        playPauseButton.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
        backButton.setBackgroundImage(UIImage(systemName: "backward.fill"), for: .normal)
        nextButton.setBackgroundImage(UIImage(systemName: "forward.fill"), for: .normal)
        FavButton.setBackgroundImage(UIImage(systemName: "heart"), for: .normal)
        repeatButton.setBackgroundImage(UIImage(systemName: "repeat"), for: .normal)
        
       //colourchanging of buttons
        
        playPauseButton.tintColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        backButton.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        nextButton.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        FavButton.tintColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        repeatButton.tintColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        
        //adding the buttons
        
        holder.addSubview(playPauseButton)
        holder.addSubview(nextButton)
        holder.addSubview(backButton)
        holder.addSubview(FavButton)
        holder.addSubview(repeatButton)
        
        //adding action to the buttons
        
        playPauseButton.addTarget(self, action: #selector(didTapPlayPauseButton), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(didTapNextButton), for: .touchUpInside)
        FavButton.addTarget(self, action: #selector(didTapFavButton), for: .touchUpInside)
        repeatButton.addTarget(self, action: #selector(didiTapRepeatButton), for: .touchUpInside)
        //Frame
        
        let yPosition = artist.frame.origin.y+90
        let size: CGFloat = 80
        let buttonSize: CGFloat = 60
        
        playPauseButton.frame = CGRect(x: (holder.frame.size.width - buttonSize)/2.0, y: yPosition, width: buttonSize, height: buttonSize)
        nextButton.frame = CGRect(x: holder.frame.size.width - buttonSize - 20, y: yPosition, width: buttonSize, height: buttonSize)
        backButton.frame = CGRect(x: 20, y: yPosition, width: buttonSize, height: buttonSize)
        FavButton.frame = CGRect(x: 20, y: albumImage.frame.size.height+30, width: 35, height: 30)
        repeatButton.frame = CGRect(x: 320, y:  albumImage.frame.size.height+30, width: 35, height: 30)
        
        //MARK:- SLIDER Documentation
        
        let slider = UISlider(frame: CGRect(x: 20, y: holder.frame.size.height-60, width: holder.frame.size.width-40, height: 50))
        
        slider.value = 0.5
        slider.addTarget(self, action: #selector(didlideSlider(_:)), for: .valueChanged)
        holder.addSubview(slider)
        
        
    }
    @objc func didTapPlayPauseButton() {
        
        if player?.isPlaying == true{
            player?.pause()
            //Show play button
            playPauseButton.setBackgroundImage(UIImage(systemName: "play.fill"), for: .normal)
          
            //Shrink Image
            UIView.animate(withDuration: 0.3) {
                self.albumImage.frame = CGRect(x: 20, y: 20, width: self.holder.frame.size.width-40, height: self.holder.frame.size.width-40)
            }
            
        }
        else{
            player?.play()
            //show pause button
            playPauseButton.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
           
            //Expand Image
            UIView.animate(withDuration: 0.3) {
                self.albumImage.frame = CGRect(x: 10, y: 10, width: self.holder.frame.size.width-20,height: self.holder.frame.size.width-20)
            }
          
        }
    }
    
   
    
    @objc func didTapFavButton() {
    
        if (FavButton.currentImage == UIImage(systemName: "heart.fill")) {
            FavButton.setBackgroundImage(UIImage(systemName: "heart"), for: .normal)
            print("if part")
        }
        else {
            FavButton.setBackgroundImage(UIImage(systemName: "heart.fill"), for: .normal)
            print("else part")
        }
        
    }
    

    @objc func didTapNextButton() {
        
        if position < (songs.count - 1) {
            position = position + 1
            player?.stop()
            for subView in holder.subviews {
                subView.removeFromSuperview()
            }
            configure()
        }
    }
    
    @objc func didTapBackButton() {
        
        if position > 0 {
            position = position - 1
            player?.stop()
            for subView in holder.subviews {
                subView.removeFromSuperview()
            }
            configure()
        }
    }

    @objc func didiTapRepeatButton() {
        
        player?.prepareToPlay()
        repeatButton.setBackgroundImage(UIImage(systemName: "repeat.1"), for: .normal)
        
    }
    
    @objc func didlideSlider( _ slider: UISlider) {
        
        let value = slider.value
        player?.volume = value
      
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if let player = player {
            player.stop()
        }
    }
}
