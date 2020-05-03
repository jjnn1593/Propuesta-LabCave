
import UIKit
import FrameworkLavCabe
class ViewControllerBanner: UIViewController {
     
    @IBOutlet var buttonBanner: UIButton!
    
    @IBOutlet var viewBanner: UIView!
    var banner:Banner!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
       initComponents()

    }

    func initComponents() {
        banner = Factory.instance.getTypeInstance(type: TypeAdMob.Banner) as? Banner
       
        viewBanner.addSubview(banner)
        banner.initCustom()
        banner.setId(id: PropertiesLibrary.getIdBanner())
        banner.setPresenterBanner(presenterBann: self)
        banner.getRootViewController(viewController: self)
       
    }
    @IBAction func touchLoadBanner(_ sender: Any) {
        buttonBanner.setTitle("Cargando...", for: .normal)
         banner.loadBanner()
    }
}

extension ViewControllerBanner:ProtocolLibraryBannerPresenter{
   
    
    func loadedBanner() {
        
        print("Banner Cargado")
        self.banner.showBanner()
        self.buttonBanner.setTitle("", for: .normal)
        
    }
    
    func error(typeError: LibErrors, message: String) {
        print("La procedencia del error es de "+typeError.rawValue)
               print("Sucede: "+message)
    }
    
    
}
