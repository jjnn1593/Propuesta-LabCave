

import Foundation
public class PropertiesLibrary {
    
    static  let id_banner = "IdBanner"
    static  let id_video = "idVideo"
    static  let id_intersticial = "idIntersticial"
   
      private class func getProperty(key: String) -> String {
            
             if let path = Bundle.main.path(forResource: "Info", ofType: "plist"), let properties: NSDictionary = NSDictionary(contentsOfFile: path), let value: String = properties[key] as? String  {
                 return value
             } else {
                 
                 return ""
             }
         }
       
       
       public class func getIdBanner () -> String {
              
               
             return self.getProperty(key: id_banner)
             
           }
       
       public class func getIdVideo () -> String {
            
           return self.getProperty(key: id_video)
           
         }
    
        public class func getIdIntersticial () -> String {
       
            return self.getProperty(key: id_intersticial)
      
        }
}
