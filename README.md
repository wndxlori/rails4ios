rails4ios
=========

Course outline

 2 days (15 hours)
 
 Ruby - 2 - 3 hours
 Rails / iOS - 10 - 11 hours
 Ad hoc / open - 1 - 2 hours


 Verify Ruby/Rails setup
 Ruby Language & Tools Introduction
 Ruby on Rails - The Good Parts
 Building API's with Rails/JSON and the Grape micro-framework
 iOS to Rails by Example, with AFNetworking
 Responsive Web Design by Example with Twitter Bootstrap
 Deploying, The Easy Way, with Heroku   

TODOs

 * Regenerate scaffold on FieldtripServer, to get rid of deprecation warnings from the new version of Rails
 * Mailout student setup (Rails Installer, Postgres.app, Xcode, Github account, Heroku - extra credit)
 * Create Ruby Language & Tools demo/presentation from https://github.com/alexch/ruby_notes
 * Create step-by-step interactive Rails tutorial
   * rails new
   * pg config
   * database create
   * migration
   * data seeding
   * scaffolding
 * Twitter Bootstrap - step by step
 * Grape basics
   * install
   * list api
   * introduce afnetworking on iOS side
 * Advanced Grape
   * authentication
   * POST
 * Heroku
   * Github!
   * setup heroku account
   * create heroku app
   * push
   * rejigger app to access the heroku server
 * Adhoc Q&A
   * create list of possible topics

THINGS TO EXPLORE

 * RestKit
 * NS Rails
 * AF networking

PAIN POINTS

 * Web!
 * Design!


MARKETING

 * bigger picture: ebooks, screencasts
 * What do they need?
  * API, data storage/feed only?, blog?, collaboration/interaction?, aggregation?
  * More than just a storage backend API--want to have more control and flexibility
  (for course--perhaps have a space limit for field trips where the app would show how many seats left?)
  
  
  Resources discussing related needs:
   * http://stackoverflow.com/questions/10132817/app-that-syncs-to-the-network
     (wants to simply sync to a backend database)
     
  http://live.readysetrails.com/signup/ 
  http://www.stagehq.com/  
     
     
     
USER STORIES WE COULD IMPLEMENT

 * Field trip manager creates a field trip entry in the system (including location, school, etc.)
 * Allow a student to register for a field trip (if not full)
 * Field trip manager wants to get list
 
STEPS
 
 * Create migrations and seeding of database
 * Set up API calls
  