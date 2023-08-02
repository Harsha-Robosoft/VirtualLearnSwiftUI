//
//  HelperClass.swift
//  VertualLearnUIApp
//
//  Created by Harsha R Mundaragi  on 20/07/23.
//

import Foundation

class HelperClass: ObservableObject{
    static let shared = HelperClass()
    
    @Published var homeChoiceYourCourseCollectionViewdata = [
        HomeChoiceYourCourseCollectionViewdata(
            id: UUID(),
            courseCountNum: 0,
            image: "img_course1_bg",
            title: "Learn Figma - UI/UX Design Essential Training",
            chapters: "7 Chapters",
            chapterDetails: "7 Chapters | 46 Lessons",
            type: "Design",
            chaptersList: [
                
                ChaptersList(
                    id: UUID(),
                    chapterName: "Chapter 1 - Introduction to the course", courseName: "Learn Figma - UI/UX Design Essential Training",
                    chapterContent: [
                        ChapterContent(id: UUID(), number: "01", title: "Introduction", duration: "0.34 mins", completed: false, start: true),
                        ChapterContent(id: UUID(), number: "02", title: "Using the Exercise Files", duration: "01.06 mins", completed: false, start: false)
                    ],
                    chapCompleted: false
                ),
                ChaptersList(
                    id: UUID(),
                    chapterName: "Chapter 2 - Learning the Figma Interface", courseName: "Learn Figma - UI/UX Design Essential Training",
                    chapterContent: [
                        ChapterContent(id: UUID(), number: "01", title: "Nange en gottu", duration: "17.04 hour", completed: false, start: false),
                        ChapterContent(id: UUID(), number: "02", title: "Ninge en gottu", duration: "5.30 hour", completed: false, start: false),
                        ChapterContent(id: UUID(), number: "03", title: "Yarige en gottu", duration: "1.23 hour", completed: false, start: false),
                        ChapterContent(id: UUID(), number: "04", title: "Yarigu enu gottilla", duration: "1 mins", completed: false, start: false)
                    ],
                    chapCompleted: false
                ),
                ChaptersList(
                    id: UUID(), chapterName:
                        "Chapter 3 - Setting up a new project", courseName: "Learn Figma - UI/UX Design Essential Training",
                    chapterContent: [
                        ChapterContent(id: UUID(), number: "01", title: "Allenu aarama", duration: "5 hour", completed: false, start: false),
                        ChapterContent(id: UUID(), number: "02", title: "Naav illi aaramu", duration: "40 mins", completed: false, start: false),
                        ChapterContent(id: UUID(), number: "03", title: "Naavella irode hinge", duration: "6 mins", completed: false, start: false)
                    ],
                    testIs: ModuleTest(
                        id: UUID(),
                        image: "icn_moduletest",
                        module: "Module Test 01",
                        chapter: "Chapter 3",
                        subTitle: "Setting up a new project",
                        title: "Module Test - 01",
                        duration: "10 Mins | 25 Questions",
                        testCompleted: false,
                        startTest: false,
                        testDetsails: [
                            TestDetsails(
                                id: UUID(),
                                questionNum: 1,
                                question: "What is 2 x 1 = ?",
                                option01: "1",
                                option02: "2",
                                option03: "3",
                                option04: "4",
                                correctAnswer: "2",
                                answer: nil,
                                tappedoption: "",
                                questionAttempted: false
                            ),
                            TestDetsails(
                                id: UUID(),
                                questionNum: 2,
                                question: "What is 2 x 2 = ?",
                                option01: "1",
                                option02: "2",
                                option03: "3",
                                option04: "4",
                                correctAnswer: "4",
                                answer: nil,
                                tappedoption: "",
                                questionAttempted: false
                            ),
                            TestDetsails(
                                id: UUID(),
                                questionNum: 3,
                                question: "What is 2 x 3 = ?",
                                option01: "6",
                                option02: "2",
                                option03: "3",
                                option04: "4",
                                correctAnswer: "6",
                                answer: nil,
                                tappedoption: "",
                                questionAttempted: false
                            )
                        ], testResult: TestResult(id: UUID(), passgrad: "00", correctAnswer: "0", wrongAnswer: "0")
                    ),
                    chapCompleted: false,
                    combinedPercentage: 0
                ),
                ChaptersList(
                    id: UUID(),
                    chapterName: "Chapter 4 - Adding and Editing Content", courseName: "Learn Figma - UI/UX Design Essential Training",
                    chapterContent: [
                        ChapterContent(id: UUID(), number: "01", title: "Adella ninge yake", duration: "8 mins", completed: false, start: false),
                        ChapterContent(id: UUID(), number: "02", title: "Adella nang yake", duration: "12 hour", completed: false, start: false)
                    ],
                    chapCompleted: false
                ),
                ChaptersList(
                    id: UUID(),
                    chapterName: "Chapter 5 - Completing the Design", courseName: "Learn Figma - UI/UX Design Essential Training",
                    chapterContent: [
                        ChapterContent(id: UUID(), number: "01", title: "Ninge yak beku adella", duration: "5 hour", completed: false, start: false)
                    ],
                    chapCompleted: false
                ),
                ChaptersList(
                    id: UUID(),
                    chapterName: "Chapter 6 - Prototyping, Sharing and Exporting", courseName: "Learn Figma - UI/UX Design Essential Training",
                    chapterContent: [
                        ChapterContent(id: UUID(), number: "01", title: "Enu maadodu", duration: "9 hour", completed: false, start: false),
                        ChapterContent(id: UUID(), number: "02", title: "Onti hoovondu", duration: "3 mins", completed: false, start: false),
                        ChapterContent(id: UUID(), number: "03", title: "Road alli siktu", duration: "34 mins", completed: false, start: false),
                        ChapterContent(id: UUID(), number: "04", title: "Enu helodu", duration: "54 mins", completed: false, start: false),
                        ChapterContent(id: UUID(), number: "05", title: "Inta time alli", duration: "1.23 hour", completed: false, start: false),
                        ChapterContent(id: UUID(), number: "06", title: "yavanig goyyu", duration: "33 mins", completed: false, start: false)
                    ],
                    chapCompleted: false
                ),
                ChaptersList(
                    id: UUID(),
                    chapterName: "Chapter 7 - Conclusion", courseName: "Learn Figma - UI/UX Design Essential Training",
                    chapterContent: [
                        ChapterContent(id: UUID(), number: "01", title: "Nim paadakke ondu namaskaara", duration: "99 hours", completed: false, start: false)
                    ],
                    testIs: ModuleTest(
                        id: UUID(),
                        image: "icn_moduletest",
                        module: "Final Test",
                        chapter: "Chapter 7",
                        subTitle: "Conclusion",
                        title: "Final Test",
                        duration: "30 Mins | 20 Questions",
                        testCompleted: false,
                        startTest: false,
                        testDetsails: [
                            TestDetsails(
                                id: UUID(),
                                questionNum:1,
                                question: "What is 3 x 1 = ?",
                                option01: "1",
                                option02: "2",
                                option03: "3",
                                option04: "4",
                                correctAnswer: "3",
                                answer: nil,
                                tappedoption: "",
                                questionAttempted: false
                            ),
                            TestDetsails(
                                id: UUID(),
                                questionNum:1,
                                question: "What is 3 x 2 = ?",
                                option01: "6",
                                option02: "2",
                                option03: "3",
                                option04: "4",
                                correctAnswer: "6",
                                answer: nil,
                                tappedoption: "",
                                questionAttempted: false
                            ),
                            TestDetsails(
                                id: UUID(),
                                questionNum:1,
                                question: "What is 3 x 3 = ?",
                                option01: "1",
                                option02: "2",
                                option03: "9",
                                option04: "4",
                                correctAnswer: "9",
                                answer: nil,
                                tappedoption: "",
                                questionAttempted: false
                            )
                        ], testResult: TestResult(id: UUID(), passgrad: "00", correctAnswer: "0", wrongAnswer: "0")
                    ),
                    chapCompleted: false,
                    combinedPercentage: 0
                )
            ],
            tappedIndex: 11,
            courseCompleted: false),
        
        HomeChoiceYourCourseCollectionViewdata(
            id: UUID(),
            courseCountNum: 1,
            image: "img_course2_bg",
            title: "Digital Marketing for 2021 Masterclass",
            chapters: "14 Chapters",
            chapterDetails: "14 Chapters | 20 Lessons",
            type: "Marketing",
            chaptersList: [
                
                ChaptersList(
                    id: UUID(),
                    chapterName: "Chapter 1 - Introduction to the course", courseName: "Learn Figma - UI/UX Design Essential Training",
                    chapterContent: [
                        ChapterContent(id: UUID(), number: "01", title: "Introduction", duration: "0.34 mins", completed: false, start: true),
                        ChapterContent(id: UUID(), number: "02", title: "Using the Exercise Files", duration: "01.06 mins", completed: false, start: false)
                    ],
                    chapCompleted: false
                ),
                ChaptersList(
                    id: UUID(),
                    chapterName: "Chapter 2 - Learning the Figma Interface", courseName: "Learn Figma - UI/UX Design Essential Training",
                    chapterContent: [
                        ChapterContent(id: UUID(), number: "01", title: "Nange en gottu", duration: "17.04 hour", completed: false, start: false),
                        ChapterContent(id: UUID(), number: "02", title: "Ninge en gottu", duration: "5.30 hour", completed: false, start: false)
                    ],
                    testIs: ModuleTest(
                        id: UUID(),
                        image: "icn_moduletest",
                        module: "Module Test 01",
                        chapter: "Chapter 2",
                        subTitle: "Learning the Figma Interface",
                        title: "Module Test - 01",
                        duration: "10 Mins | 25 Questions",
                        testCompleted: false,
                        startTest: false,
                        testDetsails: [
                            TestDetsails(
                                id: UUID(),
                                questionNum: 1,
                                question: "What is 2 x 1 = ?",
                                option01: "1",
                                option02: "2",
                                option03: "3",
                                option04: "4",
                                correctAnswer: "2",
                                answer: nil,
                                tappedoption: "",
                                questionAttempted: false
                            ),
                            TestDetsails(
                                id: UUID(),
                                questionNum: 2,
                                question: "What is 2 x 2 = ?",
                                option01: "1",
                                option02: "2",
                                option03: "3",
                                option04: "4",
                                correctAnswer: "4",
                                answer: nil,
                                tappedoption: "",
                                questionAttempted: false
                            ),
                            TestDetsails(
                                id: UUID(),
                                questionNum: 3,
                                question: "What is 2 x 3 = ?",
                                option01: "6",
                                option02: "2",
                                option03: "3",
                                option04: "4",
                                correctAnswer: "6",
                                answer: nil,
                                tappedoption: "",
                                questionAttempted: false
                            )
                        ], testResult: TestResult(id: UUID(), passgrad: "00", correctAnswer: "0", wrongAnswer: "0")
                    ),
                    chapCompleted: false
                    , combinedPercentage: 0
                ),
                ChaptersList(
                    id: UUID(), chapterName:
                        "Chapter 3 - Setting up a new project", courseName: "Learn Figma - UI/UX Design Essential Training",
                    chapterContent: [
                        ChapterContent(id: UUID(), number: "01", title: "Allenu aarama", duration: "5 hour", completed: false, start: false),
                        ChapterContent(id: UUID(), number: "02", title: "Naav illi aaramu", duration: "40 mins", completed: false, start: false)
                    ],
                    chapCompleted: false
                ),
                ChaptersList(
                    id: UUID(),
                    chapterName: "Chapter 4 - Adding and Editing Content", courseName: "Learn Figma - UI/UX Design Essential Training",
                    chapterContent: [
                        ChapterContent(id: UUID(), number: "01", title: "Adella ninge yake", duration: "8 mins", completed: false, start: false),
                        ChapterContent(id: UUID(), number: "02", title: "Adella nang yake", duration: "12 hour", completed: false, start: false)
                    ],
                    chapCompleted: false
                ),
                ChaptersList(
                    id: UUID(),
                    chapterName: "Chapter 5 - Completing the Design", courseName: "Learn Figma - UI/UX Design Essential Training",
                    chapterContent: [
                        ChapterContent(id: UUID(), number: "01", title: "Ninge yak beku adella", duration: "5 hour", completed: false, start: false),
                        ChapterContent(id: UUID(), number: "02", title: "nange beku ella", duration: "1 hour", completed: false, start: false)
                    ],
                    chapCompleted: false
                ),
                ChaptersList(
                    id: UUID(),
                    chapterName: "Chapter 6 - Prototyping, Sharing and Exporting", courseName: "Learn Figma - UI/UX Design Essential Training",
                    chapterContent: [
                        ChapterContent(id: UUID(), number: "01", title: "Enu maadodu", duration: "9 hour", completed: false, start: false),
                        ChapterContent(id: UUID(), number: "02", title: "Onti hoovondu", duration: "3 mins", completed: false, start: false)
                    ],
                    chapCompleted: false
                ),
                ChaptersList(
                    id: UUID(),
                    chapterName: "Chapter 7 - Conclusion", courseName: "Learn Figma - UI/UX Design Essential Training",
                    chapterContent: [
                        ChapterContent(id: UUID(), number: "01", title: "Nim paadakke ondu namaskaara", duration: "99 hours", completed: false, start: false)
                    ],
                    testIs: ModuleTest(
                        id: UUID(),
                        image: "icn_moduletest",
                        module: "Final Test",
                        chapter: "Chapter 7",
                        subTitle: "Conclusion",
                        title: "Final Test",
                        duration: "30 Mins | 20 Questions",
                        testCompleted: false,
                        startTest: false,
                        testDetsails: [
                            TestDetsails(
                                id: UUID(),
                                questionNum:1,
                                question: "What is 3 x 1 = ?",
                                option01: "1",
                                option02: "2",
                                option03: "3",
                                option04: "4",
                                correctAnswer: "3",
                                answer: nil,
                                tappedoption: "",
                                questionAttempted: false
                            ),
                            TestDetsails(
                                id: UUID(),
                                questionNum:1,
                                question: "What is 3 x 2 = ?",
                                option01: "6",
                                option02: "2",
                                option03: "3",
                                option04: "4",
                                correctAnswer: "6",
                                answer: nil,
                                tappedoption: "",
                                questionAttempted: false
                            ),
                            TestDetsails(
                                id: UUID(),
                                questionNum:1,
                                question: "What is 3 x 3 = ?",
                                option01: "1",
                                option02: "2",
                                option03: "9",
                                option04: "4",
                                correctAnswer: "9",
                                answer: nil,
                                tappedoption: "",
                                questionAttempted: false
                            )
                        ], testResult: TestResult(id: UUID(), passgrad: "00", correctAnswer: "0", wrongAnswer: "0")
                    ),
                    chapCompleted: false,
                    combinedPercentage: 0
                )
            ],
            tappedIndex: 11,
            courseCompleted: false),
        
        HomeChoiceYourCourseCollectionViewdata(
            id: UUID(),
            courseCountNum: 2,
            image: "img_course1_bg",
            title: "Learn Figma - UI/UX Design Essential Training testing 01",
            chapters: "7 Chapters",
            chapterDetails: "4 Chapters | 24 Lessons",
            type: "Design",
            chaptersList: [
                
                ChaptersList(
                    id: UUID(),
                    chapterName: "Chapter 1 - Introduction to the course", courseName: "Learn Figma - UI/UX Design Essential Training",
                    chapterContent: [
                        ChapterContent(id: UUID(), number: "01", title: "Introduction", duration: "0.34 mins", completed: false, start: true)
                    ],
                    chapCompleted: false
                ),
                ChaptersList(
                    id: UUID(),
                    chapterName: "Chapter 2 - Learning the Figma Interface", courseName: "Learn Figma - UI/UX Design Essential Training",
                    chapterContent: [
                        ChapterContent(id: UUID(), number: "01", title: "Nange en gottu", duration: "17.04 hour", completed: false, start: false)
                    ],
                    chapCompleted: false
                ),
                ChaptersList(
                    id: UUID(), chapterName:
                        "Chapter 3 - Setting up a new project", courseName: "Learn Figma - UI/UX Design Essential Training",
                    chapterContent: [
                        ChapterContent(id: UUID(), number: "01", title: "Allenu aarama", duration: "5 hour", completed: false, start: false)
                    ],
                    chapCompleted: false
                ),
                ChaptersList(
                    id: UUID(),
                    chapterName: "Chapter 4 - Adding and Editing Content", courseName: "Learn Figma - UI/UX Design Essential Training",
                    chapterContent: [
                        ChapterContent(id: UUID(), number: "01", title: "Adella ninge yake", duration: "8 mins", completed: false, start: false)
                    ],
                    chapCompleted: false
                ),
                ChaptersList(
                    id: UUID(),
                    chapterName: "Chapter 5 - Completing the Design", courseName: "Learn Figma - UI/UX Design Essential Training",
                    chapterContent: [
                        ChapterContent(id: UUID(), number: "01", title: "Ninge yak beku adella", duration: "5 hour", completed: false, start: false)
                    ],
                    chapCompleted: false
                ),
                ChaptersList(
                    id: UUID(),
                    chapterName: "Chapter 6 - Prototyping, Sharing and Exporting", courseName: "Learn Figma - UI/UX Design Essential Training",
                    chapterContent: [
                        ChapterContent(id: UUID(), number: "01", title: "Enu maadodu", duration: "9 hour", completed: false, start: false)
                    ],
                    testIs: ModuleTest(
                        id: UUID(),
                        image: "icn_moduletest",
                        module: "Module Test 01",
                        chapter: "Chapter 6",
                        subTitle: "Prototyping, Sharing and Exporting",
                        title: "Module Test 01",
                        duration: "30 Mins | 20 Questions",
                        testCompleted: false,
                        startTest: false,
                        testDetsails: [
                            TestDetsails(
                                id: UUID(),
                                questionNum:1,
                                question: "What is 3 x 1 = ?",
                                option01: "1",
                                option02: "2",
                                option03: "3",
                                option04: "4",
                                correctAnswer: "3",
                                answer: nil,
                                tappedoption: "",
                                questionAttempted: false
                            ),
                            TestDetsails(
                                id: UUID(),
                                questionNum:1,
                                question: "What is 3 x 2 = ?",
                                option01: "6",
                                option02: "2",
                                option03: "3",
                                option04: "4",
                                correctAnswer: "6",
                                answer: nil,
                                tappedoption: "",
                                questionAttempted: false
                            ),
                            TestDetsails(
                                id: UUID(),
                                questionNum:1,
                                question: "What is 3 x 3 = ?",
                                option01: "1",
                                option02: "2",
                                option03: "9",
                                option04: "4",
                                correctAnswer: "9",
                                answer: nil,
                                tappedoption: "",
                                questionAttempted: false
                            )
                        ], testResult: TestResult(id: UUID(), passgrad: "00", correctAnswer: "0", wrongAnswer: "0")
                    ),
                    chapCompleted: false,
                    combinedPercentage: 0
                ),
                ChaptersList(
                    id: UUID(),
                    chapterName: "Chapter 7 - Conclusion", courseName: "Learn Figma - UI/UX Design Essential Training",
                    chapterContent: [
                        ChapterContent(id: UUID(), number: "01", title: "Nim paadakke ondu namaskaara", duration: "99 hours", completed: false, start: false)
                    ],
                    testIs: ModuleTest(
                        id: UUID(),
                        image: "icn_moduletest",
                        module: "Final Test",
                        chapter: "Chapter 7",
                        subTitle: "Conclusion",
                        title: "Final Test",
                        duration: "30 Mins | 20 Questions",
                        testCompleted: false,
                        startTest: false,
                        testDetsails: [
                            TestDetsails(
                                id: UUID(),
                                questionNum:1,
                                question: "What is 3 x 1 = ?",
                                option01: "1",
                                option02: "2",
                                option03: "3",
                                option04: "4",
                                correctAnswer: "3",
                                answer: nil,
                                tappedoption: "",
                                questionAttempted: false
                            ),
                            TestDetsails(
                                id: UUID(),
                                questionNum:1,
                                question: "What is 3 x 2 = ?",
                                option01: "6",
                                option02: "2",
                                option03: "3",
                                option04: "4",
                                correctAnswer: "6",
                                answer: nil,
                                tappedoption: "",
                                questionAttempted: false
                            ),
                            TestDetsails(
                                id: UUID(),
                                questionNum:1,
                                question: "What is 3 x 3 = ?",
                                option01: "1",
                                option02: "2",
                                option03: "9",
                                option04: "4",
                                correctAnswer: "9",
                                answer: nil,
                                tappedoption: "",
                                questionAttempted: false
                            )
                        ], testResult: TestResult(id: UUID(), passgrad: "00", correctAnswer: "0", wrongAnswer: "0")
                    ),
                    chapCompleted: false,
                    combinedPercentage: 0
                )
            ],
            tappedIndex: 11,
            courseCompleted: false),
        
        HomeChoiceYourCourseCollectionViewdata(
            id: UUID(),
            courseCountNum: 3,
            image: "img_course2_bg",
            title: "Digital Marketing for 2021 Masterclass testing 01",
            chapters: "14 Chapters",
            chapterDetails: "18 Chapters | 33 Lessons",
            type: "Marketing",
            chaptersList: [
                
                ChaptersList(
                    id: UUID(),
                    chapterName: "Chapter 1 - Introduction to the course", courseName: "Learn Figma - UI/UX Design Essential Training",
                    chapterContent: [
                        ChapterContent(id: UUID(), number: "01", title: "Introduction", duration: "0.34 mins", completed: false, start: true),
                        ChapterContent(id: UUID(), number: "02", title: "Using the Exercise Files", duration: "01.06 mins", completed: false, start: false)
                    ],
                    chapCompleted: false
                ),
                ChaptersList(
                    id: UUID(),
                    chapterName: "Chapter 2 - Learning the Figma Interface", courseName: "Learn Figma - UI/UX Design Essential Training",
                    chapterContent: [
                        ChapterContent(id: UUID(), number: "01", title: "Nange en gottu", duration: "17.04 hour", completed: false, start: false),
                        ChapterContent(id: UUID(), number: "02", title: "Ninge en gottu", duration: "5.30 hour", completed: false, start: false),
                        ChapterContent(id: UUID(), number: "03", title: "Yarige en gottu", duration: "1.23 hour", completed: false, start: false),
                        ChapterContent(id: UUID(), number: "04", title: "Yarigu enu gottilla", duration: "1 mins", completed: false, start: false)
                    ],
                    testIs: ModuleTest(
                        id: UUID(),
                        image: "icn_moduletest",
                        module: "Final Test",
                        chapter: "Chapter 2",
                        subTitle: "Learning the Figma Interface",
                        title: "Final Test",
                        duration: "30 Mins | 20 Questions",
                        testCompleted: false,
                        startTest: false,
                        testDetsails: [
                            TestDetsails(
                                id: UUID(),
                                questionNum:1,
                                question: "What is 3 x 1 = ?",
                                option01: "1",
                                option02: "2",
                                option03: "3",
                                option04: "4",
                                correctAnswer: "3",
                                answer: nil,
                                tappedoption: "",
                                questionAttempted: false
                            ),
                            TestDetsails(
                                id: UUID(),
                                questionNum:1,
                                question: "What is 3 x 2 = ?",
                                option01: "6",
                                option02: "2",
                                option03: "3",
                                option04: "4",
                                correctAnswer: "6",
                                answer: nil,
                                tappedoption: "",
                                questionAttempted: false
                            ),
                            TestDetsails(
                                id: UUID(),
                                questionNum:1,
                                question: "What is 3 x 3 = ?",
                                option01: "1",
                                option02: "2",
                                option03: "9",
                                option04: "4",
                                correctAnswer: "9",
                                answer: nil,
                                tappedoption: "",
                                questionAttempted: false
                            )
                        ], testResult: TestResult(id: UUID(), passgrad: "00", correctAnswer: "0", wrongAnswer: "0")
                    ),
                    chapCompleted: false,
                    combinedPercentage: 0
                )
            ],
            tappedIndex: 11,
            courseCompleted: false)
    ]
    
    
    
    
    @Published var completedCourseArray:[HomeChoiceYourCourseCollectionViewdata] = []
    @Published var ongoingCourse:[HomeChoiceYourCourseCollectionViewdata] = []
    
