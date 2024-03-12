//
//  EmojiTableViewController.swift
//  16.4-UITableView
//
//  Created by Alican TARIM on 11.06.2023.
//

import UIKit

// UITableViewDataSource && UITableViewDelegate
class EmojiTableViewController: UITableViewController {
    
    
    // MArK: - Properties
    var emojis: [Emoji] = [
        Emoji(symbol: "🍎", name: "Heart Eyes",
              description: "A smiley face with hearts for eyes",
              usage: "love of something; attractive"),
        Emoji(symbol: "🍐", name: "Heart Eyes",
              description: "A smiley face with hearts for eyes",
              usage: "love of something; attractive"),
        Emoji(symbol: "🥝", name: "Heart Eyes",
              description: "A smiley face with hearts for eyes",
              usage: "love of something; attractive"),
        Emoji(symbol: "🍅", name: "Heart Eyes",
              description: "A smiley face with hearts for eyes",
              usage: "love of something; attractive"),
        Emoji(symbol: "🍆", name: "Heart Eyes",
              description: "A smiley face with hearts for eyes",
              usage: "love of something; attractive"),
        Emoji(symbol: "🥥", name: "Heart Eyes",
              description: "A smiley face with hearts for eyes",
              usage: "love of something; attractive"),
        Emoji(symbol: "🍇", name: "Heart Eyes",
              description: "A smiley face with hearts for eyes",
              usage: "love of something; attractive"),
        Emoji(symbol: "🍍", name: "Heart Eyes",
              description: "A smiley face with hearts for eyes",
              usage: "love of something; attractive"),
        Emoji(symbol: "🫒", name: "Heart Eyes",
              description: "A smiley face with hearts for eyes",
              usage: "love of something; attractive"),
        Emoji(symbol: "🥯", name: "Heart Eyes",
              description: "A smiley face with hearts for eyes",
              usage: "love of something; attractive"),
        Emoji(symbol: "🥒", name: "Heart Eyes",
              description: "A smiley face with hearts for eyes",
              usage: "love of something; attractive"),
        Emoji(symbol: "🥬", name: "Heart Eyes",
              description: "A smiley face with hearts for eyes",
              usage: "love of something; attractive"),
        Emoji(symbol: "🍍", name: "Heart Eyes",
              description: "A smiley face with hearts for eyes",
              usage: "love of something; attractive"),
        Emoji(symbol: "🍆", name: "Heart Eyes",
              description: "A smiley face with hearts for eyes",
              usage: "love of something; attractive"),
        Emoji(symbol: "🍅", name: "Heart Eyes",
              description: "A smiley face with hearts for eyes",
              usage: "love of something; attractive"),
        Emoji(symbol: "🥥", name: "Heart Eyes",
              description: "A smiley face with hearts for eyes",
              usage: "love of something; attractive"),
        Emoji(symbol: "🍇", name: "Heart Eyes",
              description: "A smiley face with hearts for eyes",
              usage: "love of something; attractive"),
        Emoji(symbol: "🍍", name: "Heart Eyes",
              description: "A smiley face with hearts for eyes",
              usage: "love of something; attractive"),
        Emoji(symbol: "🫒", name: "Heart Eyes",
              description: "A smiley face with hearts for eyes",
              usage: "love of something; attractive"),
        Emoji(symbol: "🍎", name: "Heart Eyes",
              description: "A smiley face with hearts for eyes",
              usage: "love of something; attractive"),
        Emoji(symbol: "🍐", name: "Heart Eyes",
              description: "A smiley face with hearts for eyes",
              usage: "love of something; attractive"),
        Emoji(symbol: "🥝", name: "Heart Eyes",
              description: "A smiley face with hearts for eyes",
              usage: "love of something; attractive")
    ]
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        
        // 1 section varsa bu fonksiyonu yazmak zorunda degilsiniz.
        // Cunku, Varsayilan section sayisi zaten 1'dir.
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        // Her section icin 1 kez calisiyor. Ornegin; 4 section'a sahip bir tableView varsa,
        // Bu fonksiyon her section icin 1 kez olmak uzere toplam 4 kez calisacaktir.
        // section parametresi, o an cizilmekte olan section bilgisini verir.
        return emojis.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Bir hucre ne zaman ki ekrana gelecek; cellForRow ile cizilir.
        // Bu fonksiyonun kac kez calisacagi belli degildir.
        // ORnek1: kullanici hic scrool etmez ise, ekranda gorunen array'inizdeki eleman sayisi kadar calisir.
        // Ornek2: Kullanici scroll etmeye baslarsa scroll ettigi surece bu fonksiyon calisir.
        
        // IndexPath: O an cizilmekte olan hucrenin konum bilgisi.
        // Adim1: O an cizilmekte olan emoji nesnesine indexPath degeri ile ulasmak.
        let emoji = emojis[indexPath.row]
        
        // Adim2: Hucre olusturmak
        // reuseIdentifier: Storyboard'da hucre icin verdiginiz identifier degeri.
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiCell")!
        
        // Adim3: Hucreyi data ile doldurmak.
        cell.textLabel?.text = "\(emoji.symbol) - \(emoji.name)"  // Title
        cell.detailTextLabel?.text = (emoji.description) // SubTitle
        
        // Adim4: Olusturmus ve icini doldurmus oldugunuz hucreyi Return edin.
        return cell
    }
    
    // MARK: - Table view delegate
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Bu fonksiyon kullanici bir hucrenizi sectigi zaman (ustune tikladigi zaman) calisir.
        // indexPath: Uzerine tiklanilan hucrenin konum bilgisi
        
        // IndexPath'in row propert'sunu kullanarak uzerine tiklanan emoji nesnesine ulasilabilir.
        let selectedEmoji = emojis[indexPath.row]
        print("\(selectedEmoji.symbol) \(indexPath)")
    }
    
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        // sourceIndexPath: Sirasi degistirilmek istenen hucrenin konumu.
        // destinationIndexPath: Gidilmesi istenilen konum. (Parmak ekran kaldirilinca)
    }
    
    
    // MARK: - Actions
    @IBAction func editButtonTapped(_ button: UIBarButtonItem) {
        
        // isEditing: O an TableView'in edit modda olup olmadigi bilgisini verir.
        let tableViewEditingMode = tableView.isEditing
        
        // TableView'in editing moda girmesini ve cikmasini saglar.
        // '!' Boolean degerinin tersini alir. Ornk: !true = false
        tableView.setEditing(!tableViewEditingMode, animated: true)
    }
    
    
    
    
    
    

    
    

    
    
    

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
