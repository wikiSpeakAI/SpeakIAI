//
//  HomeSpeak.swift
//  SpeakIA
//
//  Created by William Brando Estrada Tepec on 4/8/25.
//

import UIKit

protocol HomeSpeakViewControllerProtocol: AnyObject {
    func loadData(LearnidMethod: [LearningMethod]?)
}


class HomeSpeakViewController:  BaseController, ViewProtocol {
    var presenter: HomeSpeakPresenterProtocol?
    @IBOutlet weak var contetWelcomenMenu: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNeedsStatusBarAppearanceUpdate()
        welcomeMenu.delegate = self
        setup()
        presenter?.fetchData()
    }
    
    init(){
        super.init(nibName: "HomeSpeakViewController", bundle: BundleClass().bundle)
    }
    deinit {
        print("Deleted HomeSpeakViewController")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    lazy var welcomeMenu = { [weak self] in
        var welcomeMenu = ContainerHomeCollectionView()
        welcomeMenu.delegate = self
        welcomeMenu.translatesAutoresizingMaskIntoConstraints = false
        return welcomeMenu
    }()
    
    func setup() {
        self.contetWelcomenMenu.addSubview(welcomeMenu)
        NSLayoutConstraint.activate([
            welcomeMenu.leadingAnchor.constraint(equalTo: contetWelcomenMenu.leadingAnchor),
            welcomeMenu.trailingAnchor.constraint(equalTo: contetWelcomenMenu.trailingAnchor),
            welcomeMenu.topAnchor.constraint(equalTo: contetWelcomenMenu.topAnchor),
            welcomeMenu.bottomAnchor.constraint(equalTo: contetWelcomenMenu.bottomAnchor)
        ])
        //welcomeMenu.configData("Bienvenido")
    }
    
}

extension HomeSpeakViewController: HomeSpeakViewControllerProtocol {
    func loadData(LearnidMethod: [ LearningMethod]?) {
        welcomeMenu.dataSource = LearnidMethod
    }
    
    
}

extension HomeSpeakViewController : ContainerHomeCollectionViewProtocol {
    func didSelectFlow(flow: LearningMethod) {
        presenter?.gotoFlow(flow: flow )
    }

    
    
}
