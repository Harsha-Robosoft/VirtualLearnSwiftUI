//
//  Constants.swift
//  VertualLearnUIApp
//
//  Created by Harsha R Mundaragi  on 05/07/23.
//

import SwiftUI

//MARK: - Onboarding data

let onboardingData = [
    Onboarding(id: UUID(), imageName: "img_onboarding_illustration1 1", title: "Learner\nEngagement", subTitle: "Interactive features mirror the traditional classroom experience and learners receive feedback to increase long-term retention, tripling learning efficacy over standard video.", tag: 1),
    Onboarding(id: UUID(), imageName: "img_onboarding_illustration2 1", title: "Accountable\nTracking", subTitle: "Receive immediate, accessible data (both performance and behavior-based) to effectively remediate concepts, automatically assign grades, and address deficiencies.", tag: 2),
    Onboarding(id: UUID(), imageName: "img_onboarding_illustration3 1", title: "Seamless\nWorkflow", subTitle: "Sync rosters, create and assign impactful video experiences, enrich your flipped classroom, and streamline tedious grading.", tag: 3)
]

//MARK: - Home data

let collectionItem = [
CollectionViewItem(id: UUID(), image: "icn_categories_design", item: "Design"),
CollectionViewItem(id: UUID(), image: "icn_categories_developer", item: "Development"),
CollectionViewItem(id: UUID(), image: "icn_categories_business", item: "Business"),
CollectionViewItem(id: UUID(), image: "icn_categories_marketing", item: "Marketing"),
CollectionViewItem(id: UUID(), image: "icn_categories_photography", item: "Photography"),
CollectionViewItem(id: UUID(), image: "icn_categories_finance", item: "Finance"),
CollectionViewItem(id: UUID(), image: "icn_categories_IT", item: "IT & Softwarw"),
CollectionViewItem(id: UUID(), image: "icn_categories_lifestyle", item: "Lifestyle"),
CollectionViewItem(id: UUID(), image: "icn_categories_music", item: "Music"),
CollectionViewItem(id: UUID(), image: "icn_categories_teaching", item: "Teaching"),
CollectionViewItem(id: UUID(), image: "icn_categories_fitness", item: "Health & Fitness"),
]


//let homeChoiceYourCourseCollectionViewdata = [
//    HomeChoiceYourCourseCollectionViewdata(id: UUID(), image: "img_course1_bg", title: "Learn Figma - UI/UX Design Essential Training", chapters: "7 Chapters", chapterDetails: "7 Chapters | 46 Lessons", type: "Design", chaptersList: <#[ChaptersList]#>),
//    HomeChoiceYourCourseCollectionViewdata(id: UUID(), image: "img_course2_bg", title: "Digital Marketing for 2021 Masterclass", chapters: "14 Chapters", chapterDetails: "14 Chapters | 20 Lessons", type: "Marketing", chaptersList: <#[ChaptersList]#>),
//    HomeChoiceYourCourseCollectionViewdata(id: UUID(), image: "img_course1_bg", title: "Learn Figma - UI/UX Design Essential Training", chapters: "7 Chapters", chapterDetails: "4 Chapters | 24 Lessons", type: "Design", chaptersList: <#[ChaptersList]#>),
//    HomeChoiceYourCourseCollectionViewdata(id: UUID(), image: "img_course2_bg", title: "Digital Marketing for 2021 Masterclass", chapters: "14 Chapters", chapterDetails: "18 Chapters | 33 Lessons", type: "Marketing", chaptersList: <#[ChaptersList]#>)
//]

let topBusinessCourse = [
TopCourseInBusiness(id: UUID(), image: "img_course1_business", headLine: "The Complete Communication Skill", chapters: "5 Chapter", hours: "1:30:20"),
TopCourseInBusiness(id: UUID(), image: "img_course1_business", headLine: "The Complete Communication Skill", chapters: "7 Chapter", hours: "1:10:10")
]

//MARK: - Search data

let topSearch = ["python","IoS", "Swift", "Java", "Javascript", "Leadeship","React","Php"]
let searchResult = [
    SearchResult(id: UUID(), image: "img_serach result1", title: "User Interface Design Essentials - UI/UX Design", chapters: "30 Chapters", type: "Design"),
    SearchResult(id: UUID(), image: "img_serach result1", title: "User Experience Design Fundamentals", chapters: "10 Chapters", type: "Design")
]
let searchFilterDuration = ["5/10 Chapters","10/20 Chapters","20/30 Chapters","30/40 Chapters","50+ Chapters"]

