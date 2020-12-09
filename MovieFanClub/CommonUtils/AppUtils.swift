//

//
//  Created by Sushobhit.Jain on 09/11/20
//

import Foundation
import UIKit

enum ProgressText:String {
    case pleasewait = "Please wait"
    case loading = "Loading.."
    
    func stringValue() -> String {
        return self.rawValue
    }
}

/* Show Progress Indicator */
func showProgressIndicator(view:UIView,text:ProgressText){
    
    view.isUserInteractionEnabled = false
    
    // Create and add the view to the screen.
    let progressIndicator = ProgressIndicator(text: text.stringValue())
    progressIndicator.tag = PROGRESS_INDICATOR_VIEW_TAG
    view.addSubview(progressIndicator)
    
}

/* Hide progress Indicator */
func hideProgressIndicator(view:UIView){
    
    view.isUserInteractionEnabled = true
    
    if let viewWithTag = view.viewWithTag(PROGRESS_INDICATOR_VIEW_TAG) {
        viewWithTag.removeFromSuperview()
    }
    
}
