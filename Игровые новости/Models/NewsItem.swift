import Foundation

class NewsItem
{
    var app_views:Int?
    var autotop:String?
    var comments:Int?
    var cover:String?
    var createdAt:Date?
    var date:Date?
    var description:String?
    var id:String?
    var link:String?
    var localImage:String?
    var name:String?
    var platformIds:String?
    var previewId:Int?
    var previewLink:String?
    var removed:Int?
    var sourceId:Int?
    var source_views:Int?
    var top:Bool?
    var updatedAt:Date?
    var views:Int?
    
    init ()
    {
        
    }
    
    init(app_views: Any, autotop: Any, comments: Any, cover: Any, createdAt: Any, date: Any, description: Any, id: Any, link: Any, localImage: Any, name: Any, platformIds: Any, previewId: Any, previewLink: Any, removed: Any, sourceId: Any, source_views: Any, top: Any, updatedAt: Any, views: Any)
    {
        let pattern = "yyyy-MM-dd'T'HH:mm:ss.SZ"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = pattern
        
        self.app_views = app_views as? Int
        self.autotop = autotop as? String ?? ""
        self.comments = comments as? Int
        self.cover = cover as? String ?? ""
        
        var dateCreate = createdAt as? String ?? ""
        self.createdAt = dateFormatter.date(from: dateCreate)
        
        var dateString  = date as? String ?? ""
        self.date = dateFormatter.date(from: dateString)
        
        self.description = description as? String ?? ""
        self.id = id as? String ?? ""
        self.link = link as? String ?? ""
        self.localImage = localImage as? String ?? ""
        self.name = name as? String ?? ""
        self.platformIds = platformIds as? String ?? ""
        self.previewId = previewId as? Int
        self.previewLink = previewLink as? String ?? ""
        self.removed = removed as? Int
        self.sourceId = sourceId as? Int
        self.source_views = source_views as?Int
        self.top = top as? Bool
        
        var dateUpdate = updatedAt as? String ?? ""
        self.updatedAt = dateFormatter.date(from: dateUpdate)
        
        self.views = views as? Int
    }
}
