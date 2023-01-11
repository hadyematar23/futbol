# **Turing BE 2211 Group Project**

**Project Name:** 
      Futbol

**Contributors:** Hady Emmanuel Matar, Dawson Timmons, Melony Franchini 


## Table of Contents
      - Group Discussion
          - Questions & Responses
          - Q & A
      - Evaluation Readiness Checklist
          - Demonstration of Functional Completeness
          - Technical Quality & Organization of the Code
          - Identifying Areas of Code that you Decided to Refactor
          - Discussion of Collaboration/Version Control
          - Discussion of Test Coverage


## Group Discussion

  ### Questions & Resonses
      - What was the most challenging aspect of this project?
        Hady: I think I still struggle with the organizational aspect at the beginning of the project-- specifically how to split up methods into helper methods that do small, bite-sized jobs jobs each and fit into a larger scheme. I think this became particularily acute towards refactoring at the end when I realized that a lot of the methods we had to do essentially relied on the same functions/ methods/ utility, but it was hard to use helper methods for them as the existing methods were too large and interdependent to easily breakup.  
        Dawson: Understanding theory behind inheritance and how that differs from modules. Building out each of those file types and working through them slowly with my teammmates added in my understanding. 
        Mel: Trying to build every method inside of one class was VERY difficult. Then, attempting to separate the different methods out and have them able to pass a test now that it was in a new location. 

      - What was the most exciting aspect of this project?
        Hady: Too much of it, to be honest! I really liked learning how to use mocks and stubs--it made testing a lot of my code SOOOO much easier. It's definitely between that and just the aspect of breaking down huge chunks of data in a way that lets me read and utilize it. It feels empowering to be able to do that. 
        Dawson: Observing how the creation of helper methods for the more complex methods dryed up our code as well as implementing modules to further clean it up. Seeing how these two interacted with each other to improve readbility was the most interesting aspect for me. 
        Mel: Diagraming out how each file was connected was very helpful is visualizing the structure of the project we were trying to build. Learning that the speed of code depended greatly upon how many times the CSV data was accessed/iterated over was very interesting to me. This lead to the refactoring of many different methods (some I wrote and other's I did not) to try and utilize the method that included the memoized data in a effort to reduct CSV hits. 


      - Describe the best choice enumerables you used in your project. (Please include file names and line numbers.)**
        Hady: < season_utility.rb : line 11 > In this case, my method was trying to list all of the gameteams from a particular season, so once I had found all of the gameids from a particular season(season being listed in the game class), I used flat_map above a find_all in order to return all of the gamteam game_ids that matched the ones in the season array. 
        Dawson: < goals_utility.rb : line 4 >
        Initially adopted the, "when in doubt use <.each>" mindset. But once I got to refactoring, I was able to create an array more effectively with <.map>.
        Mel: < season_utility.rb : line 4 >
        Most of the methods I wrote still use only <.each> with an acculumator. However, while refactoring the use of memoized methods, I was able to use <.group_by> to produce a hash more efficiently.


      - Tell us about a module or superclass which helped you re-use code across repository classes.
        - Why did you choose to use a superclass and/or a module?

        Our project includes a superclass called stats.rb that includes states we wanted to pass to each subclass. These states is how we were able to reach into the CSV data files and parse out the data into the way we desired to use it, ie. an array of key-value pairs with the keys being the header info and the value being a hash of objects. These three attributes were then passed to all subclasses.

        We chose this route to simplify the process of dividing out which subclasses needed access to which CSV files. We chose to give all subclasses access to all CSV data.


      - Tell us about:
          1) a unit test and: 

          After learning how to use mocks and stubs, we were able to go back and test a lot of our helper methods, particularily the ones that were in the modules we created. A simple one, but one we did together, was located on the goals_utility_spec, line 26 and allowed us to test to see the sum of the home and away goals. Instead of iterating over all the actual data (which even in the fixture files would have been a lot), we stubbed and mocked a small amount of information and were able to test the internal logic of the method quickly and easily. 

          2) an integration test that you are particularly proud of. Please include file name(s) and line number(s).
            
            team_stats_spec, line 28. 

            An integration test we are proud of is this best_season test that uses the actual games data but the game_teams fixtures-- we had to do this to make sure we had enough similar games to our game_teams. We added a number of CSV lines specific to teams 6 and 3 to make sure that there was a broad set of data to pull from, and then were able to test the method. 


      - Is there anything else you would like instructors to know?
        Hady: At every part of doing this project, I felt like I learned something that would have let me go back and do the project better from the start. Had I had enough time, I would have started my methods over again, honestly, and broken it down from the beginning into tiny helper methods that pulled one piece of information for each. In that way, I could have reused a lot of them for other methods this way. 
        
        Dawson: Looking back, there were a few methods that I know could have been refactored, and given more time would be something I would have done. ex: in the <.game_stats.rb> lines: 23 - 66. These methods could be broken down into helper methods, along with my use of enumerables.  A lot of my methods only used a .each where an enumerable such as .map would have made the code more readable and less "smelly". All in all, I learned a ton from my teammates, and really enjoyed my time on this project.

        
        Mel: I am fully aware I was not able to refactor methods using the most efficient enumerable yet the methods that are left were refactored from their original to include helper methods and I’m happy I was able to make that jump. Testing those helper methods was also a new concept for me and my teammates helped walked me through the use of mocks/subs in testing for them. Though this project is not the most beautiful/efficient code, I’m pleased with what we’ve been able to produce and learn throughout this process.


  ### Q & A
      (Include a minimum of 1 question from each group memember. Instructions will answer these during their feedback video.)
        Hady: I still feel shaky on class methods and how exactly it is utilized here. Before we did the refactoring, was it that we had one instance of stattracker only that held all of the hash information? And what about after the refactoring-- was it still one instance of stattracker that was holding all of the game, game_team, teams, methods? 
        Dawson: Does the way we set up the modules reflect the single responsibility priciple, or is it smelly code? When we memoized information for some module methods, the speed of our code actually reduced - was this implemented incorrectly? 
        Mel: Is there a more efficient way to parse the CSV data and deliver it to the desired classes? How can we mose effective use/call on memoized data to increase run speed? 



