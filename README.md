# Dynamic Gradients with Motion Effects
Using the UIMotionEffects to create dynamic gradient effects.

In this example project, a Gradient is added to a Text Heading and then it's starting and ending point made to update with UIMotionEffects, creating a dynamic gradient that changes position based on the device's horizontal and vertical tilt and movement. 

A custom UIMotionEffect Class is created to update the CAGradientLayer:

    override func keyPathsAndRelativeValues(forViewerOffset viewerOffset: UIOffset) -> [String : Any]? {
        gradient?.startPoint.x = 1 + viewerOffset.horizontal
        gradient?.startPoint.y = 0.5 + viewerOffset.vertical
        
        gradient?.endPoint.x = 0 + viewerOffset.horizontal
        gradient?.endPoint.y = 1 + viewerOffset.vertical
        
        return nil
    }
   

The result looks something like this:
[![Watch the video]](http://mvdittechbook.com/GradientTilt.MP4)
