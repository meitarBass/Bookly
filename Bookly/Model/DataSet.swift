//
//  DataSet.swift
//  Bookly
//
//  Created by Meitar Basson on 16/08/2020.
//  Copyright © 2020 Meitar Basson. All rights reserved.
//

import Foundation

class DataSet {
    let genres = [
        BookGenre(genre: "Math", imgName: "math"),
        BookGenre(genre: "Fairytale", imgName: "fairytale"),
        BookGenre(genre: "Fantasy", imgName: "fantasy"),
        BookGenre(genre: "Children's", imgName: "children's")
    ]


    var math = [
        Book(name: "Weapons of Math Destruction", desciprtion: "We live in the age of the algorithm. Increasingly, the decisions that affect our lives - where we go to school, whether we get a loan, how much we pay for insurance - are being made not by humans, but by mathematical models. In theory, this should lead to greater fairness: everyone is judged according to the same rules, and bias is eliminated. ", note: "", author: "Cathy O'neil",imgName: "math1"),
        Book(name: "Hello World", desciprtion: "Hannah Fry takes us on a tour of the good, the bad and the downright ugly of the algorithms that surround us. In Hello World she lifts the lid on their inner workings, demonstrates their power, exposes their limitations, and examines whether they really are an improvement on the humans they are replacing.", note: "", author: "Hannah Fry", imgName: "math2"),
        Book(name: "The Math Book", desciprtion: "This is an accessible, fascinating book that unravels the mysteries and beauty of mathematics. It covers 250 milestones in mathematical history. ", note: "", author: "Clifford A. Pickover", imgName: "math3"),
        Book(name: "The Boy Who Loved Math", desciprtion: "Most people think of mathematicians as solitary, working away in isolation. And, it's true, many of them do.", note: "", author: "LeUyen Pham", imgName: "math4"),
        Book(name: "What's Math Got to Do with It?", desciprtion: " As always Jo Boaler presents research findings through practical ideas that can be used in classrooms and homes. ", note: "", author: "Jo Boaler", imgName: "math5"),
        Book(name: "Bedtime Math", desciprtion: "Our mission: to make math a fun part of kids' everyday lives. We all know it's wonderful to read bedtime stories to kids, but what about doing math?", note: "", author: "Jim Paillot", imgName: "math6"),
        Book(name: "Amazing Visual Math", desciprtion: "Covering the essential math concepts learned in the first years of school, Amazing Visual Math brings a whole new dimension to learning. ", note: "", author: "DK", imgName: "math7"),
        Book(name: "Brain Games For Clever Kids", desciprtion: "Brain Games for Clever Kids is a fantastic bestselling puzzle book, brimming with memory, word and number workouts for the cleverest of kids!", note: "", author: "Garete Moore", imgName: "math8"),
        Book(name: "See Inside Maths", desciprtion: " As well as over 50 embedded flaps to lift, each page includes a host of puzzles and games for readers to test their newfound maths skills on, making the book an interactive and informative experience. It is illustrated in a fun and accessible style by Colin King. ", note: "", author: "Colin King", imgName: "math9")
    ]

    var fairytale = [
        Book(name: "Peppa Pig: Fairy Tale Little Library", desciprtion: "The perfect book collection for the littlest readers! ", note: "", author: "Peppa Pig", imgName: "fairytale1"),
        Book(name: "Peep Inside a Fairy Tale Cinderella", desciprtion: "This classic fairytale is given a new lease of life with the exquisite illustrations and elegant flaps and peep-through holes. The second title in a new series which takes the format of the bestselling 'Peep Inside' non-fiction series and applies it to much-loved fairy tales. Likely to become firm favourite for little ones and sure to have children asking before bedtime.", note: "", author: " Anna Milbourne", imgName: "fairytale2"),
        Book(name: "Peep Inside a Fairy Tale Little Red Riding Hood", desciprtion: "Journey into the woods with Little Red Riding Hood, peeping through the trees, lifting flaps to see what's beneath things, and watching granny's cottage emerge with each turn of the page. Delicate cutaways and holes to peep through are layered on top of each other to create a magical filigree effect, drawing children in to the story.", note: "", author: "Júlia Sardà Portabella", imgName: "fairytale3"),
        Book(name: "The Fairy Tale Colouring Book", desciprtion: "This enchanting colouring book is full of beautiful scenes from everyone's favourite fairy tales, from Cinderella, The Little Mermaid and Sleeping Beauty to Little Red Riding Hood, Snow White, Beauty and the Beast and lots, lots more. Children will love to colour the magical scenes and bring these classic tales to life.", note: "", author: "Rachel Cloyne", imgName: "fairytale4"),
        Book(name: "Peep Inside a Fairy Tale Beauty & The Beast", desciprtion: "Belle's inventor father stumbles upon the Beast's castle and is taken prisoner, Belle comes to the rescue and agrees to take her father's place. She sees beneath the Beast's exterior and discovers the heart and soul of a human prince. Delicate cutaways and holes to peep through are layered on top of each other to create a magical filigree effect, drawing children in to the story.", note: "", author: "Lorena Alvarez", imgName: "fairytale5"),
        Book(name: "Fierce Fairytales : & Other Stories to Stir Your Soul", desciprtion: "For readers who enjoyed Goodnight Stories for Rebel Girls, this empowering collection of stories, poems and beautiful hand-drawn illustrations gives Once Upon a Time a much-needed modern makeover. ", note: "", author: "Nikita Gill", imgName: "fairytale6"),
        Book(name: "Fairy Tale Lenormand", desciprtion: "Fairy Tales have been teaching us timeless life lessons for centuries.", note: "", author: "Lisa Hunt", imgName: "fairytale7"),
        Book(name: "Peep Inside A Fairy Tale Sleeping Beauty", desciprtion: "Cursed at birth, Sleeping Beauty is destined to fall asleep for a hundred years on her sixteenth birthday.", note: "", author: "Colin King", imgName: "fairytale8")
    ]
    
