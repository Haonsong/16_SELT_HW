# RottenPotatoes demo app: getting started


0. Fork and clone this repo (github.com/SELT/rotten-potatoes)

0. Then do `cd rotten-potatoes` to change to the app's
top-level directory.

0. Next type  `gem install bundler` to  install the bundler gem


0. Enter the command `bundle install --without production` to make sure all the gems
(libraries) used by the app are in place.

0. Run `rake db:create` to create the initial database.

0. Run `rake db:migrate` to apply the database migrations.

0. Run `rake db:seed` to seed the initial database contents.

0. Run `rails server -p $PORT -b $IP` to start the app.  Cloud9 will pop
up a window showing the URL to visit in your browser to interact with
the running app. You can also view the app in the Cloud9 "Preview" window.

0. To kill the server, enter CNTL-c.


