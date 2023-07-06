//
//  AnimatedButton.swift
//  Maraphon2ndTask
//
//  Created by Артем Соколовский on 05.07.2023.
//

import UIKit

class AnimatedButton: UIButton {
	
	var buttonPressedDelegate: ButtonPressedDelegate?
	
	required init(title: String) {
		super.init(frame: .zero)
		configButton(title: title)
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		
	}
	
	func configButton(title: String) {
		var config = UIButton.Configuration.filled()
		
		config.title = title
		config.image = UIImage(systemName: "arrow.forward.circle.fill")
		config.imagePlacement = .trailing
		config.imagePadding = 8
		config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14)
		config.baseBackgroundColor = .systemBlue
		config.baseForegroundColor = .white
		
		configuration = config
	}	

	func touchIn() {
		UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [.allowUserInteraction, .curveEaseIn], animations: {
			self.transform = .init(scaleX: 0.7, y: 0.7)
			
		})
	}
	
	func touchEnd() {
		UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [.allowUserInteraction, .curveEaseOut], animations: {
			self.transform = .init(scaleX: 1, y: 1)
			
		})
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		super.touchesBegan(touches, with: event)
		touchIn()
		buttonPressedDelegate?.didButtonPressed()
	}
	
	override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
		super.touchesEnded(touches, with: event)
		touchEnd()
	}

}

protocol ButtonPressedDelegate {
	func didButtonPressed()
}
