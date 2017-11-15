import UIKit
import Foundation

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
  
    @IBOutlet weak var tableview: UITableView!
    
    var news : [NewsItem]? = []
    override func viewDidLoad() {
        super.viewDidLoad()
        LoadJson();
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! ArticleCell
        cell.title.text = news?[indexPath.item].name
        var link = news?[indexPath.item].link
        var linkForShow = ""
        var count = 0
        for t in link!{
            if t == "/"{
                count+=1
                continue
            }
            if count>=2 && count<3{
                linkForShow+=String(t)
            }
        }
        cell.imgCell.downloadImage(from: (self.news?[indexPath.item].cover!)!)
        cell.link.text = linkForShow
        return cell
    }
    
    func LoadJson( )
    {
        var itemsList = [NewsItem]()
        let url = URL(string: "http://owledge.ru/api/v1/feedNews?lang=en&count=10&sources=7,19,13,5,15,16,12,9,10012,10010,10013,10014,10019,10018,10011&feedLineId=5")
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil
            {
                print("ERROR")
            }
            else if let content = data
            {
                self.news = [NewsItem]()
                do
                {
                    let items = try JSONSerialization.jsonObject(with: content, options: .mutableContainers) as! [Dictionary<String,Any>]
                    for item in items
                    {
                        let newsItem :NewsItem = try NewsItem(app_views: item["app_views"], autotop: item["autotop"], comments: item["comments"], cover: item["cover"], createdAt: item["createdAt"], date: item["date"], description: item["description"], id: item["id"], link: item["link"], localImage: item["localImage"], name: item["name"], platformIds: item["platformIds"], previewId: item["previewId"], previewLink: item["previewLink"], removed: item["removed"], sourceId: item["sourceId"], source_views: item["source_views"], top: item["top"], updatedAt: item["updatedAt"], views: item["views"])
                        self.news?.append(newsItem)
                        DispatchQueue.main.async {
                            self.tableview.reloadData()
                        }
                    }
                    
                }
                catch{}
            }
        }
        task.resume()
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.news?.count ?? 0
    }
}


extension UIImageView{
    func downloadImage(from url: String){
        let urlReqest = URLRequest(url: URL(string: url)!)
        let task = URLSession.shared.dataTask(with: urlReqest) {(data, response, error) in
            if error != nil{
                print(error)
                return
            }
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
            }
        }
        task.resume()
    }
}
