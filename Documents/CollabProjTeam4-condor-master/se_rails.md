### VM setup

open the installruby file with your text editor and change the exports to these.

`export RUBYVER=2.6.4`
`export RAILSVER=5.2.3`

Run `/bin/rm -fr ~/.rbenv`

Finally, `./installruby.sh`

The process will take about 15 minutes to complete.
Once complete, let's make an example rails app.

### Making a rails app

`rails new example` to create a new rails project named example.

cd into the newly made `example` directory.

To run the app, you will need your server IP. `ip addr show eth0`. 
The output will contain this line. Copy the ip address as shown here.

`inet <MY.IP.ADDRESS>/24 brd 10.18.6.255 scope global noprefixroute dynamic eth0`

To start rails, `rails s -b <MY.IP.ADDRESS> -p 3000`

### Accessing the app

Now you *should* be able to access the rails startup page using your web browser.

`http://csc415-server<xx>.hpc.tcnj.edu:3000`

Once you have it working and can access the page, go ahead and kill the rails process.

### File structure

The rails file structure is strange. Please be patient. You'll learn them in time.

.
├── app (where all your code goes)
│   ├── assets (html/css assets)
│   │   ├── config
│   │   │   └── manifest.js
│   │   ├── images
│   │   ├── javascripts
│   │   │   ├── application.js
│   │   │   ├── cable.js
│   │   │   └── channels
│   │   └── stylesheets
│   │       └── application.css
│   ├── channels (will likely not use)
│   │   └── application_cable
│   │       ├── channel.rb
│   │       └── connection.rb
│   ├── controllers (The C of MVC. Controls internal actions.) 
│   │   ├── application_controller.rb
│   │   └── concerns
│   ├── helpers (Seperate location for common helper functions)
│   │   └── application_helper.rb
│   ├── jobs (Background tasks for rails to run)
│   │   └── application_job.rb
│   ├── mailers (Email formatting controllers)
│   │   └── application_mailer.rb
│   ├── models (Objects representing the database tables)
│   │   ├── application_record.rb
│   │   └── concerns
│   └── views (HTML templates)
│       └── layouts (Common elements of the website like navagation/footer)
│       |   ├── application.html.erb
│       |   ├── mailer.html.erb
│       |   └── mailer.text.erb
|       |--- <model name> (individual pages relating to a database model)
├── bin (you can ignore this)
│   ├── bundle
│   ├── rails
│   ├── rake
│   ├── setup
│   ├── spring
│   ├── update
│   └── yarn
├── config (contains all configuration files)
│   ├── application.rb
│   ├── boot.rb
│   ├── cable.yml
│   ├── credentials.yml.enc
│   ├── database.yml (database credentials and settings)
│   ├── environment.rb
│   ├── environments (environment specific configurations)
│   │   ├── development.rb
│   │   ├── production.rb
│   │   └── test.rb
│   ├── initializers
│   │   ├── application_controller_renderer.rb
│   │   ├── assets.rb
│   │   ├── backtrace_silencers.rb
│   │   ├── content_security_policy.rb
│   │   ├── cookies_serializer.rb
│   │   ├── filter_parameter_logging.rb
│   │   ├── inflections.rb
│   │   ├── mime_types.rb
│   │   └── wrap_parameters.rb
│   ├── locales (translations)
│   │   └── en.yml
│   ├── master.key
│   ├── puma.rb
│   ├── routes.rb (controlls the filestructure of the website)
│   ├── spring.rb
│   └── storage.yml
├── config.ru
├── db (database configurations, initial data construction, database schema definitions)
│   ├── development.sqlite3
│   └── seeds.rb (initial data construction)
├── Gemfile (all the gems used by the application)
├── Gemfile.lock (Current gems installed and loaded. Do not check into version control)
├── lib
│   ├── assets
│   └── tasks
├── log
│   └── development.log
├── package.json
├── public (common resources and static pages)
│   ├── 404.html
│   ├── 422.html
│   ├── 500.html
│   ├── apple-touch-icon.png
│   ├── apple-touch-icon-precomposed.png
│   ├── favicon.ico
│   └── robots.txt
├── Rakefile (custom tasks for the rails command)
├── README.md
├── storage
├── test (testing)
│   ├── application_system_test_case.rb
│   ├── controllers
│   ├── fixtures (example database entries to use as testing data)
│   │   └── files
│   ├── helpers
│   ├── integration (integration tests)
│   ├── mailers (email tests)
│   ├── models (model tests)
│   ├── system
│   └── test_helper.rb
└── vendor


### Rails commands

#### `generate <migration|scaffolding|...> <name> [<name>:<type>]`

Generates a combiniation of things like changes to database organization, 
new kinds of data and the pages to view and edit them, and all kinds of
other stuff.

#### `delete ...`

Does the exact opposite of rails generate in case you made a mistake

#### Tasks (db:migrate, db:drop, db:create, db:setup, db:seed, ...)

Specific jobs defined in the rakefile mentioned above. Do various tasks
like manipulating the database.

#### `server | s`

Runs the rails server, puma in this case.

### Notes

If rails refuses to start, spring is stuck in the background. Run `spring stop`.
Should fix the problem.

You can change most files while the server is running. Exceptions are mostly
just configuration files.

To properly run the rails server on the VM, the -b flag MUST be set or you
will not be able to access the site. It's a good idea to save the IP somewhere.