## Evaluation Readiness Checklist 
  ### Demonstration of Functional Completeness
      Display to the viewer the ability to start the program via the runner file, and demonstrate a few of the statistics that can be calculated.

  ### Technical Quality & Organization of the Code
      - At a high level (not line by line), describe how you broke out this application. 
          - What classes did you create? - What is the responsibility of each class? 
            <game.rb, team.rb, gameteam.rb>
                Three classes created objects from each line of the CSV data.
            <game_stats.rb, league_stats.rb, season_stats.rb, team_stats.rb>
                Four subclasses that housed the logic.
            <stats.rb>
                One superclass to parse out CSV data and deliver that to the subclasses.
            <stat_tracker.rb>
                One class to call upon all required methods.

        - Why did you choose to design your code in this way?
            The stat_tracker class was required. We decided to use inheritance/a superclass since we wanted to pass states to the subclasses. This allows all the subclasses to have all the same attributes. While working in different subclass files, we did not have to worry about only having partial access to the CSV data. 
            
            Following the DRY principle, we reviewed the methods is the different subclasses and identified which methods utilized the same helper methods. Then, by following the Law of Demeter, those similar methods were moved into modules with similar utility. As a result, this increases readability to hopefully achieve developer empathy.
        
      - Is there a design decision that you made that you’re particularly proud of?
        During It.2, we decided to organize all methods in the same order as the statistics page. Only the def/end + method name was written, separated by lines of ###'s. This small design choice helped us mitigate merge conflicts since we were all working on different methods but within the same file. 

      - Did you use inheritence and/or modules in your project? Why did you choose to use one over the other?
        This was detailed in previous answers. 

      - Were you able to implement a hash at some point in your project? If so, where? And why did you choose to use a hash instead of another data type?
        Hashes were used throughout our methods acting a accumulators since many of them used the <.each> enumerable. This is definately an area that (Dawson & Melony) recognize as an area for improvement. If more time were allotted to the project, this would definately be a major focus.


  ### Identifying Areas of Code that you Decided to Refactor
      - How did you identify areas of code to refactor? 
          - At a high level, how did you go about refactoring?
            The first step was identifying which helper methods that were repeated and aiming to remove the amount of times that method hit the CSV files directly. We refactored those methods to reduce the run time of the code. However, we are aware that additional refactoring is necessary, a specific example would be in the game_stats.rb file in lines 23-66. 

      - Are there other areas of your code that you still wish to refactor?
        Yes, as mentioned previously the <.each> enumerable was used throughout the code but we are aware that there are more efficient enumerables for a given action.


  ### Discussion of Collaboration/Version Control
      - What was your collaboration like in this group project? 
          - How was it different working in a larger group compared to pairs?
            Hady: Merge conflicts were a large problem and I do want to get better at that. Ultimately, we had to all go over the merges together on a shared screen and walk through each of them to make sure nothing was deleted. I do think that as I continue to work in a paired or group environment and we are working on similar sets of code, we will have to get better at moderating these. 
            Dawson: This was different in the sense that we had to be considerate of each others differing schedules and time zones. We had to ensure that the way we divided the work load was acceptable to all. With this project, communication was vital for our successful collaboration due to the fact that everytime we had to come together (ie. pull request/merge) our work needed to align with that of the team and the project.
            Mel: This was a different experience indeed, there were more merge conflicts to manage, more frequent updating to the group slack on what and in which documents we were working, and accomodating all of our different working preferences/styles. We allowed our individual strengths to guide us in how we broke down the work load and continued to encourage each other when were were frustrated, exhausted or just in a mood.

      - Were there any tools that you used to make collaboration easier?
        - Slack - utilized as our main source for communication. 
        - Notion - was an appropriate tool to track links; backup code (in case of loss); the TDR file; and general notes including SimpleCov, inheritance, and module information. 
        - Rainbow CSV extension (VSCode) - made reading the CSV data much easier.
        - Excell Viewer extension (VScode) - sort and organize CSV data in our fixture files which allowed us to create tests faster 
        - general VScode shortcuts - learning more of these reduced the amount of copy/pasta time and errors


  ### Discussion of Test Coverage
      - Run your test suite and open the coverage report from SimpleCov.
        Current Coverage: 1052 relevant lines, 1052 lines covered and 0 lines missed. ( 100.0% )

      - Show examples of unit and integration tests that you wrote. 
        Specifics were provided above, but generally speaking, the helper methods were tested as unit tests- mainly using mocks and stubs because of the nature of large data structures. 

        The integration tests can be seen in the tests of the methods that were listed on the Turing website for Iteration 2-- those tests are checking methods which generally rely on a number of smaller helper methods. 

      - Run the Spec Harness. What was it like using the Spec Harness for this project? How did it inform your design or testing choices?
        The spec harness was valuable for validating that our methods work with the entire CSV data rather than only the fixture data. For example, a test might pass when running a spec file against the fixture data but when running the harness against that same method a failure would occur. This notified us to the fact that the rounding of a float needed to be very specific or the expected result would be different. 


      



