

import Foundation
import GoogleMobileAds

//Protocol Padre
public protocol LibraryGMA {
   
    func setId(id: String)
}

//Presenter padre
public protocol LibraryPresenter {
    func error(typeError: LibErrors, message:String) -> Void
}


 public class Factory {
    
    public static let instance = Factory()
    
       init() {}
    
    
    public func initLibrary(library: Libraries ){
        switch library {
        case Libraries.AdMob:
            
             GADMobileAds.sharedInstance().start(completionHandler: nil)
             
            break
        }
        
    }
    
    public func getTypeInstance(type: TypeAdMob)->LibraryGMA{
        var typeLibrary:LibraryGMA
        switch type {
        case TypeAdMob.Banner:
            typeLibrary = Banner()
            break
        case TypeAdMob.Video:
            typeLibrary = VideoBon()
            break
        case TypeAdMob.Intersticial:
            typeLibrary = Intersticial()
            break
    }
    
     return typeLibrary
    }
}
