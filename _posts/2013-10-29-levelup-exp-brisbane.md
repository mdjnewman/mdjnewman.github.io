---
title: ThoughtWorks LevelUp EXP Brisbane
author: mdjnewman
layout: post
categories:
  - Uncategorized
---
On Saturday I was lucky enough to attend [ThoughtWorks LevelUp EXP][1] at the ThoughtWorks Brisbane office.

As well as plenty of opportunities to chat with the ThoughtWorkers (and Chad!) who kindly gave up their Saturday, there were six presentations throughout the day:

## Opening Keynote: Design Thinking

Ben Melbourne ([@benmelb][2]) set out to teach us about design thinking, and how it’s important for any project. The main points that I took away from his talk were:

  * Visual design is only a small part of design.
  * UX research is not strictly academic or scientific – iterate quickly and rely on feedback to get the best results in the shortest time.
  * Embrace constraints to get the most out of a situation. Design is harder when you have a green field to work in – if you have constraints, don’t fight against them, use them for inspiration.
  * Everyone is a designer – if you’ve ever been on a project without a designer, it was you.
  * Always ask if the current approach is the best use of business capability.

## Functional Programming for Fun and Profit

Next up was James Ottoway ([@jms\_][3]) with a good intro to functional programming. He started out by explaining declarative languages and reactive programming, as well as DSLs and closures and how they can be used to cut complexity.

Declarative languages focus on expressing the logic of a computation, not how to carry out that computation. Regular expressions, Chef/Puppet configuration files, and SQL were all used as examples of declarative languages. In James’s words:

> We’re expressing what, not how. And that’s a good thing.

Expressing what you want to do (and not how it must be done) frees up the compiler/interpreter to make decisions about implementation at runtime, and eases the burden on you as a programmer.

When talking about reactive programming, James used Excel (everyone’s favourite spreadsheet application) as an example of a reactive program. This is a really simple analogy which I think helped everyone grasp the idea of reactive programming quickly. He also pointed out that the windows GitHub client is built using reactive programming (using [ReactiveUI][4] from what I can see).

As someone who’s trying to learn Haskell at the moment, this section about of this talk about closures was interesting to me. Closures aren’t something that I was seeing in Haskell, perhaps because I’m still battling with unfamiliar syntax (turns out they’re pretty much everywhere). A closure is just a function together with a referencing environment, and they’re pretty essential for functional programming.

## Business Analysis

After lunch we heard about the life of a BA from Cathie Hagen ([@catherist][17]) and Jiangmei Kang. BAs are an integral part of every stage of a project, and use their place as a bridge between the client and the developers to ensure that value is delivered to the client. The following is a photo I took of the board used to explain the many aspects of work as a BA, I think it says more than I can:


{% include figure.html src="/public/images/2013/10/TW-LevelUp-Business-Analysis.jpg" alt="TW LevelUp - Business Analysis" caption='(Sorry about the poor quality – the projector turned on for the next talk just as I was taking this picture)' %}

## User Testing

> Why build something that people don’t want to use? It’s 2013, doing that is a waste of humanities potential.

Pete Chemsripong gave a great talk about the importance of user testing. Speed is important for user testing and ideally
should be a daily thing. Every feature that you’re working on in a project should be validated by a user (this agrees
with what Ben said in the design talk).<br /> 

## Helping you get your first job

The last presentation before the keynote was by Jean D’amore ([@jeandamore][5]) with an entertaining talk on how to land your first job in IT. The talk introduced job hunting as a game where you can’t control everything, but what you can control can make all the difference. He split the journey into seven steps, each accompanied by a great movie reference & quote. Hopefully the slides will be made available as I didn’t get everything down, but what follows is my summary:

  1. Yourself (The Last Samurai) 
      * Improve the environment by working on yourself.
      * Do: know your boundaries, be versatile, stretch yourself, maintain balance, listen, commit to projects, be willing to sacrifice, learn/do new things
      * Don’t: underestimate yourself, thing you’re alone, deny the challenge, limit the horizon
  2. The Search (An Unexpected Journey) 
      * The search will change you
      * Do: know what you seek, choose a domain, know the employer, ask about graduate programs/training, keep your LinkedIn (and internet presence in general) up to date, favour simple job ads (i.e. not ads that list every skill under then sun – you often need to be a specialist before you can generalise)
      * Don’t: dismiss too quickly, use recruitment agencies, work on projects you don’t agree with (everything you do has an impact and will impact you), waste too much time searching on-line (do spend more time talking to people)
  3. Your CV (The Colour of Money) 
      * Do: PDF it!, make it unique, know what’s on it, web design it (use web design principles – e.g. readability, don’t cram everything in), make it one page, get friends to read it, start with skills over education
      * Don’t: lie/exaggerate, rush it, use ‘[bullshit bingo][6]’ words (except in a few cases where it’s in the ad – in this case, always explain and give examples)
  4. Applying (Close Encounters of the Third Kind) 
      * You need to understand and be understood
      * Do: strike with precision, add a cover letter, apply to people (not computers), customise your CV, wait, follow-up, be organised
      * Don’t: bulk apply (do apply to at most 5 organisations at once – it becomes too hard to keep track of what you’re doing otherwise)
  5. Interviews (Gattaca) 
      * Little things are often the most important. For example, be good to everyone at the company.
      * Do: look clean and tidy, research the company & their interview process, arrive early, know who you are and why you’re there, know what you’ll be asked, listen, ask relevant questions, be humble and curious, know your stuff (especially your résumé)
      * Don’t: be afraid to ask for clarification, lower your guard until you’re clear of the building (i.e. do treat every moment you’re in/near their offices as part of the interview), ask how you did at the interview, ask about time/money when you’re after your first job, leave your phone on, have alcohol (even if offered), go if you’re sick (you need to be 100%, and the interviewers will understand)
  6. Hearing Yes/No (The Hurricane) 
      * Don’t be afraid of failing and keep bouncing back
      * Do: take your chance to explore/re-evaluate, take risks, trust your instinct, understand that this is one step is a career
      * Don’t: burn bridges, take it personally, rush to accept, say you’re waiting on another offer
  7. First Day (City Hall) 
      * Make a difference and work where you’re satisfied. Focus on employers that give you the upper parts of [Maslow’s hierarchy of needs][7]
      * Do: learn names, go to social events, pair, do what you’re told, be helpful, learn the ropes step by step, leave if you don’t like it after a month of so
      * Don’t: panic, try to change things quickly, cold shoulder anyone

