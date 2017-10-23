Feature: sort movies

  As a movie buff
  So that I can find movies in a given order
  I want to be able to sort the movies

Background: movies in database

  Given the following movies exist:
  | title        | rating | director     | release_date |
  | Star Wars    | PG     | George Lucas |   1977-05-25 |
  | Blade Runner | PG     | Ridley Scott |   1982-06-25 |
  | Alien        | R      |              |   1979-05-25 |
  | THX-1138     | R      | George Lucas |   1971-03-11 |

Scenario: sort by title
  When I go to the movies page
  And  I follow "Movie Title"
  Then I should see "Alien" before "Blade Runner"
