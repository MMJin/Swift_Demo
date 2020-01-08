//
//  HomeClassifyController.swift
//  Swift_Demo
//
//  Created by FCNC05 on 2019/11/21.
//  Copyright © 2019 FCNC05. All rights reserved.
//

import Foundation
import SwiftyJSON
import HandyJSON
import SwiftMessages

//首页推荐的控制器
class HomeRecommendController: UIViewController {
    let otherMessages = SwiftMessages()
    //mark - 数据模型
    private var recommnedAdvertList:[RecommnedAdvertModel]?// 穿插的广告数据
    //MARK - cell 注册ID
    private let FMRecommendHeaderViewID     = "FMRecommendHeaderView"
    private let FMRecommendFooterViewID     = "FMRecommendFooterView"

    private let FMRecommendHeaderCellID     = "FMRecommendHeaderCell"
    private let FMRecommendGuessLikeCellID  = "FMRecommendGuessLikeCell"
    private let FMHotAudiobookCellID        = "FMHotAudiobookCell"
    private let FMAdvertCellID              = "FMAdvertCell"
    private let FMOneKeyListenCellID        = "FMOneKeyListenCell"
    private let FMRecommendForYouCellID     = "FMRecommendForYouCell"
    private let HomeRecommendLiveCellID     = "HomeRecommendLiveCell"
//懒加载
    lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        let  collection = UICollectionView.init(frame:.zero, collectionViewLayout: layout)
        collection.delegate = self as? UICollectionViewDelegate
        collection.dataSource = self as? UICollectionViewDataSource
        collection.backgroundColor = UIColor.white
        //注册头视图和尾视图
        collection.register(FMRecommendHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: FMRecommendHeaderCellID)
        collection.register(FMRecommendFooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: FMRecommendFooterViewID)

        return collection
    }()

    lazy var viewModel : HomeRecommendViewModel = {
        return HomeRecommendViewModel()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.collectionView)
        self.collectionView.snp.makeConstraints{(make)in
            make.width.height.equalToSuperview()
            make.center.equalToSuperview()
        }
       self.collectionView.uHead.beginRefreshing()
        loadData()
        loadRecommendAdData()
    }

    func loadData() {
        //加载数据
        viewModel.updataBlock = {[unowned self] in
            self.collectionView.uHead.endRefreshing()
            //更新列表数据
            self.collectionView.reloadData()
        }
        viewModel.refreshDataSource()
    }
}