## Closing Keynote: Who are you, where are you going, and how will you get there?

The closing keynote by Chad Renando ([@ChadRenando][8]) followed on nicely from the presentation from Jean, and was really a step back, focussing on making the most of who you are, being clear about where you are going, and being intentional about how you can get there.

> Every man invents a story for himself – which he often, and with great cost to himself – takes to be his life.

Chad used this quote from Max Frisch as a way of explaining that you create your own story, but you should never think that it can’t be changed or even completely rewritten.

You need to understand yourself to understand how you will work with others – are you more practical or creative? Do you approach things in an analytical way or listen to your beliefs? Are you structured or flexible? Learn what your [signature strengths][9] are and use those to create a mission statement, as your strengths are the things that make you feel alive. At the same time, look out for the strengths that you rank poorly in.

Create goals (what is your 9-day plan? your 120-day plan?) that align with your strengths, but don’t think that these goals are set in stone. Use goals as a way to direct yourself, not as measures of success. This allows you to iterate on your goals and improve them as you learn more about yourself.

Chad finished the main part of his talk with his axioms from life in a digital studio:

  * Ask questions
  * Focus on resolving process conflict, not relationship conflict
  * There are things that are understandable, but not acceptable – don’t get the two confused
  * Everyone is generally doing the best they can
  * There is no fault, only cause
  * Every conversation we have is with ourselves, and sometimes they involve others
  * If you want to lead others, lead yourself

* * *

The day covered a range of topics and gave me a lot to think about. One point that appeared a couple of times throughout the day (and which Chad reiterated at the end of his keynote) is how important it is to get involved with your community. It allows you to grow your network, get references and learn. I can’t agree more, I have learnt so much and met lots of interesting people by attending the [YOW! conference][10], [YOW! nights][11], and the [BFPG][12] & [Brisbane GPU Users][13] meetups (there are tons of similar user groups in Brisbane – I guarantee you won’t regret attending one of their meetups!). Another way to get involved in the broader community while sharpening your skills is volunteering – there are plenty of non-profits that could use help with IT. Or, if you have an idea/are working on a start-up, [River City Labs][14] is building an amazing community of like-minded people.

Thanks again to ThoughtWorks for running this mini-conference – you’ve done a great job of inspiring this IT undergrad! More about ThoughtWorks LevelUp can be found on Twitter ([@TW_LevelUp][15]) and [Facebook][16].

 [1]: http://levelup.thoughtworks.com/brisbane/ "ThoughtWorks LevelUp EXP Brisbane"
 [2]: https://twitter.com/benmelb "Ben Melbourne (benmelb) on Twitter"
 [3]: https://twitter.com/jms_ "James Ottaway (jms_) on Twitter"
 [4]: http://www.reactiveui.net/ "ReactiveUI"
 [5]: https://twitter.com/jeandamore "Jean D'amore (jeandamore) on Twitter"
 [6]: http://dilbert.com/strips/comic/1994-02-22/ "Dilbert comic strip for 02/22/1994"
 [7]: http://en.wikipedia.org/wiki/Maslow's_hierarchy_of_needs "Maslow's hierarchy of needs"
 [8]: https://twitter.com/ChadRenando "Chad Renando (ChadRenando) on Twitter"
 [9]: http://www.authentichappiness.sas.upenn.edu/aiesec/content.aspx?id=821 "VIA - Inventory of Strengths"
 [10]: http://yowconference.com.au "YOW! | Australian Developer Conference"
 [11]: http://yowaustralia.com.au/general/yownights.html "YOW! Nights"
 [12]: http://www.meetup.com/Brisbane-Functional-Programming-Group/ "BFPG"
 [13]: http://www.meetup.com/Brisbane-GPU-Users/ "Brisbane GPU Users (Brisbane ) - Meetup"
 [14]: http://www.rivercitylabs.net/ "River City Labs"
 [15]: https://twitter.com/TW_LevelUp "LevelUp on Twitter"
 [16]: https://www.facebook.com/ThoughtworksLevelUp "ThoughtWorks Level Up"
 [17]: https://twitter.com/catherist "Cathie Hagen (catherist) on Twitter"
