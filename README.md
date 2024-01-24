# Encyclofy - Neema Sadry

## Setup
1) Clone the repo from GitHub on to your local machine
2) Setup the project's dependencies by running the following command from the project's *root* directory:
   ```bash
   bin/setup
   ```
   This should accomplish the following tasks in order: 
    1) Install gems listed in `Gemfile`
    2) *Globally* installs the `foreman` gem
    3) Install the `Yarn` package manager (via `npm`) andpackages listed in `package.json`
    5) Compiles (i.e., `build`) CSS & JS files
    6) Prepares the database via [`rails db:prepare`](https://edgeguides.rubyonrails.org/active_record_migrations.html#preparing-the-database)
    7) Clears all `log` and `tmp` files
    8) Will restart the server if currently running
3) Start the application using the following command:
   ```bash
   bin/dev
   ```
   This will use [`foreman` (see *Introducing Foreman* blog post)](http://blog.daviddollar.org/2011/05/06/introducing-foreman.html) to run and manage all the processes listed in `Procfile.dev`.
4) Optionally, you can run the following command to run all tests:
   ```bash
   rails test
   ```

## Features
- Styled using [Tailwind CSS](https://tailwindcss.com/)
- Pagination via [Pagy](https://github.com/ddnexus/pagy)
- Generate seed data randomly with [Faker](https://github.com/faker-ruby/faker)
- Added [`better_errors` gem](https://github.com/BetterErrors/better_errors) to improve debugging in `development` env
- Expanded test suite

## Learning Experience & Technical Challenges

Outlined below are key insights into my learning experiences, the challenges I faced, and the strategies I employed to address them:

1) Re-experienced how to set up Tailwind CSS 3 different ways:
   1) Since the Rails app was already created for us, I was not able to add Tailwind CSS using the `--css=tailwind` flag with the `rails new` command. Therefore, I tried following the [steps listed on the docs](https://tailwindcss.com/docs/guides/ruby-on-rails). However, I kept running into errors when trying to start my build process with the `bin/dev` command.
      - The errors were related to the process managers I tried using: [`overmind` package](https://github.com/DarthSim/overmind) or the [`foreman` gem](https://rubygems.org/gems/foreman) directly.
   2) To expedite development and save time, I opted to [add Tailwind CSS via the Play CDN](https://tailwindcss.com/docs/installation/play-cdn), which satisfied the majority of my development needs throughout this project. However, there are some caveats I considered when making this decision:
      - As stated *just before the first step* in the documentation:
        > The Play CDN is designed for development purposes only, and is not the best choice for production.

        Although we do not need to deploy this app to production, I find it beneficial to operate under the assumption that we will. After all, the ultimate goal of developing any web app, regardless of the tech stack, is to prepare it for production :wink:
      - There were technical difficulties when I attempted to add more robust solutions. For example, adding the [`pagy` gem](https://github.com/ddnexus/pagy) for paginating all records listed from the `articles` table when viewing `http://localhost:3000/articles/index`. Specifically, I was not able to easily style the contents rendered from [the `pagy_nav` helpers](https://ddnexus.github.io/pagy/docs/extras/tailwind/#style-2).
   3) Towards the end of my project, I remembered from past experience that there was *another* way to install Tailwind CSS! After a quick search, I found [the solution using the `cssbundling-rails` gem](https://stackoverflow.com/questions/71640507/how-to-import-tailwind-plugin-in-rails-7). This solution worked perfectly :thumbsup:
2) While adding Tailwind CSS was my goal, it was contingent on my ability to augment the `bin/setup` Bash script for seamless installation of all newly added project dependencies. My decision stemmed out of respect and consideration for the individual(s) reviewing this project and the rest of my application. Offering a streamlined and pain-free setup process for my project ***on their*** development machines is a gesture that I believe anyone would appreciate :innocent:
3) Given my constant use of search engines in my other web development projects, like [Meilisearch](https://www.meilisearch.com/) or [ElasticSearch](https://www.elastic.co/elasticsearch)/[OpenSearch](https://opensearch.org/platform/search/index.html) (via the [`searchkick` gem](https://rubygems.org/gems/searchkick)), it was refreshing to implement a simple search method with such a simple raw SQL statement.
4) I noticed from the very beginning that the project was using Ruby 2.x instead of Ruby 3.x. Because I already had `asdf` setup on my Mac, I just had to run the following command:
   ```bash
   asdf install ruby 2.7.6
   ```
   Afterwards, I added a `.tool-versions` file to the root directory of the newly cloned project. Now, I was able to set the ***`local`*** version used in developing this *specific* project to `ruby 2.7.6` ***without*** changing the versions used in my other projects, which is `ruby 3.3.0`.
5) Given how I often feel the lack of experience and discipline when I try to incorporate [Test-Driven Development (TDD)](https://wiki.c2.com/?TestDrivenDevelopment) into my workflow, I took it upon myself to reinforce and expand upon the fundamentals I already possessed for [testing rails applications](https://edgeguides.rubyonrails.org/testing.html) by reading [interesting](https://thoughtbot.com/blog/how-we-test-rails-applications) [blog](https://www.mintbit.com/blog/best-practices-for-testing-ruby-on-rails-applications-unit-testing-integration-testing-and-more) [posts](https://blog.railwaymen.org/rails-tests-ruby-on-rails-apps), and watching screencasts on [GoRails](https://gorails.com/), [Drifting Ruby](https://www.driftingruby.com/episodes), or YouTube.

   Frankly, though I successfully wrote numerous tests, and have them ***all*** pass, I noticed a tendency to compose the majority of my tests *after* completing substantial portions of the application. This is an aspect I am eager to improve upon during my time as a Backend Engineering Intern at Shopify this summer. My confidence in this stems from seeing great progress in using TDD during my [previous internship experience at InfluxData](https://www.influxdata.com/blog/meet-influxdata-summer-2022-interns/#heading4).

## Screenshots

For your convenience, I have provided several screenshots to facilitate the evaluation of my project:

### Article Actions - Encyclofy - Google Chrome
![Root page of Encyclofy app running with bin-dev - Google Chrome - Neema Sadry](https://share.cleanshot.com/fYgKV9ZrTL4Kvp2dJkz8)
*Root page of Encyclofy app running with bin-dev*

![Show Article - Encyclofy Google Chrome - Neema Sadry](<Show Article - Encyclofy Google Chrome - Neema Sadry.png>)
*Show Article*

![New Article - Encyclofy Google Chrome - Neema Sadry](<New Article - Encyclofy Google Chrome - Neema Sadry.png>)
*New Article*

![Create Article - Encyclofy Google Chrome - Neema Sadry](<Create Article - Encyclofy Google Chrome - Neema Sadry.png>)
*Create Article*

![Edit Article - Encyclofy Google Chrome - Neema Sadry](<Edit Article - Encyclofy Google Chrome - Neema Sadry.png>)
*Edit Article*

![Update Article - Encyclofy Google Chrome - Neema Sadry](<Update Article - Encyclofy Google Chrome - Neema Sadry.png>)
*Update Article*

![Last Page with Latest Article - Encyclofy Google Chrome - Neema Sadry](<Last Page with Latest Article - Encyclofy Google Chrome - Neema Sadry.png>)
*Last Page with Latest Article*

![Delete Modal - Encyclofy Google Chrome - Neema Sadry](<Delete Modal - Encyclofy Google Chrome - Neema Sadry.png>)
*Delete Modal*

![Delete Article - Encyclofy Google Chrome - Neema Sadry](<Delete Article - Encyclofy Google Chrome - Neema Sadry.png>)
*Delete Article*

### Search Results Index - Encyclofy - Google Chrome
![Index of Search Results for _Article_ - Encyclofy Google Chrome - Neema Sadry](<Index of Search Results for _Article_ - Encyclofy Google Chrome - Neema Sadry.png>)
*Index of Search Results for **Article** Term*

![Redirecting Invalid Search - Encyclofy Google Chrome - Neema Sadry](<Redirecting Invalid Search - Encyclofy Google Chrome - Neema Sadry.png>)
*Redirecting Invalid Search*

### Process Logs & Output - iTerm2
[Passing Expanded Test Suite - iTerm2 - Neema Sadry](<Passing Expanded Test Suite - iTerm2 - Neema Sadry.png>)
![Passing Expanded Test Suite - iTerm2 - Neema Sadry](https://private-user-images.githubusercontent.com/6279194/299158458-6eb81803-54a6-4ac2-9b95-b4a31022431a.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MDYwNjM4NzIsIm5iZiI6MTcwNjA2MzU3MiwicGF0aCI6Ii82Mjc5MTk0LzI5OTE1ODQ1OC02ZWI4MTgwMy01NGE2LTRhYzItOWI5NS1iNGEzMTAyMjQzMWEucG5nP1gtQW16LUFsZ29yaXRobT1BV1M0LUhNQUMtU0hBMjU2JlgtQW16LUNyZWRlbnRpYWw9QUtJQVZDT0RZTFNBNTNQUUs0WkElMkYyMDI0MDEyNCUyRnVzLWVhc3QtMSUyRnMzJTJGYXdzNF9yZXF1ZXN0JlgtQW16LURhdGU9MjAyNDAxMjRUMDIzMjUyWiZYLUFtei1FeHBpcmVzPTMwMCZYLUFtei1TaWduYXR1cmU9OWRmYTY4NTE5ODk0ODQ4Mzg4MmM2MWVlNmFkNTNiN2M4MWJmMjNkMmE3ZDAwY2ZmMGU4YjUwOWQwMmM2YzcyNiZYLUFtei1TaWduZWRIZWFkZXJzPWhvc3QmYWN0b3JfaWQ9MCZrZXlfaWQ9MCZyZXBvX2lkPTAifQ.nuWo8YMBG2tvfLtH2nWgfwCcc-y0PZKrFfPf8HYiPOg)
*Passing Expanded Test Suite Successfully*


[Working bin-setup command on iTerm2 - Neema Sadry](<Working binsetup Command - iTerm2 - Neema Sadry.png>)
![Working bin-setup command on iTerm2 - Neema Sadry](https://private-user-images.githubusercontent.com/6279194/299158469-eb2df106-8728-49bf-8a8f-cf1eacb99025.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MDYwNjM5OTYsIm5iZiI6MTcwNjA2MzY5NiwicGF0aCI6Ii82Mjc5MTk0LzI5OTE1ODQ2OS1lYjJkZjEwNi04NzI4LTQ5YmYtOGE4Zi1jZjFlYWNiOTkwMjUucG5nP1gtQW16LUFsZ29yaXRobT1BV1M0LUhNQUMtU0hBMjU2JlgtQW16LUNyZWRlbnRpYWw9QUtJQVZDT0RZTFNBNTNQUUs0WkElMkYyMDI0MDEyNCUyRnVzLWVhc3QtMSUyRnMzJTJGYXdzNF9yZXF1ZXN0JlgtQW16LURhdGU9MjAyNDAxMjRUMDIzNDU2WiZYLUFtei1FeHBpcmVzPTMwMCZYLUFtei1TaWduYXR1cmU9OWZlY2U4ZGRkZDk2N2JhMmU4NWRjZTA3ZjFjODc2Mzk3MWE1MzIyYTlmZjFiZjg0ODUwZjBiNTg3ZTlkYTIxMiZYLUFtei1TaWduZWRIZWFkZXJzPWhvc3QmYWN0b3JfaWQ9MCZrZXlfaWQ9MCZyZXBvX2lkPTAifQ.Ww_RG1EaTa_BQaBHEq6meATsos0rERc0lHxLLiyLBs8)
*Working **bin/setup** command on iTerm2*

[Rails app running with bin-dev command - iTerm2 - Neema Sadry](<Rails app running with bin-dev command - iTerm2 - Neema Sadry.png>)
![Rails app running with bin-dev command - iTerm2 - Neema Sadry](https://private-user-images.githubusercontent.com/6279194/299158464-af7178e0-f4f2-4a8e-9b16-1f810d56a581.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MDYwNjM5OTYsIm5iZiI6MTcwNjA2MzY5NiwicGF0aCI6Ii82Mjc5MTk0LzI5OTE1ODQ2NC1hZjcxNzhlMC1mNGYyLTRhOGUtOWIxNi0xZjgxMGQ1NmE1ODEucG5nP1gtQW16LUFsZ29yaXRobT1BV1M0LUhNQUMtU0hBMjU2JlgtQW16LUNyZWRlbnRpYWw9QUtJQVZDT0RZTFNBNTNQUUs0WkElMkYyMDI0MDEyNCUyRnVzLWVhc3QtMSUyRnMzJTJGYXdzNF9yZXF1ZXN0JlgtQW16LURhdGU9MjAyNDAxMjRUMDIzNDU2WiZYLUFtei1FeHBpcmVzPTMwMCZYLUFtei1TaWduYXR1cmU9NDdjOWU4OTkwMDIzZTYzY2JkNTY1MjUwZjhjZjZkNzBlOThmNDNhYzcwYWI0YWI2ZjRkNzliZmEyMDk1NmFmNyZYLUFtei1TaWduZWRIZWFkZXJzPWhvc3QmYWN0b3JfaWQ9MCZrZXlfaWQ9MCZyZXBvX2lkPTAifQ.pnj7MSPXSmhzvlYk4kaWH_984D7aoAEayHRB7SmtEaQ)
*Rails app running with **bin/dev** command*


# Technical Instructions - Shopify
1. Fork this repo to your local Github account.
2. Create a new branch to complete all your work in.
3. Test your work using the provided tests
4. Create a Pull Request against the Shopify Main branch when you're done and all tests are passing

# Project Overview
The Rails application you will be working on is an Encyclopedia, which allows users to create, view, edit, and delete articles. The application also provides search functionality to help users find relevant articles. Be sure to implement basic CRUD actions on articles. Your task is to implement these features as well as write the code that makes the tests pass.

# Project Goals
The main goal of this internship project is to implement the functionality required to make the existing tests pass. The provided tests cover various aspects of the application, including creating and viewing articles, editing and updating articles, deleting articles, and searching for articles. Along with completing the tests, be sure to implement all basic CRUD actions on your articles on a controller and create views to see your work in the app.

## Your specific goals for this project are as follows:

1. Review Existing Tests: Start by reviewing the existing tests provided in the article_test.rb file located in the test/models directory. Understand the requirements and expectations of each test.

2. Implement Functionality: Write the code necessary to make the existing tests pass. This involves implementing the required actions and logic in the models, controllers, and views to fulfill the specified requirements. Also be sure to implement basic CRUD actions and demonstrate proper MVC principals.

3. Ensure Code Quality: Write clean, well-structured, and maintainable code. Follow best practices and adhere to the Ruby on Rails conventions. Pay attention to code readability, modularity, and performance.

4. Test Your Code: After implementing the functionality, run the tests to ensure that they pass successfully. Fix any failures or errors that occur and retest until all tests pass.

5. Code Documentation: Document your code by adding comments and explanatory notes where necessary. This will help other developers understand your implementation and make future maintenance easier.

6. Version Control: Use Git for version control. Commit your changes regularly and push them to a branch in your forked repository.

7. Create a Pull Request: Once you have completed the project goals, create a pull request to merge your changes into the main repository. Provide a clear description of the changes made and any relevant information for the code review.

## Getting Started
To get started with this project, follow these steps:

1. Clone the repository to your local development environment.

2. Install the necessary dependencies by running bundle install in the project directory.

3. Familiarize yourself with the existing codebase, including the models, controllers, and views.

4. Review the existing tests in the article_test.rb file and understand their purpose and functionality.

5. Run the tests locally to ensure they are passing.

6. Start working on the goals outlined above, making improvements to the existing tests and adding new tests as needed.

7. Commit your changes regularly and push them to a branch in your forked repository.

8. Once you have completed the project goals, create a pull request to merge your changes into the main repository.

## Resources
Here are some resources that may be helpful during your internship project:

- [Ruby on Rails Guides](https://guides.rubyonrails.org/) - Comprehensive guides on Ruby on Rails, covering various aspects of web application development.

- [Ruby Style Guide](https://rubystyle.guide/) - A community-driven Ruby coding style guide to ensure consistent and readable code.

- [Git Documentation](https://git-scm.com/doc) - Official documentation for Git, the version control system used in this project.
