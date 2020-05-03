
import Foundation
import GoogleMobileAds

protocol ProtocolIntersticial:LibraryGMA {
    func loadIntersticial() -> Void
    func isReady() -> Bool
    func showIntersticial(viewController: UIViewController)
    func setPresenter(presenterInterstcial: ProtocolLibraryIntersticialPresenter)
}

public protocol ProtocolLibraryIntersticialPresenter:LibraryPresenter {
    func loadedIntersticial()
    func closedIntersticial()
}


public class Intersticial: NSObject {
    var interstitial: GADInterstitial!
    var presenterInterstcial: ProtocolLibraryIntersticialPresenter?
         
}

extension Intersticial: GADInterstitialDelegate, ProtocolIntersticial{
    
    public func setPresenter(presenterInterstcial: ProtocolLibraryIntersticialPresenter) {
        self.presenterInterstcial = presenterInterstcial
    }
    
    public func showIntersticial(viewController: UIViewController) {
        self.interstitial.present(fromRootViewController: viewController)
    }
    
    public func isReady() -> Bool {
      return  self.interstitial.isReady
    }
    
    public  func loadIntersticial() {
        self.interstitial.load(GADRequest())
    }
    
    
    public func setId(id: String) {
        self.interstitial = GADInterstitial(adUnitID: id)
         interstitial.delegate = self
        
    }
    
   
     public  func interstitialDidReceiveAd(_ ad: GADInterstitial) {
         print("El anuncio está listo")
        self.presenterInterstcial?.loadedIntersticial()
       }

      
    public func interstitial(_ ad: GADInterstitial, didFailToReceiveAdWithError error: GADRequestError) {
         print("interstitial:didFailToReceiveAdWithError: \(error.localizedDescription)")
        self.presenterInterstcial?.error(typeError: LibErrors.ErrorIntersticial, message: error.localizedDescription)
       }

      
    public func interstitialWillPresentScreen(_ ad: GADInterstitial) {
         print("interstitialWillPresentScreen")
       }

      
    public func interstitialWillDismissScreen(_ ad: GADInterstitial) {
         print("interstitialWillDismissScreen")
        presenterInterstcial?.closedIntersticial()
       }

     
    public func interstitialWillLeaveApplication(_ ad: GADInterstitial) {
         print("interstitialWillLeaveApplication")
       }
}
