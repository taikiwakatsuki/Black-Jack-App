//
//  Game2ViewController.swift
//  Black Jack
//
//  Created by Taiki Wakatsuki on 2020/01/29.
//  Copyright © 2020 Taiki Wakatsuki. All rights reserved.
//  

import UIKit

class Game2ViewController: UIViewController {
    
    var card = [Int]()
    var player_card = [Int]()
    var dealer_card = [Int]()
    var time = 0.5
    var card4 = UIImageView()
    
    @IBOutlet weak var DealerCards: UIStackView!
    @IBOutlet weak var PlayerCards: UIStackView!
    @IBOutlet weak var Hit: UIButton!
    @IBOutlet weak var Stand: UIButton!
    @IBOutlet weak var DealerLabel: UILabel!
    @IBOutlet weak var PlayerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var number = Int.random(in: 0..<52)
        card.append(number)

        while_: while true {
            var number = Int.random(in: 0..<52)
            card.append(100)
            for_: for x in card {
                if x == number {
                    card.removeLast()
                    break for_
                } else if x == 100 {
                    card.removeLast()
                    card.append(number)
                    break while_
                }
            }
        }
        while_: while true {
            var number = Int.random(in: 0..<52)
            card.append(100)
            for_: for x in card {
                if x == number {
                    card.removeLast()
                    break for_
                } else if x == 100 {
                    card.removeLast()
                    card.append(number)
                    break while_
                }
            }
        }
        while_: while true {
            var number = Int.random(in: 0..<52)
            card.append(100)
            for_: for x in card {
                if x == number {
                    card.removeLast()
                    break for_
                } else if x == 100 {
                    card.removeLast()
                    card.append(number)
                    break while_
                }
            }
        }
        
        PlayerLabel.text = "You"
        DealerLabel.text = "Dealer"
        
