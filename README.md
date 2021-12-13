## User Stories for a Bookmark Manager using CRUD
---

Template from gov.uk:
* the person using the service (the actor)
* what the user needs the service for (the narrative)
* why the user needs it (the goal)


```
As a User
So that I can see my bookmarks
I want to be able to view the bookmarks I have in a list

* Noun = Bookmark
* Verb = view_bookmarks()

---
As a User
So that I can customise my bookmarks 
I want to be able to add new bookmarks to the list

* Verb = add_bookmark(bookmark)

---
As a User
So that I can remove my bookmarks
I want to be able to delete a bookmark from the list

* Verb = delete_bookmark(bookmark)

---
As a User
So that I can change my bookmarks
I want to be able to update a bookmark from the list

* Verb = update_bookmark(bookmark)

---
As a User
So that I can add notes to my bookmarks
I want to be able to add a comment to a bookmark from the list

* Verb = comment
```


| Component   | Responsibility                                | Refactor                                |
|------------ |---------------------------------------------  |---------------------------------------- |
| Model       | Encapsulate logic with relevant data          | Encapsulate bookmark data in a class    |
| View        | Display the result to a user                  | Show the bookmark data in a list        |
| Controller  | Get data from the model and put in the view   | Render bookmark data into to the view   |


### Interacting with PG in IRB:
```
3.0.0 :001 > require 'pg'
 => true 
3.0.0 :002 > connection = PG.connect(dbname: 'bookmark_manager')
 => #<PG::Connection:0x00007fc0e52e8a30> 
3.0.0 :003 > result = connection.exec('SELECT * FROM bookmarks')
 => #<PG::Result:0x00007fc0e5258a20 status=PGRES_TUPLES_OK ntuples=3 nfiel... 
3.0.0 :004 > result.each { |bookmark| p bookmark }
{"id"=>"4", "url"=>"https://www.channel4.com", "title"=>"Channel 4"}
{"id"=>"5", "url"=>"https://www.netflix.com", "title"=>"Netflix"}
{"id"=>"6", "url"=>"https://www.bbc.co.uk/iplayer", "title"=>"BBC iPlayer"}
 => #<PG::Result:0x00007fc0e5258a20 status=PGRES_TUPLES_OK ntuples=3 nfields=3 cmd_tuples=3> 
3.0.0 :005 > 
```

## How to use

### To set up the project

Clone this repository and then run:

```
bundle
```

### To run the Bookmark Manager app:

```
rackup
```

### To run tests:

```
rspec
```

### To run linting:

```
rubocop
```

### Instructions for Database Setup and Test Database Setup
---
* Connect to psql in the terminal 
* Create the database using the psql command 
```
psql
CREATE DATABASE bookmark_manager;
CREATE DATABASE bookmark_manager_test;
```

* Connect to the database using the pqsl command 
```
\c bookmark_manager;
```
* Run the queries saved in the file numerically, starting with: 01_create_bookmarks_table.sql 
