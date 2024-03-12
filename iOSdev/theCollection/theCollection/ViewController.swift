//
//  ViewController.swift
//  theCollection
//
//  Created by Fong on 3/12/24.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var theCollection: UICollectionView!
    @IBOutlet weak var thePageBar: UIPageControl!
    
    let images = ["image 1",
                 "image 2",
                 "image 3",
                 "image 4",
                 "image 5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        theCollection.delegate = self
        theCollection.dataSource = self
        theCollection.isPagingEnabled = true
        
        let layout = setLayout(number: 1)
        theCollection.setCollectionViewLayout(layout, animated: true)
        
        thePageBar.numberOfPages = images.count
    
    }
    @IBAction func thePageChange(_ sender: Any) {
        let idx = IndexPath(row: thePageBar.currentPage, section: 0)
        theCollection.scrollToItem(at: idx, at: .centeredHorizontally, animated: true)
        
        
    }
    func setLayout(number:Int, lineSpacing: CGFloat = 0 , itemSpacing:CGFloat = 0) -> UICollectionViewFlowLayout{
        let frameWidth = theCollection.frame.width
        let size = (frameWidth - CGFloat(number - 1) * itemSpacing) / CGFloat(number)
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: size, height: size)
        layout.minimumLineSpacing = lineSpacing
        layout.minimumInteritemSpacing = itemSpacing
        layout.scrollDirection = .horizontal
        
        return layout
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = theCollection.dequeueReusableCell(withReuseIdentifier: "theCell", for: indexPath) as! myCollectionViewCell
        cell.theImage.image = UIImage(named: images[indexPath.row])
        cell.setCell()
        cell.anAction = {
            let nextVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "myViewController") as! myViewController
            nextVC.preImage = UIImage(named: self.images[indexPath.row])
            self.present(nextVC, animated: true)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind{
        case UICollectionView.elementKindSectionHeader:
            let cell = theCollection.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "theHeader", for: indexPath)
            cell.backgroundColor = UIColor.green
            return cell
        case UICollectionView.elementKindSectionFooter:
            let cell = theCollection.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "theFooter", for: indexPath)
            cell.backgroundColor = UIColor.lightGray
            return cell
        default:
            fatalError("Unexpected element kind")
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if let cell = theCollection.visibleCells.first{
            if let idxpath = theCollection.indexPath(for: cell){
                print("did scroll")
                thePageBar.currentPage = idxpath.row

            }
        }
    }


}

