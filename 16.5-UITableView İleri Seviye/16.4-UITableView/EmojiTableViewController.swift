//
//  EmojiTableViewController.swift
//  16.4-UITableView
//
//  Created by Alican TARIM on 14.03.2024.
//

import UIKit

//UITableViewDataSource and UITableVievDelegate
class EmojiTableViewController: UITableViewController {
    
    // MARK: - Properties
    var emojis: [Emoji] = [
        Emoji(symbol: "😀", name: "Grinning Face",
              description: "A typical smiley face.", usage: "happiness"),
        Emoji(symbol: "😕", name: "Confused Face",
              description: "A confused, puzzled face.", usage: "unsure what to think; displeasure"),
        Emoji(symbol: "😍", name: "Heart Eyes",
              description: "A smiley face with hearts for eyes.",
              usage: "love of something; attractive"),
        Emoji(symbol: "👮", name: "Police Officer",
              description: "A police officer wearing a blue cap with a gold badge.",
              usage: "person of authority"),
        Emoji(symbol: "🐢", name: "Turtle",
              description: "A cute turtle.",
              usage: "Something slow"),
        Emoji(symbol: "🐘", name: "Elephant",
              description: "A gray elephant.",
              usage: "good memory"),
        Emoji(symbol: "🍝", name: "Spaghetti",
              description: "A plate of spaghetti.",
              usage: "spaghetti"),
        Emoji(symbol: "🎲", name: "Die",
              description: "A single die.",
              usage: "taking a risk, chance; game"),
        Emoji(symbol: "⛺️", name: "Tent",
              description: "A small tent.",
              usage: "camping"),
        Emoji(symbol: "📚", name: "Stack of Books",
              description: "Three colored books stacked on each other.",
              usage: "homework, studying"),
        Emoji(symbol: "💔", name: "Broken Heart",
              description: "A red, broken heart.",
              usage: "extreme sadness"),
        Emoji(symbol: "💤", name: "Snore",
              description: "Three blue \'z\'s.",
              usage: "tired, sleepiness"),
        Emoji(symbol: "🏁", name: "Checkered Flag",
              description: "A black-and-white checkered flag.",
              usage: "completion"),
        Emoji(symbol: "👮", name: "Police Officer",
              description: "A police officer wearing a blue cap with a gold badge.",
              usage: "person of authority"),
        Emoji(symbol: "🐢", name: "Turtle",
              description: "A cute turtle.",
              usage: "Something slow"),
        Emoji(symbol: "😕", name: "Confused Face",
              description: "A confused, puzzled face.", usage: "unsure what to think; displeasure"),
        Emoji(symbol: "😍", name: "Heart Eyes",
              description: "A smiley face with hearts for eyes.",
              usage: "love of something; attractive"),
        Emoji(symbol: "🎲", name: "Die",
              description: "A single die.",
              usage: "taking a risk, chance; game"),
        Emoji(symbol: "⛺️", name: "Tent",
              description: "A small tent.",
              usage: "camping")
        
    ]
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEditEmoji" {
            // O an seçili olan hücrenin IndexPath değerini verir.
            let selectedIndexPath = tableView.indexPathForSelectedRow!
            
            // O an seçili olan index ile 'emojis' array'inden ilgili objeye ulaşılır.
            let selectedEmoji = emojis[selectedIndexPath.row]
            
            // Segue'in Storyboard'da bağlı olduğu yer bir NavigationController...
            // Not: Eğer NewEmojiTableViewController'a bağlı olsaydı " as! NewEmojiTableViewController " olacaktı.
            let navigationController = segue.destination as! UINavigationController
            
            // NavigationController'ın topViewController(kendisine bağlı olan ilk sayfa) ulaşılır.
            let editEmojiController = navigationController.topViewController as! NewEmojiTableViewController
            
            // Gidilecek sayfada bulunan 'emoji' değişkeni doldurur.
            // NewEmojiTableViewController daki 19. satırdaki emoji'ye ulaşıyoruz.
            editEmojiController.emoji = selectedEmoji
            
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        
        // 1 tane section varsa bu fonksiyonu yazmak zorunda değilsiniz.
        // Çünkü varsayılan section sayısı zaten 1 dir.
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        // Her section için 1 kez çalışıyor. Örneğin, 4 section a sahip bir tableView varsa,
        // Bu fonksiyon her section için 1 kez olmak üzere toplam 4 kez çalışacaktır.
        // section parametresi, o an çizilmekte olan section bilgisini verir.
        
        return emojis.count  // Elimizdeki emoji sayısı kadar hücre olması.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Bir hücre, ne zamanki ekrana gelecek; cellForRow ile çizilir.
        // Bu fonksiyonun kaç kez çalışacağı belli değildir.
        // Örnek:1 Kullanıcı hiç scrool etmez ise, ekranda görünebilir olan hücre sayısı kadar  çalışır.
        // Örnek:' Kullanıcı scrool etmeye başlarsa scroll ettiği sürece bu fonksiyon çalışır.
        
        // indexPath: O an çizilmekte olan hücrenin konum bilgisi.
        // Adım 1: O an çizilmekte olan emoji nesnesine indexPath değeri ile ulaşmak
        
