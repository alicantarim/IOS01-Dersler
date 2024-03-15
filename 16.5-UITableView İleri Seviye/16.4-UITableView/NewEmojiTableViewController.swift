//
//  NewEmojiTableViewController.swift
//  16.4-UITableView
//
//  Created by Alican TARIM on 15.03.2024.
//

import UIKit

class NewEmojiTableViewController: UITableViewController {
    
    // MARK: - UI Elements
    @IBOutlet var symbolTextField: UITextField!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var descriptionTextField: UITextField!
    @IBOutlet var usageTextField: UITextField!
    
    // MARK: - Properties
    var emoji: Emoji?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Not: Data gönderirken önceki sayfadan symbolTextField.text diyerek yapamazdık. Sebebi 'viewDidLoad'
        // daha çalışmamış olacaktı önceki sayfada, çalışmadığı için hiç bir arayüz elemanı memory de 'init' edilmediği
        // için ona ulaşamayız.
        
        // Önceki sayfa tarafından bir Emoji nesnesi iletildiyse...
        if let emoji = emoji {
            symbolTextField.text = emoji.symbol
            nameTextField.text = emoji.name
            descriptionTextField.text = emoji.description
            usageTextField.text = emoji.usage
        }
        
    }
    
    // MARK: - Functions
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Yalnızca 'saveUnwind' ise çalışmaya devam etmeli.
        guard segue.identifier == "saveUnwind" else { return }
        
        
        // Kullanıcının girdiği bilgilere erişilir.
        let symbol = symbolTextField.text!
        let name = nameTextField.text!
        let description = descriptionTextField.text!
        let usage = usageTextField.text!
        
        // Girilen bilgiler kullanılarak bir Emoji nesnesi oluşturulur.
        // ve 'emoji' property'sine atanır.
        emoji = Emoji(symbol: symbol, name: name, description: description, usage: usage)
    }
    
}
