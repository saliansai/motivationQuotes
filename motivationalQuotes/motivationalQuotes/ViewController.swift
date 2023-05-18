//
//  ViewController.swift
//  motivationalQuotes
//
//  Created by Raj Salian on 5/18/23.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.setTitle("Random Quote", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemIndigo
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.layer.cornerRadius = 10.0
        imageView.center = view.center
        view.addSubview(imageView)
        view.addSubview(button)
        getRandomQuote()
        button.addTarget(self, action: #selector(generateNewQuote), for: .touchUpInside)
    }
    
    let randomColors: [UIColor] = [.systemBlue, .systemRed, .systemCyan, .systemGray, .systemMint, .systemPink, .magenta, .systemIndigo, .systemOrange, .systemPurple, .systemTeal, .systemYellow, .green, .brown, .systemGray2, .systemGray3, .systemGray4, .systemGray5, .systemGray6, .clear, .lightGray]
    
    @objc func generateNewQuote(){
        getRandomQuote()
        UIView.animate(withDuration: 1, animations: {
            self.view.backgroundColor = self.randomColors.randomElement()
        })
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect(x: 30, y: view.frame.size.height-150-view.safeAreaInsets.bottom, width: view.frame.size.width-60, height: 55)
    }
    let quotes = [
        "There is nothing lost or wasted in this life. ~ Bhagavad Gita",
        "Self-control is the Mantra of Success ~ Bhagavad Gita",
        "If you want to be Great, Think Great and Positive. ~ Bhagavad Gita",
        "Perform your obligatory duty, because action is indeed better than inaction. ~ Bhagavad Gita",
        "You are what you believe in, You become that which you can become. ~ Bhagavad Gita",
        "Live a well-balanced life, it will bring peace. ~ Bhagavad Gita",
        "Lust, Anger, and Greed are the three doors to hell. ~ Bhagavad Gita",
        "Love, tolerance, and selflessness should be practiced. ~ Bhagavad Gita",
        "Detachment from material things is the way to inner peace. ~ Bhagavad Gita",
        "One who sees inaction in action, and action in inaction, is intelligent amond men. ~ Bhagavad Gita",
        "Good work never wasted, always rewarded by the God. ~ Bhagavad Gita",
        "If you don't fight for what you want, Don't cry for what you lost. ~ Bhagavad Gita",
        "Change is the law of the universe. You can be a millionaire or a pauper in an instant. ~ Bhagavad Gita",
        "It is better to live your own destiny imperfectly that to live an imitation of somebody else's life with perfection. ~ Bhagavad Gita",
        "Be calm, Do love and practice selflessness. ~ Bhagavad Gita",
        "Man is made by his belief. As he believes, so he is. ~ Bhagavad Gita",
        "When meditation is mastered, the mind is unwavering like the flame of a lamp in a windless place. ~ Bhagavad Gita",
        "Work is of utmost importance and one must work with dedication without always worrying about results. ~ Bhagavad Gita",
        "Love lives by giving and forgiving. Ego lives by getting and forgetting. ~ Sri Sathya Sai Baba",
        "Education should be for life, not for a living. ~ Sri Sathya Sai Baba",
        "We do not need different kinds of 'information'. We need 'transformation'. ~ Sri Sathya Sai Baba",
        "Money comes and goes. Morality comes and grows. ~ Sri Sathya Sai Baba",
        "Study to be steady. ~ Sri Sathya Sai Baba",
        "Those anxious to live in joy must always be doing good. ~ Sri Sathya Sai Baba",
        "Work is worship. Duty is God. ~ Sri Sathya Sai Baba",
        "Removal of immortality is the only way to immortality. ~ Sri Sathya Sai Baba",
        "The best way to love God is to love all and serve all. ~ Sri Sathya Sai Baba",
        "Conscience is our real power, strength, and awareness. ~ Sri Sathya Sai Baba",
        "Some say that knowledge is power, but it is not true. Character is power. ~ Sri Sathya Sai Baba",
        "Humanness means unity in thought, word, and deed. ~ Sri Sathya Sai Baba",
        "Gratitude is our life-breath. ~ Sri Sathya Sai Baba",
        "Love all. Serve all. Help ever. Hurt never. ~ Sri Sathya Sai Baba",
        "You can hear the footsteps of God when silence reigns in the mind. ~ Sri Sathya Sai Baba",
        "Love is the only wealth that does not diminish. It is the property of God. ~ Sri Sathya Sai Baba",
        "Distance is no bar for the dawn of love, the lotus blooms as soon as the sun peeps over the horizon. ~ Sri Sathya Sai Baba",
        "Speak with Love and it becomes Truth. ~ Sri Sathya Sai Baba",
        "Man must realize God; see God; feel God; talk to God. This is religion. ~ Sri Sathya Sai Baba",
        "Once we surrender our mind to God completely, He will take care of us in every way. ~ Sri Sathya Sai Baba",
        "Grace like water, flows from a higher to a lower level. ~ Sri Sathya Sai Baba",
        "You may worship any form, chant any name, but have firm faith in God. ~ Sri Sathya Sai Baba",
        "If you want to become fearless - choose love. ~ Rune Lazuli",
        "Dharma protects those who uphold or protect dharma. ~ Manusmriti - 8.15",
        "There is nothing noble about being superior to some other man. The true nobility is in being superior to your previous self. ~ Hindu Proverb",
        "If you change the way you look at things, the things you look at change. ~ Wayne Dyer",
        "The way I see it, if you want the rainbow, you gotta put up with the rain. ~ Dolly Parton",
        "The older you get, the more fragile you understand life to be. I think that's good motivation for getting out of bed joyfully each day. ~ Julia Roberts",
        "The purpose of our lives is to be happy. ~ Dalai Lama",
        "Be there for others, but never leave yourself behing. ~ Dodinsky",
        "Life isn't about finding yourself. Life is about creating yourself. ~ George Bernard Shaw",
        "Not in doing what you like, but in liking what you do is the secret of happiness. ~J.M. Barrie",
        "You will face many defeats in life, but never let yourself be defeated. ~ Maya Angelou",
        "A life lived in love will never be dull. ~ Leo Buscaglia",
        "Where there is no struggle, there is no strength. ~ Oprah Winfrey",
        "Stay awake, stand firm in your faith, be brave, be strong. ~ 1 Corinthians 16:13",
        "Do not pray for an easy life, pray for the strength to endure a difficult one. ~ Bruce Lee",
        "You never know how strong you are, unit being strong is your only choice. ~ Bob Marley",
        "Believe you can and you're halfway there. ~ Theodore Roosevelt",
        "You were given this life because you are strong enough to live it. ~ Ain Eineziz",
        "Nothing can dim the light which shines from within. ~ Maya Angelou",
        "Friendship is the golden thread that ties the heart of all the world. ~ John Evelyn",
        "Friendship isn't a big thing - it's a million little things. ~ Paulo Coelho",
        "A real friend is one who walks in when the rest of the world walks out. ~ Walter Winchell",
        "A good friend is like a four-leaf clover; hard to find and lucky to have. ~ Irish Proverb",
        "True friends are never apart, maybe in distance but never in heart. ~ Helen Keller",
        "True friendship resists time, distance, and silence. ~ Isabel Allende",
        "A friend is one of the best things you can be and the greatest things you can have. ~ Sarah Valdez",
        "A leader is one who knows the way, goes the way, and shows the way. ~ John Maxwell",
        "Integrity, insight, and inclusiveness are the three essential qualities of leadership. ~ Sadhguru",
        
        
    ]
    func getRandomQuote(){
        let quoteView = UITextView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
//        let label = UITextView(frame: quoteView)
        quoteView.text = quotes.randomElement()!
        quoteView.center = view.center
//        quoteView.numberOfLines = 0
        quoteView.font = .italicSystemFont(ofSize: 20)
        view.addSubview(quoteView)
        
        
    }
    
    
}

