import UIKit

class RatingControl: UIView {
    
    // MARK: Properties
    var rating = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    var ratingButtons = [UIButton]()
    let spacing = 5
    let starCount = 5
    
    // MARK: Initialization
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let filledStartImage = UIImage(named: "filledStar")
        let emptyStarImage = UIImage(named: "emptyStar")
        
        for _ in 0..<starCount {
            let button = UIButton()
            
            button.setImage(emptyStarImage, for: .normal)
            button.setImage(filledStartImage, for: .selected)
            button.setImage(filledStartImage, for: [.highlighted, .selected])
            button.adjustsImageWhenHighlighted = false
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchDown)
            
            ratingButtons += [button]
            
            addSubview(button)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let buttonSize = Int(frame.size.height)
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        
        for (index, button) in ratingButtons.enumerated() {
            buttonFrame.origin.x = CGFloat(index * (buttonSize + spacing))
            button.frame = buttonFrame
        }
        
        updateButtonsSelectionsStates()
    }
    
    override var intrinsicContentSize: CGSize {
        let buttonSize = Int(self.frame.size.height)
        let width = (buttonSize * starCount) + (spacing * (starCount - 1))
        
        return CGSize(width: width, height: buttonSize)
    }
    
    // MARK: Button Action
    
    func ratingButtonTapped(button: UIButton) {
        rating = ratingButtons.index(of: button)! + 1
        updateButtonsSelectionsStates()
    }
    
    func updateButtonsSelectionsStates() {
        for (index, button) in ratingButtons.enumerated() {
            button.isSelected = index < rating
        }
    }
}
