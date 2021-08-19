//
//  ToDoItemCell.swift
//  SwiftIntro-ToDoApp
//
//  Created by Megan Herold on 8/19/21.
//

import UIKit

class ToDoItemCell: UITableViewCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let notesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let tagLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubviews() {
        addSubview(titleLabel)
        addSubview(notesLabel)
        addSubview(tagLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            notesLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            notesLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            notesLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            tagLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            tagLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func configure(title: String, notes: String, tag: String?, tagColor: UIColor?) {
        titleLabel.text = title
        notesLabel.text = notes
        
        if let tag = tag, let tagColor = tagColor {
            tagLabel.text = tag
            tagLabel.textColor = tagColor
            tagLabel.isHidden = false
        } else {
            tagLabel.isHidden = true
        }
    }
}
