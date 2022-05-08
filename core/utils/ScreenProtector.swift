import Foundation
import UIKit



class ScreenProtector: ObservableObject {
    
    @Published  var isNecessaryHideScreen:Bool = false;
    
    init(){
        startPreventingRecording()
        startPreventingScreenshot()
    }
  
  public  func startPreventingRecording() {
         NotificationCenter.default.addObserver(self, selector: #selector(didDetectRecording), name: UIScreen.capturedDidChangeNotification, object: nil)
     }

   public  func startPreventingScreenshot() {
         NotificationCenter.default.addObserver(forName: UIApplication.userDidTakeScreenshotNotification, object: nil, queue: OperationQueue.main) { notification in
             print("Screenshot taken!")
         }
     }
    
    @objc private func didDetectScreenshot() {
        DispatchQueue.main.async {
            self.hideScreen()
        }
    }
    
    @objc private func didDetectRecording() {
        DispatchQueue.main.async {
            self.hideScreen()
        }
    }
    
    
    
 
    private func hideScreen() ->Void{
        if UIScreen.main.isCaptured {
            isNecessaryHideScreen = true
        } else {
            isNecessaryHideScreen = false
        
        }
        
    }
    

    deinit{
        NotificationCenter.default.removeObserver(self)
    }
}
