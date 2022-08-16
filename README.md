# Healthier

An application for users who want to track, and share their health goals to people who aspire to be healthy, and people who want to be healthier than ever.

## Admin User Stories

- User Story 1: As an admin, I can edit the username of a user and email is sent when username is changed.
- User Story 2: As an admin, I can see user and post reports to decide if the user has malicious user or post details and admin can delete that account and send email for violating community standard.

## User Stories

- User Story 1: As a user, I can register an account and alternatively, register using google account,
- User Story 2: As a user, I can add repetition and timed exercises.
- User Story 3: As a user, I can add routines and add repetition and timed exercises in that routine.
- User Story 4: As a user, I can schedule my exercises and routines using Google Calendar.
- User Story 5: As a user, I can add foods and its macronutrients (calories, carbohydrates, fats, protein).
- User Story 6: As a user, I can add meals and add foods in that meal.
- User Story 7: As a user, I can log my daily nutrient intakes by adding the food or meal that was eaten.
- User Story 8: As a user, I can create a post and alternatively, upload an image associated with that post.
- User Story 9: As a user, I can like posts.
- User Story 10: As a user, I can comment in a post.
- User Story 11: As a user, I can follow other people.
- User Story 12: As a user, I can initiate a direct message to others.
- User Story 13: As a user, I can report a post.
- User Story 14: As a user, I can report a user.
- User Story 15: As a user, I can receive notifications when someone commented, liked my post.
- User Story 16: As a user, I can receive notifications when someone initiated a converastion with me.
- User Story 17: As a user, I can receive an unread messages count when I never have seen the message yet.

## Entity Relationship Diagram

Below is the ERD of the application:

![ERD of the Application](https://drive.google.com/uc?export=view&id=1DPgYFSdMtUR2nZ6ilcIkU9rzbzGgAERq)

## Technologies

- Ruby 3.1.0
- Rails 7.0.3.1
- PostgreSQL 14.2
- NodeJS 16.15.0
- Yarn 1.22.19

## Getting started

To get started with the app, clone the repo and access the created directory:

```
$ git clone git@github.com:superspike7/healthier.git
$ cd healthier
```

Install the needed gems and node modules:

```
$ bundle
$ yarn
```

Next, create and setup the database (database migrations/schema):

```
$ bin/rails db:setup
```

Finally, run the test suite to verify that all features work correctly:

```
$ rspec
```

Run the app by starting the Rails dev server:

```
$ bin/dev
```

You can then visit the site with this URL: http://localhost:3000

## Note

If error occurs, it is likely due to the lack of credentials, which you can request from the contributors of this application.

## Admin Account

- Email: admin@healthier.com
- Password: abc123

## User Account

- Email: test.account@healthier.com
- Password: abc123
