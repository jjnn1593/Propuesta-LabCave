
import Foundation
import GoogleMobileAds

protocol ProtocolVideo: LibraryGMA{
    
    func isReady() -> Bool
    func showVideo(viewController: UIViewController)
    func loadVideo()
    func setPesenter(pro: ProtocolLibraryVideoPresenter)
    
}

public protocol ProtocolLibraryVideoPresenter:LibraryPresenter {
    func loadedVideo()
    func closedVideo()
}

public class VideoBon: NSObject, GADRewardedAdMetadataDelegate{
   
    private var video: GADRewardedAd!
    private var presenterLibVideo: ProtocolLibraryVideoPresenter?
   
}

extension VideoBon: ProtocolVideo, GADRewardedAdDelegate{
    
    
    public func setPesenter(pro: ProtocolLibraryVideoPresenter) {
        self.presenterLibVideo = pro
    }
    
    public func rewardedAdDidPresent(_ rewardedAd: GADRewardedAd) {
       print("rewardedAdDidPresent")
    }
    public func rewardedAdDidDismiss(_ rewardedAd: GADRewardedAd) {
        print("rewardedAdDidDismiss")
        presenterLibVideo?.closedVideo()
    }
    
    public func rewardedAd(_ rewardedAd: GADRewardedAd, didFailToPresentWithError error: Error) {
        print(error)
        self.presenterLibVideo?.error(typeError: LibErrors.ErrorVideo,message: error.localizedDescription)
    }
    
    public func rewardedAdMetadataDidChange(_ rewardedAd: GADRewardedAd) {
         print("El Anuncio está listo")
    }
    public func rewardedAd(_ rewardedAd: GADRewardedAd, userDidEarn reward: GADAdReward) {
       print("rewardead")
    }
    
    public func isReady() -> Bool {
        return self.video.isReady
    }
    
    public func showVideo(viewController: UIViewController) {
        
        self.video.present(fromRootViewController: viewController, delegate: self)
    }
    
    public func loadVideo() {
        self.video!.load(GADRequest()) { error in
        if let error = error {
         print(error)
            self.presenterLibVideo?.error(typeError: LibErrors.ErrorVideo,message: error.localizedDescription)
        } else {
          print("vídeo cargado")
            self.presenterLibVideo?.loadedVideo()
            };
        }
    }
    
    
    public func setId(id: String) {
        self.video = GADRewardedAd(adUnitID: id)
        self.video.adMetadataDelegate = self
       
    }
    
    

   
   

   

    
}


