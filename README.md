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