        let emoji = emojis[indexPath.row]
        
        // Adım 2: Hücre oluşturmak.
        // reuseIdentifier: Storyboard'da hücre için verdiğiniz identifier değeri.
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiCell") as! EmojiTableViewCell
        
        // Adım 3: Hücreyi data ile doldurmak.
        cell.update(with: emoji)
        
        // Adım 4: Oluşturmuş ve içini doldurmuş olduğunuz hücreyi 'return' etmek
        return cell
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Bu fonksiyon kullanıcı bir hücrenizi seçtiği zaman (üstüne tıkladığı zaman) çalışır.
        // indexPath: Üzerine tıklanılan hücrenin konum bilgisi.
        
        // indexPath'in row property'sini kullanarak üzerine tıklanan emoji nesnesine ulaşılabilir.
        let selectedEmoji = emojis[indexPath.row]
        
        // Storyboard'da 'toEditEmoji' adına sahip olan segue çalıştırılır.
        performSegue(withIdentifier: "toEditEmoji", sender: nil)
        print("\(selectedEmoji.symbol) \(indexPath)")
    }
    
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        // sourceIndexPath: Sırası değiştirilmek istenen hücrenin konumu.
        // destinationIndexPAth: Gidilmesi istenilen konum. (Parmak ekrandan kaldırılınca)
        
        // ÇOK ÖNEMLİ: 'emojis' array'in tableView hücre sırası ile her zaman aynı kalması gerekir.
        // Bu senkronu sağlayabilmek için hareket ettirilen objenin, array'de de konumu değiştirilir.
        
        // Adım 1: Hareket ettirilen emoji nesnesine ulaşmak ve array'den silmek.
        let movedEmoji = emojis.remove(at: sourceIndexPath.row)
        
        // Adım 2: Silinen elemanı, array'deki yeni konumuna (gidilecek konuma) yerleştirmek
        emojis.insert(movedEmoji, at: destinationIndexPath.row)
        
        // Adım 3: TableView'ın yeniden çizilmesini sağlamak.
        // Böylece TableView, güncellenen array sırası ile tüm elemanlarını tekrar çizecek.
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        // Bu fonksiyon, TableView editing modundayken her hücrenin
        // hangi tür editingStyle'a sahip olacağını belirtir.
        
        return .delete  // .insert or .none seçenekleri var.
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // indexPath: Editing aksiyonun gerçekleştiği hücrenin konumu.
        // editingStyle: Gerçekleşen aksiyon.(.delete veya .insert
        
        if editingStyle == .delete {
            // Adım 1: 'emojis' array'inden indexPath.row'da bulunan objeyi sil.
            emojis.remove(at: indexPath.row)
            
            // Adım 2: TableView'a hücrenin silinmesi gerektiği bilgisi verilir...
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    // MARK: - Actions
    @IBAction func editButtonTapped (_ button:UIBarButtonItem) {
        // isEditing: O an tableView'ın edit modda olup olmadığı bilgisini verir.
        let tableViewEditingMode = tableView.isEditing
        // TableView'ın editing moda girmesini ve çıkmasını sağlar.
        // '!' Boolean değerinin tersini alır. !true = false
        tableView.setEditing(!tableViewEditingMode, animated: true)
    }
    
    @IBAction func unwindFromNewEmoji(_ segue: UIStoryboardSegue) {
        // Bu fonksiyon, NewEmojiViewController tarafından çalıştırılacak.
        
        // NewEmojiViewController tarafından tetiklenen segue'nin 'save' olduğunu test eder.
        guard segue.identifier == "saveUnwind",
              let sourceViewController = segue.source as? NewEmojiTableViewController,
              let newEmoji = sourceViewController.emoji else { return }
        
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            // Daha önceden bir hücre seçilmiş.
            // Emojinin ve TableView hücresinin güncellenmesi gerekiyor.
            
            // Adım 1: 'emojis' array'inin seçili hücrenin index'inde bulunan nesnenin güncellenmesi.
            emojis[selectedIndexPath.row] = newEmoji
            
            // Adım 2: 'reloadRows' Yalnızca seçili olan hücrenin yeniden çizilmesini sağlamak.
            // tableView ın bütün hücrelerini yeniden çizdirmek yerine sadece belirtmiş olduğumuz IndexPath deki
            // hücreyi yeniden çizdiriyoruz. Bu da performans açısından mantıklıdır. 'tableView.reload' dediğimizde
            // bütün table yeniden çiziliyor.
            tableView.reloadRows(at: [selectedIndexPath], with: .none)   //.none Animasyonsuz.
        }else {
            // Seçili bir hücre bulunmuyor.
            // Yeni emoji eklenmeli
            
            // Adım 1: Yeni bir hücre için IndexPath oluştur.
            let newIndexPath = IndexPath(row: emojis.count, section: 0)
            
            // Adım 2: Yeni emoji objesini 'emojis' array'ine ekle.
            emojis.append(newEmoji)
            
            // Adım 3: Oluşturulan IndexPath ile TableView'a yeni bir hücre eklenir.
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
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


