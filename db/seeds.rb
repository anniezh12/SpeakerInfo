# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
  # User.create(name:'Aniqa',email:'aniqa@yahoo.com',education:'Masters of Computer Science',website:'aniqaelahi.com',category:'Motivationsl')
  #  User.create(name:'Zeeshan',email:'zeeshan@yahoo.com',education:'Masters of Computer Science',website:'Zeeshan.com',category:'Life Coach')
  #  User.create(name:'Saad',email:'saad@yahoo.com',education:'Masters of Engineering',website:'saad.com',category:'Recruiter')

   Category.create(title: 'Motivational')
   Category.create(title: 'Interview Preparation')
   Category.create(title: 'Recruiter')
   Category.create(title: 'Life Coach')
   Category.create(title: 'Enterpreneur')
  #  Topic.create(title: 'How to get offensive in Interview',description:'learning life skills for how to become offensive. Daily life strategies',date_of_event:'01/17/2016')
  #  Topic.create(title: 'Basic Interview questions',description:'Basic Interview questions',date_of_event:'02/5/2016')
  #  Topic.create(title: 'You Can do it',description:'You Can do it. Daily life strategies',date_of_event:'02/15/2016')
  #  Topic.create(title: 'Myths about Resumes',description:'Myths about Resumes does it work?',date_of_event:'02/22/2016')
  #  Topic.create(title: 'Following up',description:'Following up after an interview',date_of_event:'03/5/2016')
  #  Topic.create(title: 'When to start a career',description:'Is it right time to start a career?',date_of_event:'03/12/2016')
  #  Topic.create(title: 'How to build a linkedin profile',description:'Does social media profiles work? Daily life strategies',date_of_event:'03/27/2016')
   Speakerarchive.create(user_id:1,topic_id:2)
   Speakerarchive.create(user_id:1,topic_id:3)
   Speakerarchive.create(user_id:1,topic_id:4)
   Speakerarchive.create(user_id:2,topic_id:1)
   Speakerarchive.create(user_id:2,topic_id:5)
   Speakerarchive.create(user_id:3,topic_id:6)
   Speakerarchive.create(user_id:4,topic_id:7)
