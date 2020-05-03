
import Foundation
import GoogleMobileAds


protocol ProtocolBanner: LibraryGMA{
    
    func loadBanner() -> Void
    func setPresenterBanner(presenterBann: ProtocolLibraryBannerPresenter)
    func showBanner()
}

public protocol ProtocolLibraryBannerPresenter:LibraryPresenter {
    func loadedBanner()
}

public class  Banner: UIView {
   
    private var  banner: GADBannerView!
    var presenterBanner: ProtocolLibraryBannerPresenter?
    
    override init (frame : CGRect) {
        super.init(frame : frame)
        self.banner = GADBannerView(adSize: kGADAdSizeBanner)
        self.banner.delegate = self
    }
    
    public func initCustom(){
        self.banner = GADBannerView(adSize: kGADAdSizeBanner)
        self.banner.delegate = self
    }
    convenience init () {
        self.init(frame:CGRect.zero)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    
    private func addBannerViewToView() {
   
    self.addSubview(self.banner)
            
    }

}
extension Banner: GADBannerViewDelegate, ProtocolBanner{
    public  func showBanner() {
        addBannerViewToView()
    }
    
    public func setPresenterBanner(presenterBann: ProtocolLibraryBannerPresenter) {
        self.presenterBanner = presenterBann
    }
    

    public  func setId(id: String) {
        banner.adUnitID = id
    }
    
    public  func loadBanner() {
        banner.load(GADRequest())
    
    }
    
    public func getRootViewController(viewController: UIViewController) {
         banner.rootViewController = viewController
    }
    public func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        print("El anuncio está listo")
        self.presenterBanner!.loadedBanner()
        
    }
    public func adView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: GADRequestError) {
        print(error)
        self.presenterBanner!.error(typeError: LibErrors.ErrorBanner,message: error.localizedDescription)
    }
    
   
    public func adViewWillPresentScreen(_ bannerView: GADBannerView) {
      print("adViewWillPresentScreen")
    }

  
     public func adViewWillDismissScreen(_ bannerView: GADBannerView) {
      print("adViewWillDismissScreen")
    }

   
   public func adViewDidDismissScreen(_ bannerView: GADBannerView) {
      print("adViewDidDismissScreen")
    }

   
    public func adViewWillLeaveApplication(_ bannerView: GADBannerView) {
      print("adViewWillLeaveApplication")
    }

}

