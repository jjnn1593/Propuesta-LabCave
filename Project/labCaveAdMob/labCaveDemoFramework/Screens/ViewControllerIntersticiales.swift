
import UIKit
import FrameworkLavCabe

class ViewControllerIntersticiales: UIViewController {
     
    @IBOutlet var buttonIntersticial: UIButton!
   
     var intersticial: Intersticial!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
       initComponents()
        
    }
    
    func initComponents(){
        intersticial = Factory.instance.getTypeInstance(type: TypeAdMob.Intersticial) as? Intersticial
        intersticial.setId(id: PropertiesLibrary.getIdIntersticial())
        intersticial.setPresenter(presenterInterstcial: self)
        
    }
   
   
    @IBAction func actionButton(_ sender: Any) {
        
           
        if self.intersticial.isReady() {
            
             intersticial.showIntersticial(viewController: self)
            
        }else{
            
             self.buttonIntersticial.setTitle("Cargando...", for: .normal)
                        
            intersticial.loadIntersticial()
        }
        
       }
}

extension ViewControllerIntersticiales: ProtocolLibraryIntersticialPresenter{
    func closedIntersticial() {
        initComponents()
    }
    
    func loadedIntersticial() {
        print("Anuncio cargado")
        if intersticial.isReady() {
            intersticial.showIntersticial(viewController: self)
             self.buttonIntersticial.setTitle("Cargar Anuncio", for: .normal)
            } else {
            print("El anuncion aún no está listo")
            }
    }
    
    func error(typeError: LibErrors, message: String) {
        print("La procedencia del error es de "+typeError.rawValue)
               print("Sucede: "+message)
    }
    
    
}
