//
//  ViewController.swift
//  TestCase
//
//  Created by Douglas Hennrich on 23/03/22.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource {
  // MARK: Properties
  var viewModel: ViewModel?
  var items: [Partner] = []

  // MARK: Components
  let collectionView = UICollectionView(
    frame: .zero,
    collectionViewLayout: UICollectionViewLayout()
  )

  // MARK: View Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    viewModel = ViewModel()

    view.backgroundColor = .white
    view.addSubview(collectionView)

    let layout = UICollectionViewFlowLayout()
    layout.itemSize = CGSize(width: view.frame.size.width, height: 60)
    layout.minimumLineSpacing = 12
    collectionView.collectionViewLayout = layout
    collectionView.alwaysBounceVertical = true
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
    collectionView.dataSource = self
    collectionView.register(PartnerCell.self, forCellWithReuseIdentifier: "PartnerCell")

    viewModel?.service.buscaTodosParceiros { allPartners in
      self.items = allPartners
      self.collectionView.reloadData()
    }
  }

  // MARK: Actions
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    items.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: "PartnerCell", for: indexPath
    ) as! PartnerCell

    cell.config(partner: items[indexPath.item])

    return cell
  }
}

class PartnerCell: UICollectionViewCell {
  // MARK: Components
  let nomeCompleto = UILabel()

  // MARK: Actions
  override init(frame: CGRect) {
    super.init(frame: .zero)
    configureUI()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func config(partner: Partner) {
    nomeCompleto.text = "" + partner.name + " " + partner.lastName
  }

  func configureUI() {
    contentView.addSubview(nomeCompleto)
    nomeCompleto.font = .boldSystemFont(ofSize: 14)
    nomeCompleto.textColor = .darkGray
    nomeCompleto.textAlignment = .center
    nomeCompleto.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      nomeCompleto.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      nomeCompleto.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
    ])
  }
}
