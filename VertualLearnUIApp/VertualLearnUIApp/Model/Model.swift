//
//  OnboardingModel.swift
//  VertualLearnUIApp
//
//  Created by Harsha R Mundaragi  on 05/07/23.
//

import Foundation

struct Onboarding{
    let id: UUID
    let imageName: String
    let title: String
    let subTitle: String
    let tag: Int
}

struct SearchResult{
    let id: UUID
    let image: String
    let title: String
    let chapters: String
    let type: String
}

struct MyOngoingCourse{
    let id: UUID
    let status: String
    let image: String
    let title: String
    let chapters_approverate: String
    let buttonTitle: String
}

struct HomeChoiceYourCourseCollectionViewdata : Identifiable{
    let id: UUID
    let courseCountNum: Int
    let image: String
    let title: String
    let chapters: String
    let chapterDetails: String
    let type: String
    var chaptersList: [ChaptersList]
    var tappedIndex: Int
    var courseCompleted: Bool
}

struct CollectionViewItem{
    let id: UUID
    let image: String
    let item: String
}

struct ChaptersList: Identifiable{
    let id: UUID
    let chapterName: String
    let courseName: String
    var chapterContent: [ChapterContent]
    var testIs: ModuleTest?
    var chapCompleted: Bool
    var combinedPercentage: Int?
}

struct ChapterContent: Identifiable{
    let id: UUID
    let number: String
    let title: String
    let duration: String
    var completed: Bool
    var start: Bool
}

struct ModuleTest: Identifiable{
    let id: UUID
    let image: String
    let module: String
    let chapter: String
    let subTitle: String
    let title: String
    let duration: String
    var testCompleted: Bool
    var startTest: Bool
    var testDetsails: [TestDetsails]
    var testResult: TestResult
}

struct TestDetsails: Identifiable{
    let id: UUID
    let questionNum: Int
    let question: String
    let option01: String
    let option02: String
    let option03: String
    let option04: String
    let correctAnswer: String
    var answer: String?
    var tappedoption: String
    var questionAttempted: Bool
}

struct TestResult: Identifiable{
    let id: UUID
    var passgrad: String
    var correctAnswer: String
    var wrongAnswer: String
}

struct TopCourseInBusiness{
    let id: UUID
    let image: String
    let headLine: String
    let chapters: String
    let hours: String
}

struct CourseToStart_FeaturedCourse{
    let id: UUID
    let image: String
    let headLine: String
    let chapters: String
    let hours: String
}

struct AllCourse{
    let id: UUID
    let image: String
    let title: String
    let chapters: String
    let type: String
}
