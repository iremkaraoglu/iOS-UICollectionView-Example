//
//  ViewController.swift
//  CollectionViewDemo
//
//  Created by İrem Karaoğlu on 13.11.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    let colorData = [ #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1) , #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1) , #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1) , #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1) , #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1) , #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1) ,
                      #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1) , #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1) , #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1) , #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1) , #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1) , #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1) ,
                      #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1) , #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1) , #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1) , #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1) , #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1) , #colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1) ,
                      #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1) , #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1) , #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1) , #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1) , #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1) , #colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1) ]

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colorData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ColorCollectionViewCell

        let innerViewColorIndex = (indexPath.item + 2) % colorData.count

        cell.setup(backgroundColor:  colorData[indexPath.item],
                   innerBackgroundColor: colorData[innerViewColorIndex])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header", for: indexPath)
        return view
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let columns: CGFloat = 4
        let collectionViewWidth = collectionView.bounds.width
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let spaceBetweenCells = flowLayout.minimumInteritemSpacing * (columns - 1)
        let adjustedWidth = collectionViewWidth - spaceBetweenCells
        let width: CGFloat = adjustedWidth / columns
        let height: CGFloat = 100

        if indexPath.item % 5 == 0 ||  indexPath.item % 8 == 0  {
            return CGSize(width: width, height: height + 35)
        }
        return CGSize(width: width, height: height)
    }
}