    @Published var ongoingCounter: [Int] = []
    @Published var completedVideos:[String] = []
    
    
    
//    @Published var chaptersList = [
//
//        ChaptersList(
//            id: UUID(),
//            chapterName: "Chapter 1 - Introduction to the course", courseName: "Learn Figma - UI/UX Design Essential Training",
//            chapterContent: [
//                ChapterContent(id: UUID(), number: "01", title: "Introduction", duration: "0.34 mins", completed: false, start: true),
//                ChapterContent(id: UUID(), number: "02", title: "Using the Exercise Files", duration: "01.06 mins", completed: false, start: false)
//            ]
//        ),
//        ChaptersList(
//            id: UUID(),
//            chapterName: "Chapter 2 - Learning the Figma Interface", courseName: "Learn Figma - UI/UX Design Essential Training",
//            chapterContent: [
//                ChapterContent(id: UUID(), number: "01", title: "Nange en gottu", duration: "17.04 hour", completed: false, start: false),
//                ChapterContent(id: UUID(), number: "02", title: "Ninge en gottu", duration: "5.30 hour", completed: false, start: false),
//                ChapterContent(id: UUID(), number: "03", title: "Yarige en gottu", duration: "1.23 hour", completed: false, start: false),
//                ChapterContent(id: UUID(), number: "04", title: "Yarigu enu gottilla", duration: "1 mins", completed: false, start: false)
//            ]
//        ),
//        ChaptersList(
//            id: UUID(), chapterName:
//                "Chapter 3 - Setting up a new project", courseName: "Learn Figma - UI/UX Design Essential Training",
//            chapterContent: [
//                ChapterContent(id: UUID(), number: "01", title: "Allenu aarama", duration: "5 hour", completed: false, start: false),
//                ChapterContent(id: UUID(), number: "02", title: "Naav illi aaramu", duration: "40 mins", completed: false, start: false),
//                ChapterContent(id: UUID(), number: "03", title: "Naavella irode hinge", duration: "6 mins", completed: false, start: false)
//            ],
//            testIs: ModuleTest(
//                id: UUID(),
//                image: "icn_moduletest",
//                module: "Module Test 01",
//                chapter: "Chapter 3",
//                subTitle: "Setting up a new project",
//                title: "Module Test - 01",
//                duration: "10 Mins | 25 Questions",
//                testCompleted: false,
//                startTest: false,
//                testDetsails: [
//                    TestDetsails(
//                        id: UUID(),
//                        questionNum: 1,
//                        question: "What is 2 x 1 = ?",
//                        option01: "1",
//                        option02: "2",
//                        option03: "3",
//                        option04: "4",
//                        correctAnswer: "2",
//                        answer: nil,
//                        tappedoption: "",
//                        questionAttempted: false
//                    ),
//                    TestDetsails(
//                        id: UUID(),
//                        questionNum: 2,
//                        question: "What is 2 x 2 = ?",
//                        option01: "1",
//                        option02: "2",
//                        option03: "3",
//                        option04: "4",
//                        correctAnswer: "4",
//                        answer: nil,
//                        tappedoption: "",
//                        questionAttempted: false
//                    ),
//                    TestDetsails(
//                        id: UUID(),
//                        questionNum: 3,
//                        question: "What is 2 x 3 = ?",
//                        option01: "6",
//                        option02: "2",
//                        option03: "3",
//                        option04: "4",
//                        correctAnswer: "6",
//                        answer: nil,
//                        tappedoption: "",
//                        questionAttempted: false
//                    )
//                ], testResult: TestResult(id: UUID(), passgrad: "00", correctAnswer: "0", wrongAnswer: "0")
//            ), combinedPercentage: 0
//        ),
//        ChaptersList(
//            id: UUID(),
//            chapterName: "Chapter 4 - Adding and Editing Content", courseName: "Learn Figma - UI/UX Design Essential Training",
//            chapterContent: [
//                ChapterContent(id: UUID(), number: "01", title: "Adella ninge yake", duration: "8 mins", completed: false, start: false),
//                ChapterContent(id: UUID(), number: "02", title: "Adella nang yake", duration: "12 hour", completed: false, start: false)
//            ]
//        ),
//        ChaptersList(
//            id: UUID(),
//            chapterName: "Chapter 5 - Completing the Design", courseName: "Learn Figma - UI/UX Design Essential Training",
//            chapterContent: [
//                ChapterContent(id: UUID(), number: "01", title: "Ninge yak beku adella", duration: "5 hour", completed: false, start: false)
//            ]
//        ),
//        ChaptersList(
//            id: UUID(),
//            chapterName: "Chapter 6 - Prototyping, Sharing and Exporting", courseName: "Learn Figma - UI/UX Design Essential Training",
//            chapterContent: [
//                ChapterContent(id: UUID(), number: "01", title: "Enu maadodu", duration: "9 hour", completed: false, start: false),
//                ChapterContent(id: UUID(), number: "02", title: "Onti hoovondu", duration: "3 mins", completed: false, start: false),
//                ChapterContent(id: UUID(), number: "03", title: "Road alli siktu", duration: "34 mins", completed: false, start: false),
//                ChapterContent(id: UUID(), number: "04", title: "Enu helodu", duration: "54 mins", completed: false, start: false),
//                ChapterContent(id: UUID(), number: "05", title: "Inta time alli", duration: "1.23 hour", completed: false, start: false),
//                ChapterContent(id: UUID(), number: "06", title: "yavanig goyyu", duration: "33 mins", completed: false, start: false)
//            ]
//        ),
//        ChaptersList(
//            id: UUID(),
//            chapterName: "Chapter 7 - Conclusion", courseName: "Learn Figma - UI/UX Design Essential Training",
//            chapterContent: [
//                ChapterContent(id: UUID(), number: "01", title: "Nim paadakke ondu namaskaara", duration: "99 hours", completed: false, start: false)
//            ],
//            testIs: ModuleTest(
//                id: UUID(),
//                image: "icn_moduletest",
//                module: "Final Test",
//                chapter: "Chapter 7",
//                subTitle: "Conclusion",
//                title: "Final Test",
//                duration: "30 Mins | 20 Questions",
//                testCompleted: false,
//                startTest: false,
//                testDetsails: [
//                    TestDetsails(
//                        id: UUID(),
//                        questionNum:1,
//                        question: "What is 3 x 1 = ?",
//                        option01: "1",
//                        option02: "2",
//                        option03: "3",
//                        option04: "4",
//                        correctAnswer: "3",
//                        answer: nil,
//                        tappedoption: "",
//                        questionAttempted: false
//                    ),
//                    TestDetsails(
//                        id: UUID(),
//                        questionNum:1,
//                        question: "What is 3 x 2 = ?",
//                        option01: "6",
//                        option02: "2",
//                        option03: "3",
//                        option04: "4",
//                        correctAnswer: "6",
//                        answer: nil,
//                        tappedoption: "",
//                        questionAttempted: false
//                    ),
//                    TestDetsails(
//                        id: UUID(),
//                        questionNum:1,
//                        question: "What is 3 x 3 = ?",
//                        option01: "1",
//                        option02: "2",
//                        option03: "9",
//                        option04: "4",
//                        correctAnswer: "9",
//                        answer: nil,
//                        tappedoption: "",
//                        questionAttempted: false
//                    )
//                ], testResult: TestResult(id: UUID(), passgrad: "00", correctAnswer: "0", wrongAnswer: "0")
//            ),
//            combinedPercentage: 0
//        )
//    ]
    
    
   
    
}
