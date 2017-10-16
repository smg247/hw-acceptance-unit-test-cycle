Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create!(movie)
  end
end

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  rating_list.split.each do |rating|
    steps %Q{When I #{uncheck}check “#{rating}”}
  end
end

Then /I should( not)? see the following movies: (.*)/ do |notsee, movies|
  movies.split.each do |movie|
    steps %Q{Then I should #{notsee} see “#{movie}”}
  end
end 

Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
  Movie.all.each do |movie|
    steps %Q{Then I should see “#{movie.title}”}
  end
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  e1_index = page.body.index(e1)
  e2_index = page.body.index(e2)
  expect(e1_index).to be < e2_index
end

Then /the director of "(.*)" should be "(.*)"/ do |title, director|
   step %Q{I should see "#{title}"}
   step %Q{I should see "#{director}"}
end