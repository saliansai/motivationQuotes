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
        button.setTitle("New Quote", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemIndigo
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
//        imageView.layer.cornerRadius = 10.0
        imageView.center = view.center
        view.addSubview(imageView)
        view.addSubview(button)
        getRandomQuote()
        button.addTarget(self, action: #selector(generateNewQuote), for: .touchUpInside)
    }
    
    let randomColors: [UIColor] = [.systemBlue, .systemRed, .systemCyan, .systemGray, .systemMint, .systemPink, .magenta, .systemIndigo, .systemOrange, .systemPurple, .systemTeal, .systemYellow, .green, .brown, .systemGray2, .systemGray3, .clear, .lightGray]
    
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
        "The meaning of Karma is in the intention. The intention behind action is what matters. ~ Bhagavad Gita",
        "He alone sees truly who sees the lord the same in every creature, seeing the same lord everywhere, he does not harm himself or others. ~ Bhagavad Gita",
        "Change is the law of the Universe. You can be a millionaire or a beggar in a moment. ~ Bhagavad Gita",
        "Death is as sure for that which is born, as birth is for that which is dead. Therefore grieve not for what is inevitable. ~ Bhagavad Gita",
        "No one who does good work will ever come to a bad end, either here or in the world to come. ~ Bhagavad Gita",
        "Whatever you do, make it an offering to the food you eat, the sacrifices you make, the help you give, even your suffering. ~ Bhagavad Gita",
        "The power of God is with you at all times; through the activities of mind, senses, breathing, and emotions; and is constantly doing all the work using you as a mere instrument. ~ Bhagavad Gita",
        "There is no truth superior to Me. Everything rests upon Me, as pearls are strung on a thread. ~ Bhagavad Gita",
        "I am born in every age to protect the good, to destroy evil, and to reestablish dharma. ~ Bhagavad Gita",
        "Of the unreal, there is no existence. Of the real there is no nonexistence. The final truth of both of these is known by men of wisdom. ~ Bhagavad Gita",
        "Renounce the ego of individuality and rejoice in the bliss of infinity. ~ Bhagavad Gita",
        "The immature think that knowledge and action are different, but the wise see them as the same. ~ Bhagavad Gita",
        "I am the beginning, middle, and end of creation. ~ Bhagavad Gita",
        "A man who is really earnest must begin with himself, he must be passively aware of all his thoughts, feelings and actions. ~ Bhagavad Gita",
        "Fill your mind with me; love me; serve me; worship me always. Seeking me in your heart, you will at last be united with me. ~ Bhagavad Gita",
        "Choosing the right over the pleasant is a sign of power. ~ Bhagavad Gita",
        "If you do karma with selfless action, then you will be able to free yourself from the bondage of desires. ~ Bhagavad Gita",
        "The soul migrates from body to body. Weapons cannot cleave it, nor fire consume it, nor water drench it, nor wind dry it. ~ Bhagavad Gita",
        "He who has no attachments can really love others. For his love is pure and divine ~ Bhagavad Gita",
        "What has happened has happened for good, what is happening is also happening for good, and what will happen will also be for good. ~ Bhagavad Gita",
        "The wise work for the welfare of the world, without thought for themselves. ~ Bhagavad Gita",
        "Choosing the right over the pleasant is the sign of power ~ Bhagavad Gita",
        "The one who is motivated only by the desire for the fruits of their action, and anxious about the results, is miserable indeed. ~ Bhagavad Gita",
        "The causes of anger rarely hurt us as much as the consequences of anger. ~ Bhagavad Gita",
        "Just because we have a right to be angry doesn't mean we are right to be angry. ~ Bhagavad Gita",
        "A gift is pure when it is given from the heart to the right person at the right time and at the right place, and when we expect nothing in return. ~ Bhagavad Gita",
        "We are kept from our goal, not by obstacles, but by a clear path to a lesser goal. ~ Bhagavad Gita",
        "No one should abandon duties because he sees defects in them. Every action, every activity, is surrounded by defects as fire is surrounded by smoke. ~ Bhagavad Gita",
        "Better indeed is knowledge than mechanical practice. Better than knowledge is meditation. ~ Bhagavad Gita",
        "The mind acts like an enemy for those who do not control it. ~ Bhagavad Gita",
        "As a human being puts on new garments, giving up old ones, the soul similarly accepts new material bodies, giving up the old and useless ones. ~ Bhagavad Gita",
        "He who is deluded by the ego thinks, I am the doer. ~ Bhagavad Gita",
        "Whatever action is performed by a great man, common men follow in his footsteps, and whatever standards he sets by exemplary acts, all the world pursues. ~ Bhagavad Gita",
        "Work for work's sake, not for yourself. Act but do not be attached to your actions. Be in the world, but not of it. ~ Bhagavad Gita",
        "When consciousness is unified, however, all vain anxiety is left behind. There is no cause for worry, whether things go well or ill. ~ Bhagavad Gita",
        "Those established in self-realization control their senses instead of letting their senses control them. ~ Bhagavad Gita",
        "Be aware of me always, adore me, make every act an offering to me, and you shall come to me; this I promise; for you are dear to me. ~ Bhagavad Gita",
        "Out of compassion, I destroy the darkness of their ignorance. From within them I light the lamp of wisdom and dispel all darkness from their lives. ~ Bhagavad Gita",
        "Fear of failure, from being emotionally attached to the fruit of work, is the greatest impediment to success. ~ Bhagavad Gita",
        "We never really encounter the world; all we experience is our own nervous system. ~ Bhagavad Gita",
        "I enter into each planet, and by My energy, they stay in orbit. I become the moon and thereby supply the juice of life to all vegetables. ~ Bhagavad Gita",
        "Curving back within myself I create again and again. ~ Bhagavad Gita",
        "The peace of God is with them whose mind and soul are in harmony, who are free from desire and wrath, who know their own soul. ~ Bhagavad Gita",
        "The man who sees me in everything and everything within me will not be lost to me, nor will I ever be lost to him. ~ Bhagavad Gita",
        "Selfish action imprisons the world. Act selflessly, without any thought of personal profit. ~ Bhagavad Gita",
        "Reshape yourself through the power of your will; never let youself be degraded by self-will. ~ Bhagavad Gita",
        "The true goal of action is knowledge of the self. ~ Bhagavad Gita",
        "When a person responds to the joys and sorrows of others as if they were his own, he has attained the highest state of spiritual union. ~ Bhagavad Gita",
        "There was never a time when I did not exist, nor you, nor any of these kings. Nor is there any future in which we shall cease to be. ~ Bhagavad Gita",
        "Actions do not cling to me because I am not attached to their results. Those who understand this and practice it live in freedom. ~ Bhagavad Gita",
        "His judgment will be better and his vision clear if he is not emotionally entangled in the outcome of what he does. ~ Bhagavad Gita",
        "The struggle for self-mastery that every human being must wage if he or she is to emerge from life victorious. ~ Bhagavad Gita",
        "Cultivate vigor, patience, will, purity; avoid malice and price. ~ Bhagavad Gita",
        "Earth, water, fire, air, akasha, mind, intellect, and ego - these are the eight divisions of my prakriti. ~ Bhagavad Gita",
        "The soul is neither born and nor does it die. ~ Bhagavad Gita",
        "Man is made by his belief. As he believes, so he is. ~ Bhagavad Gita",
        "Do everything you have to do, but not with greed, not with ego, not with lust, not with envy but with love, compassion, humility, and devotion. ~ Bhagavad Gita"
        
        
    ]
    func getRandomQuote(){
        let quoteView = UITextView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        quoteView.text = quotes.randomElement()!
        quoteView.center = view.center
        quoteView.font = .italicSystemFont(ofSize: 20)
        view.addSubview(quoteView)
        
    }
    
    
}

