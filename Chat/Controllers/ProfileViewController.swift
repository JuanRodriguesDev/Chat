//
//  ProfileViewController.swift
//  Chat
//
//  Created by Paulo Koga on 12/07/22.
//

import UIKit
import FirebaseAuth

class ProfileViewController: UIViewController {

   
    @IBOutlet var tableView: UITableView!
    
    let data = ["Log out"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableView.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        
    }

}
 
extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.textColor = .red
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        do {
           try  FirebaseAuth.Auth.auth().signOut()
            
            let vc = LoginViewController()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            
            present(vc, animated: false)
        }
        catch {
            print("Falha ao deslogar")
        }
    }
}

//https://www.reddit.com/r/swift/comments/vebepu/thread_1_must_pass_a_class_of_kind_uitableviewcell/
// 10:58
