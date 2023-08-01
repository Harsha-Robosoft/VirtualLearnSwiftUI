//
//  TestResultCalucator.swift
//  VertualLearnUIApp
//
//  Created by Harsha R Mundaragi  on 25/07/23.
//

import Foundation
import SwiftUI

class TestResultCalculator: ObservableObject{
    
    static let shared = TestResultCalculator()
    
    @ObservedObject var helper = HelperClass.shared
    
    var combinedPercentage = 0
    var collectPercentage: [Int] = []
    
    var sumOfallPercentage = 0
    
    var totalQuestions = 0
    var currectQuestion = 0
    var wrongAnswer = 0
    var percentage = 0
    
    
    var test: ModuleTest?
    var indextapped: Int?
    var collectionIndex: Int?
    
    
    func calculateTotalPercentage(completion: @escaping(Bool) -> ()){
        totalQuestions = test?.testDetsails.count ?? 0
        
        percentage = 0
        currectQuestion = 0
        wrongAnswer = 0
        sumOfallPercentage = 0
        
        
        if test?.testDetsails != nil{
            for testDetail in (test?.testDetsails)!{
                if testDetail.answer == testDetail.correctAnswer{
                    currectQuestion += 1
                }else if !testDetail.questionAttempted{
                    wrongAnswer += 1
                }else{
                    wrongAnswer += 1
                }
            }
            
            
            percentage = Int((Double(currectQuestion) / Double(totalQuestions)) * 100)
            collectPercentage.append(percentage)
            for i in 0...collectPercentage.count - 1{
                sumOfallPercentage += collectPercentage[i]
            }
            combinedPercentage = Int(Double(sumOfallPercentage) / Double(collectPercentage.count) )
            helper.homeChoiceYourCourseCollectionViewdata[collectionIndex ?? 0].chaptersList[indextapped ?? 0].testIs?.testResult.wrongAnswer = String(wrongAnswer)
            helper.homeChoiceYourCourseCollectionViewdata[collectionIndex ?? 0].chaptersList[indextapped ?? 0].testIs?.testResult.correctAnswer = String(currectQuestion)
            helper.homeChoiceYourCourseCollectionViewdata[collectionIndex ?? 0].chaptersList[indextapped ?? 0].testIs?.testResult.passgrad = String(percentage)
            helper.homeChoiceYourCourseCollectionViewdata[collectionIndex ?? 0].chaptersList[indextapped ?? 0].combinedPercentage = combinedPercentage
            completion(true)
        }
        completion(false)
    }
}
