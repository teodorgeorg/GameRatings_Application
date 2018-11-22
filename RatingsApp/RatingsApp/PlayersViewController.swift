import UIKit

class PlayersViewController: UITableViewController {
    
    // MARK: - Properties
    var players = SampleData.generatePlayersData()
}

// MARK: - IBActions
extension PlayersViewController {
    
    @IBAction func cancelToPlayersViewController(_ segue: UIStoryboardSegue) {
    }
    
    @IBAction func savePlayerDetail(_ segue: UIStoryboardSegue) {
        
        guard let playerDetailsViewController = segue.source as? PlayerDetailsViewController,
            let player = playerDetailsViewController.player else {
                return
        }
        
        // add the new player to the players array
        players.append(player)
        
        // update the tableView
        let indexPath = IndexPath(row: players.count - 1, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
}

// MARK: - UITableViewDataSource
extension PlayersViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell",
                                                 for: indexPath) as! PlayerCell
        
        let player = players[indexPath.row]
        cell.player = player
        return cell
    }
}
