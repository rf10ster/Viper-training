//
//  MoviesListViewController.swift
//  MovieWebService
//
//  Created by Алексей Киселев on 15/11/2017.
//  Copyright © 2017 TestCompany. All rights reserved.
//

import UIKit

class MoviesListViewController: UIViewController, StoryboardLoadable {

    @IBOutlet var tableView : UITableView!
    @IBOutlet var activityIndicator : UIActivityIndicatorView!
    
    var output: MoviesListPresenterProtocol!
    
    fileprivate var data: MovieListDisplayData?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        output.triggerViewIsReady()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        output.fetchFilms()
    }
}

extension MoviesListViewController: MovieLislViewInterface {
    
    // MARK: - MovieLislViewInterface
    
    func setupInitialState() {
        navigationItem.title = "RootViewController";
        view.backgroundColor = UIColor.white
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func showLoading() {
        tableView.isHidden = true
        activityIndicator.startAnimating()
    }
    
    func show(data: MovieListDisplayData) {
        self.data = data
        tableView.isHidden = false
        activityIndicator.stopAnimating()
        tableView.reloadData()
    }
}

extension MoviesListViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: view.window != nil)
        /*
         DetailsModuleBuilder *builder = [DetailsModuleBuilder new];
         [appDelegate.navigationController pushViewController:[builder buildWith:film] animated:YES];
         */
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.films.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //@property (nonatomic, strong) IBOutlet CellTableViewCell *movieCell;
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