        var count = 0
        for x in card {
            if count == 0 || count == 1 {
                var card_tmp = UIImageView()
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time) {
                    card_tmp.image = UIImage(named: String(x))
                }
                time += 0.5
                card_tmp.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
                card_tmp.widthAnchor.constraint(equalToConstant: 80.0).isActive = true
                card_tmp.translatesAutoresizingMaskIntoConstraints = false
                PlayerCards.addArrangedSubview(card_tmp)
                var int_tmp = x % 13 + 1
                if int_tmp == 13 || int_tmp == 12 || int_tmp == 11 {
                    int_tmp = 10
                } else if int_tmp == 1 {
                    int_tmp = 11
                }
                player_card.append(int_tmp)
            } else if count == 2 {
                var card_tmp = UIImageView()
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time) {
                    card_tmp.image = UIImage(named: String(x))
                }
                time += 0.5
                card_tmp.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
                card_tmp.widthAnchor.constraint(equalToConstant: 80.0).isActive = true
                card_tmp.translatesAutoresizingMaskIntoConstraints = false
                DealerCards.addArrangedSubview(card_tmp)
                var int_tmp = x % 13 + 1
                if int_tmp == 13 || int_tmp == 12 || int_tmp == 11 {
                    int_tmp = 10
                } else if int_tmp == 1 {
                    int_tmp = 11
                }
                dealer_card.append(int_tmp)
            } else {
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time) {
                    self.card4.image = UIImage(named: "card")
                }
                time += 0.5
                card4.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
                card4.widthAnchor.constraint(equalToConstant: 80.0).isActive = true
                card4.translatesAutoresizingMaskIntoConstraints = false
                DealerCards.addArrangedSubview(card4)
                var int_tmp = x % 13 + 1
                if int_tmp == 13 || int_tmp == 12 || int_tmp == 11 {
                    int_tmp = 10
                } else if int_tmp == 1 {
                    int_tmp = 11
                }
                dealer_card.append(int_tmp)
            }
            count += 1
        }
        
        var player_card_total = 0
        for x in player_card {
            player_card_total += x
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time) {
            self.PlayerLabel.text = String(player_card_total)
            self.DealerLabel.text = String(self.dealer_card[0])
        }
        
    }
    
    @IBAction func ClickedHit(_ sender: Any) {
        while_: while true {
            var number = Int.random(in: 0..<52)
            card.append(100)
            for_: for x in card {
                if x == number {
                    card.removeLast()
                    break for_
                } else if x == 100 {
                    card.removeLast()
                    card.append(number)
                    break while_
                }
            }
        }
        var tmp = card.last!
        var card_tmp = UIImageView()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
            card_tmp.image = UIImage(named: String(tmp))
        }
        card_tmp.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
        card_tmp.widthAnchor.constraint(equalToConstant: 80.0).isActive = true
        card_tmp.translatesAutoresizingMaskIntoConstraints = false
        PlayerCards.addArrangedSubview(card_tmp)
        var int_tmp = tmp % 13 + 1
        if int_tmp == 13 || int_tmp == 12 || int_tmp == 11 {
            int_tmp = 10
        } else if int_tmp == 1 {
            int_tmp = 11
        }
        player_card.append(int_tmp)
        
        var player_card_total = 0
        for x in player_card {
            player_card_total += x
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0) {
            self.PlayerLabel.text = String(player_card_total)
        }
        
        if_2: if player_card_total > 21 {
            while_2: while true {
                var count = player_card.count
                player_card.append(100)
                for_2: for x in 0..<count {
                    if player_card[x] == 11 {
                        player_card[x] = 1
                        player_card.removeLast()
                        player_card_total = 0
                        for y in player_card {
                            player_card_total += y
                        }
                        if player_card_total > 21 {
                            break for_2
                        } else {
                            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0) {
                                self.PlayerLabel.text = String(player_card_total)
                            }
                            break if_2
                        }
                    } else if player_card[x] == 100 {
                        player_card.removeLast()
                        break while_2
                    }
                }
            }
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0) {
                self.PlayerLabel.text = "Burst"
                self.PlayerLabel.textColor = UIColor.red
            }
            var dealer_card_total_tmp = 0
            for x in dealer_card {
                dealer_card_total_tmp += x
            }
            var card_tmp = UIImageView()
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) {
                self.DealerCards.removeArrangedSubview(self.card4)
                self.card4.removeFromSuperview()
                card_tmp.image = UIImage(named: String(self.card[3]))
                self.DealerCards.insertArrangedSubview(card_tmp,at: 1)
            }
            card_tmp.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
            card_tmp.widthAnchor.constraint(equalToConstant: 80.0).isActive = true
            card_tmp.translatesAutoresizingMaskIntoConstraints = false
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.0) {
                self.DealerLabel.text = String(dealer_card_total_tmp)
            }
            var dealer_card_total = dealer_card_total_tmp
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time) {
                self.changeView()
            }
        }
    }
    
    @IBAction func ClickedStand(_ sender: Any) {
        var dealer_card_total_tmp = 0
        for x in dealer_card {
            dealer_card_total_tmp += x
        }
        DealerCards.removeArrangedSubview(card4)
        card4.removeFromSuperview()
        var card_tmp = UIImageView()
        time = 0.5
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time) {
            card_tmp.image = UIImage(named: String(self.card[3]))
        }
        time += 0.5
        card_tmp.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
        card_tmp.widthAnchor.constraint(equalToConstant: 80.0).isActive = true
        card_tmp.translatesAutoresizingMaskIntoConstraints = false
        DealerCards.insertArrangedSubview(card_tmp,at: 1)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time) {
            self.DealerLabel.text = String(dealer_card_total_tmp)
        }
        time += 0.5
        var dealer_card_total = dealer_card_total_tmp
        
        while dealer_card_total < 17 {
            while_: while true {
                var number = Int.random(in: 0..<52)
                card.append(100)
                for_: for x in card {
                    if x == number {
                        card.removeLast()
                        break for_
                    } else if x == 100 {
                        card.removeLast()
                        card.append(number)
                        break while_
                    }
                }
            }
            var tmp = card.last!
            var card_tmp = UIImageView()
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time) {
                card_tmp.image = UIImage(named: String(tmp))
            }
            time += 0.5
            card_tmp.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
            card_tmp.widthAnchor.constraint(equalToConstant: 80.0).isActive = true
            card_tmp.translatesAutoresizingMaskIntoConstraints = false
            DealerCards.addArrangedSubview(card_tmp)
            var int_tmp = tmp % 13 + 1
            if int_tmp == 13 || int_tmp == 12 || int_tmp == 11 {
                int_tmp = 10
            } else if int_tmp == 1 {
                int_tmp = 11
            }
            dealer_card.append(int_tmp)

            var dealer_card_total_tmp2 = 0
            for x in dealer_card {
                dealer_card_total_tmp2 += x
            }
            
//            ここ
//            while_2: while true {
//                var count = dealer_card.count
//                dealer_card.append(100)
//                for_2: for x in 0..<count {
//                    if dealer_card[x] == 11 {
//                        dealer_card[x] = 1
//                        dealer_card.removeLast()
//                        dealer_card_total_tmp2 = 0
//                        for y in dealer_card {
//                            dealer_card_total_tmp2 += y
//                        }
//                        if dealer_card_total_tmp2 > 21 {
//                            dealer_card.removeLast()
//                            break for_2
//                        } else {
//                            break while_2
//                        }
//                    } else if dealer_card[x] == 100 {
//                        dealer_card.removeLast()
//                        break while_2
//                    }
//                }
//            }
            
            dealer_card_total = dealer_card_total_tmp2

            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time) {
                self.DealerLabel.text = String(dealer_card_total)
            }
            time += 0.5
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time) {
            self.changeView()
        }
    }
        
    func changeView() {
        self.performSegue(withIdentifier: "toGame3", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        var Player_total = 0
        var Dealer_total = 0

        for x in player_card {
            Player_total += x
        }

        for y in dealer_card {
            Dealer_total += y
        }

        if segue.identifier == "toGame3" {
            let nextVC = segue.destination as! Game3ViewController
            nextVC.argString_P = String(Player_total)
            nextVC.argString_D = String(Dealer_total)
        }
    }
}
/*
// MARK: - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // Get the new view controller using segue.destination.
    // Pass the selected object to the new view controller.
}
*/

