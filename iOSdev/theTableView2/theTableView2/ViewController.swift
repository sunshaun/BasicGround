//
//  ViewController.swift
//  theTableView2
//
//  Created by Fong on 3/7/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var theSeg: UISegmentedControl!
    
    @IBOutlet weak var theTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        theTableView.delegate = self
        theTableView.dataSource = self
        theTableView.refreshControl = UIRefreshControl()
        theTableView.refreshControl?.addTarget(self, action: #selector(theRefreshAction(_:)), for: .valueChanged)
        
    }
    
    @objc func theRefreshAction(_ Sender:Any){
        let refreshIdx = (theSeg.selectedSegmentIndex + 1) % 5
        theSeg.selectedSegmentIndex = refreshIdx
//        let idxSet = IndexSet(integer: 0)
//        theTableView.reloadSections(idxSet, with: .fade)
//        
        theTableView.refreshControl?.endRefreshing()
    }
    
    @IBAction func theSelectChanged(_ sender: Any) {
        theTableView.refreshControl?.beginRefreshing()
        CATransaction.begin()
        let idxSet = IndexSet(integer: 0)
        theTableView.reloadSections(idxSet, with: .top)

        CATransaction.setCompletionBlock{
            self.theTableView.refreshControl?.endRefreshing()
        }
        CATransaction.commit()
    }
    
    let countriesList: [String: [String]] = [
        "美洲": ["美國", "加拿大", "巴西", "墨西哥", "阿根廷", "智利", "哥倫比亞", "委內瑞拉", "秘魯", "厄瓜多爾", "古巴", "多米尼加共和國", "瓜地馬拉", "玻利維亞", "洪都拉斯", "巴拉圭", "尼加拉瓜", "薩爾瓦多", "貝里斯", "巴哈馬"],
        "亞洲": ["中國", "印度", "印度尼西亞", "巴基斯坦", "孟加拉國", "日本", "菲律賓", "越南", "伊朗", "土耳其", "泰國", "緬甸", "韓國", "伊拉克", "阿富汗", "沙特阿拉伯", "烏茲別克斯坦", "馬來西亞", "也門", "尼泊爾"],
        "歐洲": ["俄羅斯", "德國", "英國", "法國", "義大利", "西班牙", "烏克蘭", "波蘭", "羅馬尼亞", "荷蘭", "比利時", "捷克", "希臘", "葡萄牙", "瑞典", "匈牙利", "白俄羅斯", "奧地利", "保加利亞", "塞爾維亞"],
        "非洲": ["尼日利亞", "埃及", "衣索比亞", "剛果（金）", "坦尚尼亞", "南非", "肯雅", "阿爾及利亞", "莫桑比克", "加納", "象牙海岸", "喀麥隆", "馬達加斯加", "安哥拉", "馬里", "贊比亞", "布基納法索", "尼日爾", "烏干達", "馬拉維"],
        "大洋洲": ["澳大利亞", "巴布亞新幾內亞", "新西蘭", "斐濟", "所羅門群島", "瓦努阿圖", "薩摩亞", "基里巴斯", "密克羅尼西亞聯邦", "湯加", "帕勞", "馬紹爾群島", "瑙魯", "土阿莫土群島", "東加", "庫克群島", "聖文森特和格林納丁斯", "密克羅尼西亞"],
    ]


}

extension ViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let title = theSeg.titleForSegment(at: theSeg.selectedSegmentIndex) ?? ""
        var count = 0
        if let country = countriesList[title] {
            count = country.count
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let title = theSeg.titleForSegment(at: theSeg.selectedSegmentIndex) ?? ""
        if let country = countriesList[title] {
            cell.textLabel?.text = country[indexPath.row]
        }
        
        return cell
    }
    
    
}

