# Completed step definitions for basic features: AddMovie, ViewDetails, EditMovie 

Given /^I am on the RottenPotatoes home page$/ do
  visit movies_path
 end


 When /^I have added a movie with title "(.*?)" and rating "(.*?)"$/ do |title, rating|
  visit new_movie_path
  fill_in 'Title', :with => title
  select rating, :from => 'Rating'
  click_button 'Save Changes'
 end

 Then /^I should see a movie list entry with title "(.*?)" and rating "(.*?)"$/ do |title, rating| 
   result=false
   all("tr").each do |tr|
     if tr.has_content?(title) && tr.has_content?(rating)
       result = true
       break
     end
   end  
  expect(result).to be_truthy
 end

 When /^I have visited the Details about "(.*?)" page$/ do |title|
   visit movies_path
   click_on "More about #{title}"
 end

 Then /^(?:|I )should see "([^\"]*)"$/ do |text|
    expect(page).to have_content(text)
 end

 When /^I have edited the movie "(.*?)" to change the rating to "(.*?)"$/ do |movie, rating|
  click_on "Edit"
  select rating, :from => 'Rating'
  click_button 'Update Movie Info'
 end


# New step definitions to be completed for HW5. 
# Note that you may need to add additional step definitions beyond these


# Add a declarative step here for populating the DB with movies.

Given /the following movies have been added to RottenPotatoes:/ do |movies_table|
#   pending  # Remove this statement when you finish implementing the test step
  movies_table.hashes.each do |movie|
    # Each returned movie will be a hash representing one row of the movies_table
    # The keys will be the table headers and the values will be the row contents.
    # Entries can be directly to the database with ActiveRecord methods
    # Add the necessary Active Record call(s) to populate the database.
    Movie.create!(movie)
  end
end

When /^I have opted to see movies rated: "(.*?)"$/ do |arg1|
  # HINT: use String#split to split up the rating_list, then
  # iterate over the ratings and check/uncheck the ratings
  # using the appropriate Capybara command(s)
#   pending  #remove this statement after implementing the test step
  rating = Array["G", "PG", "PG-13", "R", "NC-17"]
  rating.each do |rate| 
      uncheck("ratings_" + rate)
  end
  given_ratings = arg1.split(', ')
  given_ratings.each do |checks|
      check("ratings_" + checks)
  end
  click_button("ratings_submit")
end

Then /^I should see only movies rated: "(.*?)"$/ do |arg1|
#   pending  #remove this statement after implementing the test step
    given_ratings = arg1.split(', ')
 
    Movie.all.each do |movie|
        if given_ratings.include?(movie.rating)
            expect(page).to have_content(movie.title)
        else
            expect(page).to have_no_content(movie.title)
        end
            
    end
end

Then /^I should see all of the movies$/ do
#   pending  #remove this statement after implementing the test step
    Movie.all.each do |movie|
        expect(page).to have_content(movie.title)
    end
end

When /^I click on: "(.*?)"$/ do |column|
    click_on(column)
end


Then /^I should see the table is sorted by: "(.*?)"$/ do |order|
    if order == "Movie Title" then
        expect(page).to have_content("2001: A Space Odyssey	G	1968-04-06 00:00:00 UTC	More about 2001: A Space Odyssey 
        Aladdin	G	1992-11-25 00:00:00 UTC	More about Aladdin")
    else
        expect(page).to have_content("2001: A Space Odyssey	G	1968-04-06 00:00:00 UTC	More about 2001: A Space Odyssey
        Raiders of the Lost Ark	PG	1981-06-12 00:00:00 UTC	More about Raiders of the Lost Ark")
    end
end


