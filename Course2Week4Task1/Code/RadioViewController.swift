//
//  RadioViewController.swift
//  Course2Week4Task1
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class RadioViewController: UIViewController {
    private var generalConstraints = [NSLayoutConstraint]()
    private var portraitConstraints = [NSLayoutConstraint]()
    private var landscapeConstraints = [NSLayoutConstraint]()
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "TrackLogoImage")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var trackProgressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.progress = 0.5
        return progressView
    }()
    
    private lazy var trackLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .medium)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 1
        label.text = "Aerosmith - Hole In My Soul"
        return label
    }()
    
    private lazy var volumeSlider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.value = 0.5
        return slider
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        addConstraints()
        configureConstraints()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        configureConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(logoImageView)
        view.addSubview(trackProgressView)
        view.addSubview(trackLabel)
        view.addSubview(volumeSlider)
    }
    
    private func addConstraints() {
        generalConstraints.append(contentsOf: [
            logoImageView.widthAnchor.constraint (equalTo: logoImageView.heightAnchor,
                                                  multiplier: 1),
            logoImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                                   constant: 16),
            trackProgressView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                                       constant: 16),
            trackProgressView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                                        constant: -16),
            trackProgressView.heightAnchor.constraint(equalToConstant: 2),
            volumeSlider.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                                  constant: 16),
            volumeSlider.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                                   constant: -16),
            volumeSlider.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                                                 constant: -24),
            volumeSlider.heightAnchor.constraint(equalToConstant: 31),
            trackLabel.topAnchor.constraint(equalTo: trackProgressView.bottomAnchor,
                                            constant: 0),
            trackLabel.bottomAnchor.constraint(equalTo: volumeSlider.topAnchor,
                                               constant: 0)
        ])
        
        portraitConstraints.append(contentsOf: [
            logoImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor,
                                                   constant: 0),
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                               constant: 8),
            trackProgressView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor,
                                                   constant: 30),
            trackLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor,
                                                constant: 0)
        ])
        
        landscapeConstraints.append(contentsOf: [
            logoImageView.topAnchor.constraint(equalTo: trackProgressView.bottomAnchor,
                                               constant: 16),
            logoImageView.bottomAnchor.constraint(equalTo: volumeSlider.topAnchor,
                                                  constant: -16),
            trackProgressView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                                   constant: 32),
            trackLabel.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor,
                                                constant: 16),
            trackLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
    }
    
    private func configureConstraints(){
        NSLayoutConstraint.activate(generalConstraints)
        if traitCollection.verticalSizeClass == .regular{
            NSLayoutConstraint.deactivate(landscapeConstraints)
            NSLayoutConstraint.activate(portraitConstraints)
        } else {
            NSLayoutConstraint.deactivate(portraitConstraints)
            NSLayoutConstraint.activate(landscapeConstraints)
        }
    }
}