    var fantasy = [
        Book(name: "Geronimo Stilton and the Kingdom of Fantasy", desciprtion: "Join Geronimo for his biggest, most fabumouse adventure yet! Dragons, mermaids, and much, much more await readers in this very special edition! ", note: "", author: "Geronimo Stilton", imgName: "fantasy1"),
        Book(name: "Final Fantasy Xv: The Dawn Of The Future", desciprtion: "A volume of all-new, character-driven stories expanding on the world of the hit video game Final Fantasy XV.", note: "", author: "Stephen Kohler", imgName: "fantasy2"),
        Book(name: "Fantasy Lover", desciprtion: "Dear Reader, Being trapped in a bedroom with a woman is a grand thing. Being trapped in hundreds of bedrooms over two thousand years isn't. ", note: "", author: "Sherrilyn Kenyon", imgName: "fantasy3"),
        Book(name: "Fantasy in Death", desciprtion: "Of course gaming, like any business, has its fierce rivalries and dirty tricks--as Eve's husband, Roarke, one of U-Play's competitors, knows well. But Minnock was not naive, and he knew how to fight back in the real world as well as the virtual one.", note: "", author: "J D Robb", imgName: "fantasy4"),
        Book(name: "Lord of the Rings Lcg", desciprtion: "Hot on the trail of Gollum, the heroes venture down the banks of the Anduin, only to hear whispers of a new threat looming. Conflict contains 60 fixed cards from the Shadows of Mirkwood cycle, continuing the heroes' quest to find and apprehend Gollum.", note: "", author: "Fantasy Flight Games", imgName: "fantasy5"),
        Book(name: "How to Draw Fantasy Art and RPG Maps", desciprtion: "The power of creation is at your fingertips!", note: "", author: "Jared Blando", imgName: "fantasy6"),
        Book(name: "King of Scars", desciprtion: "The perfect gift for Leigh Bardugo fans, with a beautiful foiled cover. The much-anticipated first book in a brand-new duology by New York Times bestselling author, Leigh Bardugo.", note: "", author: "Leigh Bardugo", imgName: "fantasy7"),
        Book(name: "Grimgar of Fantasy and Ash", desciprtion: "Haruhiro awakens to darkness and amnesia, among a group of strangers who can only remember their own names...", note: "", author: "Ao Jyumonji", imgName: "fantasy8"),
        Book(name: "Star Wars: Armada", desciprtion: "Dont wait until its too late to intensify your firepower. The enemy fleet is approaching firing range, and squadrons of starfighters are racing into position.", note: "", author: "Fantasy Flight Games", imgName: "fantasy9")
    ]
    
    var children = [
        Book(name: "Miss Peregrine's Home For Peculiar Children", desciprtion: "A mysterious island. An abandoned orphanage. And a strange collection of very curious photographs.", note: "", author: "Ransom Riggs", imgName: "children1"),
        Book(name: "The World's Worst Children", desciprtion: "Are you ready to meet the World's Worst Children? Five beastly boys and five gruesome girls!", note: "", author: "Tony Ross", imgName: "children2"),
        Book(name: "Children of Blood and Bone", desciprtion: "Winner of the Tonight Show Summer Reads with Jimmy Fallon.", note: "", author: "Tomi Adeyemi", imgName: "children3"),
        Book(name: "The World's Worst Children 2", desciprtion: "The brilliant follow-up to David Walliams' bestseller The World's Worst Children! Ten more stories about a brand new gang of hilariously horrible kids from everyone's favourite children's author, illustrated in glorious full colour by Tony Ross.", note: "oirifrmkrf rkfmormfkmrl frmfmklrmlkfmrflr mfklrklfmrklmflkrmf kmflrmklmfkl rlkmlkfmrklm rlflkmwkomfmewf klemrfglmsrgmermglkmelfr ef", author: "Tony Ross", imgName: "children4"),
        Book(name: "Children of Time", desciprtion: "Winner of the 30th anniversary Arthur C. Clarke Award for Best Novel.", note: "", author: "Adrian Tchaikovsky", imgName: "children5")
    ]
    
    func getBooks(forGenre genre: String) -> [Book] {
        switch genre {
        case "fairytale":
            return fairytale
        case "math":
            return math
        case "fantasy":
            print("Fantasy")
            return fantasy  
        case "children's":
            return children
        default:
            return math
        }
    }
}

