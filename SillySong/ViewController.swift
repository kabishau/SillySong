//
//  ViewController.swift
//  SillySong
//
//  Created by Aleksey on 0128..19.
//  Copyright © 2019 Aleksey. All rights reserved.
//

import UIKit

let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")

func shortnameFrom(name: String) -> String {
    var name = name.lowercased()
    if let first = name.first {
        switch first {
        case "a","e","i","o","u":
            break
        default:
            name.remove(at: name.startIndex)
        }
    }
    return name
}

func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    let shortname = shortnameFrom(name: fullName)
    var lyrics = lyricsTemplate.replacingOccurrences(of: "<FULL_NAME>", with: fullName)
    lyrics = lyrics.replacingOccurrences(of: "<SHORT_NAME>", with: shortname)
    
    return lyrics
}

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lyricsView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameField.delegate = self
    }
    
    @IBAction func reset(_ sender: Any) {
        nameField.text = ""
        lyricsView.text = ""
    }
    
    @IBAction func displayLyrics(_ sender: Any) {
        if let text = nameField.text, text != "" {
            lyricsView.text = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: text)
        }
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}

