//
//  QuizViewController.swift
//  QuizApp
//
//

import UIKit

class QuizViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var gameModels = [Question]()
    
    var currentQuestion: Question?
    
    @IBOutlet var label: UILabel!
    @IBOutlet var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
       setupQuestions()
        configureUI(question: gameModels.first!)
    }
    
    
    
    private func configureUI(question:Question){
        label.text = question.text
        currentQuestion = question
        table.reloadData()
        
    }
    
    private func checkAnswer(answer: Answer, question: Question) -> Bool {
   return question.answers.contains(where: { $0.text == answer.text}) && answer.correct
    
    }
    private func setupQuestions(){
        gameModels.append(Question(text: "3+3", answers: [
        Answer(text: "1", correct: false),
        Answer(text: "6", correct: true),
        Answer(text: "12", correct: false),
        Answer(text: "-3", correct: false)
        ]))
        
        gameModels.append(Question(text: "3*7", answers: [
        Answer(text: "10", correct: false),
        Answer(text: "18", correct: false),
        Answer(text: "21", correct: true),
        Answer(text: "15", correct: false)
        ]))
        
        gameModels.append(Question(text: "81/9", answers: [
        Answer(text: "47", correct: false),
        Answer(text: "8", correct: false),
        Answer(text: "72", correct: false),
        Answer(text: "9", correct: true)
        ]))
        
        gameModels.append(Question(text: "1*0", answers: [
        Answer(text: "0", correct: true),
        Answer(text: "1", correct: false),
        Answer(text: "10", correct: false),
        Answer(text: "-1", correct: false)
        ]))
        
        gameModels.append(Question(text: "67+21", answers: [
        Answer(text: "100", correct: false),
        Answer(text: "69", correct: false),
        Answer(text: "88", correct: true),
        Answer(text: "46", correct: false)
        ]))
        
        gameModels.append(Question(text: "47-27", answers: [
        Answer(text: "98", correct: false),
        Answer(text: "20", correct: true),
        Answer(text: "26", correct: false),
        Answer(text: "76", correct: false)
        ]))
        
        gameModels.append(Question(text: "9-79", answers: [
        Answer(text: "1", correct: false),
        Answer(text: "69", correct: false),
        Answer(text: "70", correct: false),
        Answer(text: "-70", correct: true)
        ]))
        
        gameModels.append(Question(text: "21/7", answers: [
        Answer(text: "14", correct: false),
        Answer(text: "34", correct: false),
        Answer(text: "3", correct: true),
        Answer(text: "4", correct: false)
        ]))
        
        gameModels.append(Question(text: "66/11", answers: [
        Answer(text: "6", correct: true),
        Answer(text: "12", correct: false),
        Answer(text: "5", correct: false),
        Answer(text: "7", correct: false)
        ]))
        
        gameModels.append(Question(text: "8*6", answers: [
        Answer(text: "65", correct: false),
        Answer(text: "48", correct: true),
        Answer(text: "60", correct: false),
        Answer(text: "14", correct: false)
        ]))
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentQuestion?.answers.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = currentQuestion?.answers[indexPath.row].text
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let question = currentQuestion else {
            return
        }
        
        let answer = question.answers[indexPath.row]
        
        if checkAnswer(answer: answer, question: question){
            
            if let index = gameModels.firstIndex(where: {$0.text == question.text}){
                if index < (gameModels.count - 1){
                    let nextQuestion = gameModels[index+1]
                    print("\(nextQuestion.text)")
                    currentQuestion = nil
                    configureUI(question: nextQuestion)
                  
                    
                }
                else {
                    let alert = UIAlertController(title: "Done", message: "Great!", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
                    present(alert, animated: true)
                    
                }
            }
    }
    
    else {
        let alert = UIAlertController(title: "Wrong", message: "Not right", preferredStyle: .alert)
   
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
}

struct Question {
    let text:String
    let answers: [Answer]
}

struct Answer {
    let text: String
    let correct: Bool
    
}
}
