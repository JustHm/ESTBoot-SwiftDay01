//
//  MovieDescriptionCell.swift
//  WeeklyProject-UIKitBasic
//
//  Created by 안정흠 on 2/28/25.
//

import UIKit

class MovieDescriptionCell: UITableViewCell {
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .black)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var directorLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var releaseDateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .secondaryLabel
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var genreLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .secondaryLabel
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    func configure(title: String, director: String, releaseDate: Date, genre: String) {
        titleLabel.text = title
        directorLabel.text = director
        releaseDateLabel.text = releaseDate.formatted(.dateTime)
        genreLabel.text = genre
        
        setupLayout()
    }
    
    private func setupLayout() {
        [titleLabel, directorLabel, releaseDateLabel, genreLabel]
            .forEach {
                contentView.addSubview($0)
            }
        // TableView의 DynamicHeight를 사용하려면 cell의 contentView에 넣고 constraint 정의해줘야함
        // 이런 방식으로도 activate 가능
        NSLayoutConstraint.activate([
                titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
                titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

                directorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
                directorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                directorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

                releaseDateLabel.topAnchor.constraint(equalTo: directorLabel.bottomAnchor, constant: 8),
                releaseDateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                releaseDateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

                genreLabel.topAnchor.constraint(equalTo: releaseDateLabel.bottomAnchor, constant: 8),
                genreLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                genreLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

                // ✅ 마지막 요소의 bottomAnchor를 설정해야 동적 높이 계산 가능!
                genreLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
            ])
    }
}