//MARK: - Other Screen data
let allCource = [
SearchResult(id: UUID(), image: "img_course_all course1", title: "Adobe Illustrator CC - Essential Training Course", chapters: "30 Chapters", type: "Design"),
SearchResult(id: UUID(), image: "img_course_all course2", title: "Leadership: Practical Leadership Skills", chapters: "10 Chapters", type: "Design"),
SearchResult(id: UUID(), image: "img_course_all course3", title: "2021 Complete Python Bootcamp From Zero to Hero", chapters: "20 Chapters", type: "Design"),
SearchResult(id: UUID(), image: "img_course_all course4", title: "The Ultimate Drawing Course - Beginner to Advanced", chapters: "10 Chapters", type: "Design"),
SearchResult(id: UUID(), image: "img_course_all course5", title: "[New] Ultimate AWS Certified Cloud Practitioner - 2021", chapters: "20 Chapters", type: "Design")
]

//MARK: - My Ongoing Course

let myCourseOngoing = [
MyOngoingCourse(id: UUID(), status: "Ongoing", image: "img_mycourse_ongoing1", title: "Art & Illustration", chapters_approverate: "15/20 CHapters", buttonTitle: "Continue"),
MyOngoingCourse(id: UUID(), status: "Ongoing", image: "img_mycourse_ongoing2", title: "User Interface", chapters_approverate: "7/8 Chapters", buttonTitle: "Continue"),
MyOngoingCourse(id: UUID(), status: "Ongoing", image: "img_mycourse_ongoing1", title: "Learn Figma - UI/UX Design Essential", chapters_approverate: "2/8 CHapters", buttonTitle: "Continue")
]

//MARK: - My Completed Course

let myCourseCompleted = [
MyOngoingCourse(id: UUID(), status: "Completed", image: "img_mycourse_completed1", title: "User Interface with Illustration", chapters_approverate: "100% Approval Rate", buttonTitle: "View certificate"),
MyOngoingCourse(id: UUID(), status: "Completed", image: "img_mycourse_completed2", title: "Poster Design Tutorial", chapters_approverate: "80% Approval Rate", buttonTitle: "View certificate"),
MyOngoingCourse(id: UUID(), status: "Completed", image: "img_mycourse_completed3", title: "Graphic Design Part-1", chapters_approverate: "70% Approval Rate", buttonTitle: "View certificate"),
MyOngoingCourse(id: UUID(), status: "Completed", image: "img_mycourse_completed1", title: "User Interface with Illustration", chapters_approverate: "90% Approval Rate", buttonTitle: "View certificate")
]

//MARK: - Course details

let originalText = "Figma is a very powerful application that runs online. There are virtually no platform boundaries when it comes to using Figma because you can design within a web browser or using their desktop application made for Windows and Macs. Figma is similar to Sketch and Adobe XD but is the more powerful of the three when it comes to"

let originalText2 = "Back in 2020, I started brainspin with a desire to design compelling and engaging apps. For over 7 years, I have designed many high"

//MARK: - Item Details

let coursetoStart = [
CourseToStart_FeaturedCourse(id: UUID(), image: "img_course1_design", headLine: "Complete Blender Creator: Learn 3D Modelling for Beginners", chapters: "15 Chapter", hours: "1:30:20"),
CourseToStart_FeaturedCourse(id: UUID(), image: "img_course3_design", headLine: "Interior Decorating: An A-Z System for your home.", chapters: "10 Chapter", hours: "1:00:00")
]

let featuredCourse = [
CourseToStart_FeaturedCourse(id: UUID(), image: "img_course3_design", headLine: "Interior Decorating: An A-Z System for your home.", chapters: "10 Chapter", hours: "1:00:00"),
CourseToStart_FeaturedCourse(id: UUID(), image: "img_course1_design", headLine: "Complete Blender Creator: Learn 3D Modelling for Beginners", chapters: "15 Chapter", hours: "1:30:20"),
CourseToStart_FeaturedCourse(id: UUID(), image: "img_course3_design", headLine: "Interior Decorating: An A-Z System for your home.", chapters: "10 Chapter", hours: "1:00:00")
]

let subcategories = ["Graphic Design","UI Design","Product design","UI/UX design","Interior Design","Motion Design","2D Design","Web Design","3D Design","VFX"]

let allCourse = [
AllCourse(id: UUID(), image: "img_course_all course1", title: "Adobe Illustrator CC - Essential Training Course", chapters: "30 Chapters", type: "Design"),
AllCourse(id: UUID(), image: "img_course1_bg", title: "Learn Figma - UI/UX Design Essential Training", chapters: "10 Chapters", type: "Design"),
AllCourse(id: UUID(), image: "img_search result2", title: "Web Design for Beginners: Real world coding in HTML & CSS", chapters: "15 Chapters", type: "Design"),
AllCourse(id: UUID(), image: "img_course_all course4", title: "The Ultimate Drawing Course - Beginner to Advanced", chapters: "20 Chapters", type: "Design")
]

//MARK: - Video list

let videosList = ["cheetah","elephant","giraffe","gorilla","hippo","lion","lioness","ostrich","rhino","zebra"]

let darkBlue = UIColor(red: 0, green: 0, blue: 0.8, alpha: 1)

extension UIScreen{
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
    static let screenSize = UIScreen.main.bounds.size
}
