

import UIKit

import FrameworkLavCabe
class ViewControllerVideo: UIViewController {
    var video:VideoBon!
    
    @IBOutlet var buttonVideo: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       initComponents()
    }
    
    func initComponents()  {
       self.video = Factory.instance.getTypeInstance(type: TypeAdMob.Video) as? VideoBon
        self.video.setId(id: PropertiesLibrary.getIdVideo())
        self.video.setPesenter(pro: self)
        
        
              
    }
    
    @IBAction func actionButton(_ sender: Any) {
        self.buttonVideo.setTitle("Cargando...", for: .normal)
        
        if self.video.isReady() {
             video.showVideo(viewController: self)
        }else{
           
            self.video.loadVideo()
        }
        
        }
}
extension ViewControllerVideo: ProtocolLibraryVideoPresenter{
    func closedVideo() {
        print("Se ha cerrado el vídeo")
        initComponents()
    }
    
    func error(typeError : LibErrors, message : String) {
        print("La procedencia del error es de "+typeError.rawValue)
        print("Sucede: "+message)
    }
    
    func loadedVideo() {
        print("VideoCargado")
        
        if self.video.isReady() {
               video.showVideo(viewController: self)
             self.buttonVideo.setTitle("Cargar vídeo", for: .normal)
        } else {
                print("El anuncio aún no está listo")
            }
    }
   
    
}


