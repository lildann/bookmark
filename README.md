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