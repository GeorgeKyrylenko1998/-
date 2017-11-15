import Foundation

class LoadJson {
    
    static func Load( )
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
                do
                {
                    let items = try JSONSerialization.jsonObject(with: content, options: .mutableContainers) as! [Dictionary<String,Any>]
                    for item in items
                    {
                        var newsItem :NewsItem = try NewsItem(app_views: item["app_views"], autotop: item["autotop"], comments: item["comments"], cover: item["cover"], createdAt: item["createdAt"], date: item["date"], description: item["description"], id: item["id"], link: item["link"], localImage: item["localImage"], name: item["name"], platformIds: item["platformIds"], previewId: item["previewId"], previewLink: item["previewLink"], removed: item["removed"], sourceId: item["sourceId"], source_views: item["source_views"], top: item["top"], updatedAt: item["updatedAt"], views: item["views"])
                        itemsList.append(newsItem)
                        /* var newsItem: NewsItem = NewsItem()
                         newsItem.app_views = item["app_views"] as! Int
                         newsItem.autotop = item["autotop"] as? String ?? ""
                         newsItem.comments = item["comments"] as! Int
                         newsItem.cover = item["cover"] as! String*/
                    }
                    
                }
                catch{}
            }
        }
        task.resume()
    }
    
}
