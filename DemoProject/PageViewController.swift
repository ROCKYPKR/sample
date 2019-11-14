//
//  PageViewController.swift
//  DemoProject
//
//  Created by Macbook Pro on 11/14/19.
//  Copyright © 2019 Yarsa lab. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate{

    var images = ["logo","sample"]


    let  pageContentViewControllerIdentifier="PageContentViewController"
    let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.pageIndicatorTintColor = UIColor.gray
        pageControl.currentPageIndicatorTintColor = UIColor.white
        pageControl.frame=CGRect.zero
        return pageControl
    }()

    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {

                super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }



    required init?(coder: NSCoder) {
           super.init(coder: coder)

    }


    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        setupPageControl()

    }

    func setUpUI(){
        self.dataSource=self
        self.view.addSubview(pageControl)
        self.setViewControllers([viewControllerAtIndex(index: 0)] as? [UIViewController], direction: .forward, animated: false, completion: nil)

    }



    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! PageContentViewController).pageIndex
        if(index == 0){
            return nil
        }
        index -= 1
        return self.viewControllerAtIndex(index: index)
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! PageContentViewController).pageIndex
        index += 1
        if(index >= self.images.count){
            return nil
        }
        return self.viewControllerAtIndex(index: index)
    }

    func viewControllerAtIndex(index : Int) -> UIViewController? {
        if((self.images.count == 0) || (index >= self.images.count)) {
            return nil
        }
        let storyboard=UIStoryboard(name: "Main", bundle: nil)
        let pageContentViewController = storyboard.instantiateViewController(withIdentifier: pageContentViewControllerIdentifier) as! PageContentViewController
        pageContentViewController.photoName = self.images[index]
        pageContentViewController.pageIndex = index
        return pageContentViewController
    }

    private func setupPageControl() {
        let appearance = UIPageControl.appearance()
        appearance.pageIndicatorTintColor = UIColor.gray
        appearance.currentPageIndicatorTintColor = UIColor.white
        appearance.backgroundColor = UIColor.clear
    }

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return self.images.count
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        for subView in self.view.subviews{
            if subView is UIScrollView{
                subView.frame=UIScreen.main.bounds
            }else if subView is UIPageControl{
                subView.backgroundColor=UIColor.clear
                self.view.bringSubviewToFront(subView)
            }
        }
    }

}

