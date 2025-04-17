//
//  MessagerContentTableView.swift
//  SpeakIA
//
//  Created by William Brando Estrada Tepec on 4/13/25.
//

import UIKit

protocol MessagerContentTableViewDelegate: AnyObject {
    
}

struct Constants {
    static var currentId: String? = "999"
}

class MessagerContentTableView: UIView {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak private var contentView: UIView!
    
    
    
    var delegate: MessagerContentTableViewDelegate?
    var dataSource: [UserChat]  = [UserChat(id: "1", name: "Este es un mensjae de prueba"),
                                    UserChat(id: "999", name: "Este es un mensjae de prueba"),
                                    UserChat(id: "3", name: "Este es un mensjae de prueba, Este es un mensjae de prueba 2, Este es un mensjae de prueba 3, Este es un mensjae de prueba 4, Este es un mensjae de prueba 5,Este es un mensjae de prueba 6, Este es un mensjae de prueba 7, Este es un mensjae de prueba 8, Este es un mensjae de prueba 9 "),
                                   UserChat(id: "4", name: "Este es un mensjae de prueba"),UserChat(id: "999", name: "Este es un mensjae de prueba"),UserChat(id: "1", name: "Este es un mensjae de prueba"),UserChat(id: "1", name: "Este es un mensjae de prueba"),UserChat(id: "999", name: "Este es un mensjae de prueba"),UserChat(id: "1", name: "Este es un mensjae de prueba"),UserChat(id: "999", name: "Este es un mensjae de prueba"),UserChat(id: "1", name: "Este es un mensjae de prueba"),UserChat(id: "1", name: "Este es un mensjae de prueba", lastMessageDate: "")]
    
    private struct Constants {
        static let cellIdentify: String = MessagerTableViewCell.reuseIdentifier
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    deinit {
        print("Se elimino MessagerContentTableView")
    }

    func setupUI()  {
        Bundle(for: Self.self).loadNibNamed("MessagerContentTableView", owner: self, options: nil)

        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        let UInib =  UINib(nibName: Constants.cellIdentify, bundle: BundleClass().bundle)
        tableView.register(UInib, forCellReuseIdentifier: MessagerTableViewCell.reuseIdentifier)
        tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentify)
    }
    
    
}

extension MessagerContentTableView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentify) as? MessagerTableViewCell else { return  UITableViewCell() }
        
        cell.loadData(data: dataSource[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dataSource[indexPath.row].lastMessageDate = "Traduciendo al ingles con un texto mas amplio que se pueda traducir blablablbalba..."
        dataSource[indexPath.row].isTyping = true
        tableView.reloadRows(at: [indexPath], with: .automatic)
        
        
    }
}
