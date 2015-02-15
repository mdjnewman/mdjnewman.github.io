---
title: 'ThoughtWorks LevelUp EXP Brisbane &#8211; Take 2'
author: mdjnewman
layout: post
permalink: /2014/05/thoughtworks-levelup-exp-brisbane-take-2/
categories:
  - Uncategorized
---
<figure id="attachment_378" style="width: 2048px;" class="wp-caption aligncenter">[<img class="size-full wp-image-378" src="http://mdjnewman.me/wp-content/uploads/2014/05/ThoughtWorks-LevelUp-EXP-Brisbane-May-2014.jpg" alt="ThoughtWorks LevelUp EXP Brisbane (May 2014) - Group Photo" width="2048" height="890" />][1]<figcaption class="wp-caption-text">LevelUp EXP Brisbane Attendees (thanks Alexandra Tran for the photo!)</figcaption></figure> 

ThoughtWorks ran another great express [LevelUp][2] event on Saturday at their Brisbane office. LevelUp events aim to <span style="color: #000000;">help students bridge the gap between university and their first full-time job. LevelUp EXP is a mini-conference with a number of talks and hands on sessions, as well as lots of opportunities to mingle with the ThoughtWorks employees and other attendees.</span> One theme that recurred through almost every talk of the day was focussing on the user at every stage of the development process &#8211; if you&#8217;re not building something that your users can use, then you&#8217;re wasting time. This does mean **users**, not customers. You can be building a product for a client, but it&#8217;s ultimately the user&#8217;s experience that will determine success.

## <span style="color: #000000;">Real Project Example: Domino&#8217;s HTML5 in Brisbane</span>

First up was Mark Ryall ([@markryall][3]) discussing the recent consolidation of three separate websites into a single HTML5 site for the Dominos pizza franchise in Australia, New Zealand and the Netherlands. The new site was to replace separate Flash, mobile and accessibility-focussed sites, and was a greenfield project. From a software process perspective, the project kicked off with a two-week inception where BAs, developers, designers and testers worked together for two weeks to get initial requirements worked out. Mark pointed out that this is an effective alternative to the business struggling to work out requirements on their own for six months before getting anyone else involved. It reminded me of the quote that&#8217;s often attributed to Henry Ford:

> If I’d asked people what they wanted, they would have said a faster horse.

The point is that the business doesn&#8217;t always know what they want, and even if they do, they may not be able to articulate that in such a way that both parties have the same vision. The rest of the project ran in two-week iterations, with showcases at the end of every iteration. Mark mentioned that the biggest challenges (from a technical perspective) in this project were internationalisation (I18N) and localisation. As Mark explained it, internationalisation ensures everything is available in the correct languages for the correct region, whereas localisation focusses on differences such as different address formats (another example of what this site in particular has to handle is that Domino&#8217;s in NL doesn&#8217;t provide catering, like it does in AU). There was a heavy emphasis on test automation in this project, and [Selenium WebDriver][4] was used for automated browser testing. WebDriver allows single tests to be written to target more than one browser, and are more robust than trying to guess what the browser is doing and interspersing your tests with loads of sleep() calls. In order to make tests more readable for everyone on the project (BAs/the business included), [Specflow][5] was used. Specflow is a .NET alternative to Cucumber, and uses a similar declarative style to define specifications & expected behaviour. Tests are then generated from these easy to read specifications, targeting whichever testing framework you&#8217;re using (NUnit in this case). Given this site was replacing an existing site with a focus on accessibility, Domino&#8217;s required this site to be just as accessible for people using screen readers and keyboard only navigation. Accessibility is something that is easy to overlook, but every developer should make the effort to do these things correctly (using alternative text, [ARIA tags][6], skip links for navigation etc). If you want to know more about how important accessibility is, Scott Hanselman recently did an [interesting interview with Katherine Moss][7], a blind software technician.

## The Lego Game

The Lego Game is a game designed to give you a taste of the Agile software development process.  Our task was building a Lego &#8216;animal&#8217; with a client in mini sprints lasting a few minutes each. We worked through everything from estimation to a retrospective in less than ten minutes, and completed three iterations with a client who wasn&#8217;t afraid to change their mind. An interesting resource that was mentioned by the ThoughtWorks employees running the Lego game was the Retrospective Prime Directive by Norman Keith:

> Regardless of what we discover, we understand and truly believe that everyone did the best job they could, given what they knew at the time, their skills and abilities, the resources available, and the situation at hand.

I thought this was a good guideline for running retrospectives, as it ensures that you focus on what went well and what can be improved, and not on trying to assign blame. There are [plenty of pages][8] describing the agile Lego game on the net if you want to read more.

## <span style="color: #000000;">Agile 101 with a Business Analyst</span>

Agile 101 with a BA by [Henry Lawson][9] was the first of the twenty-minute lightning talks for the day. In twenty minutes, Henry managed to cover a brief history of Agile, the Agile manifesto and different Agile methodologies. There was more about Agile on the cards but the twenty-minute timeline had to be adhered to! The following paragraphs sum up the main points of the talk.

**Agile manifesto**: the [Agile manifesto][10] is what gave the movement towards iterative, lightweight processes a name. Written in 2001 by several prominent figures in the software industry, the core of the Agile manifesto is the following four points:

  * <span style="color: #000000; font-size: medium;">Individuals and interactions </span><span style="color: #000000; font-size: small;">over processes and tools</span>
  * <span style="color: #000000; font-size: medium;">Working software </span><span style="color: #000000; font-size: small;">over comprehensive documentation</span>
  * <span style="color: #000000; font-size: medium;">Customer collaboration </span><span style="color: #000000; font-size: small;">over contract negotiation</span>
  * <span style="color: #000000; font-size: medium;">Responding to change </span><span style="color: #000000; font-size: small;">over following a plan</span>

**The differences between traditional Waterfall methodologies and Agile**: The waterfall model is a sequential design process, where each stage is completed and locked-down before the next is started.<figure id="attachment_360" style="width: 800px;" class="wp-caption alignnone">

[<img class="size-full wp-image-360" src="http://mdjnewman.me/wp-content/uploads/2014/05/Waterfall_model.png" alt="Waterfall Model of System Development " width="800" height="595" />][11]<figcaption class="wp-caption-text">Waterfall model of system development &#8211; avoid it! (you want the cycle above to take two weeks, not twelve months) ([source][12])</figcaption></figure> 

While waterfall might work for other engineering projects (like building a bridge), it&#8217;s not really suitable for software development (too many software projects have elements of a [wicked problem][13]). I won&#8217;t go into the benefits of Agile or Agile processes in too much detail here, as there is plenty more information available.

**Different agile methodologies**: Examples of agile methodologies include Scrum, Kanban, Lean, XP and Crystal Clear. The main difference between these methodologies is the practices, such as daily Scrum meetings or pair programming in XP. The general processes are similar, and there is no reason you can&#8217;t mix and match.

## <span style="color: #000000;">Functional Programming</span>

Hugo Firth ([@hugo_firth][14]) was giving the next lightning talk, this time with a quick intro to functional programming concepts. There are a number of programming paradigms, such as procedural and object-oriented (OO). Procedural code (e.g. C/BASIC code) doesn&#8217;t provide many ways to create abstractions and manage state. OO, such as you&#8217;ve probably encountered in Java/C#/C++ allows abstractions to hide global state. Functional programming on the other hand is all about removing state where possible, and programming with pure functions. Hugo went through some common functions you&#8217;ll meet in functional programming, such as map & filter by providing some simple examples in Clojure. If you want to see a less rushed presentation by Hugo, his recent talk at the Brisbane Functional Programming Group is available on Vimeo.



[BFPG][15] is a great community if you&#8217;re looking to learn more about functional programming &#8211; I&#8217;ve always found everyone there to be extremely willing to help.

## <span style="color: #000000;">Working in different environments&#8230; from Heaven to Hell</span>

The last lightning talk in the first session was by Claudia Ferreira ([@claudia_onfire][16]), providing some practical advice for dealing with difficult work environments. You shouldn&#8217;t assume that the end of uni is the end of the hard work. Starting a new job, meeting new people and adapting to company culture is just as hard. Also, you don&#8217;t want to fall into the trap of thinking that you know everything and that you can stop learning. There is an almost endless variety of work environments, some good and some not so great. Claudia showed the following clip from The Matrix and told us about a time she was in this exact position.



Claudia&#8217;s boss basically said you&#8217;re here to work, not think, and there are hundreds of people who can fill this spot if you aren&#8217;t happy with that. Hopefully you won&#8217;t find yourself in a situation this extreme, but chances are you&#8217;ll have a boss you&#8217;re not overly excited about working with at some point in your career. If you find yourself in this situation, don&#8217;t just bottle it up and say nothing. Your team is there to help, you should be able to trust them and speak to them about issues. It&#8217;s important to have a good relationship with your team, as they&#8217;re the people that you spend the majority of your day with. So don&#8217;t stress if you&#8217;re confronted with a difficult situation, just take a deep breath, speak up if you really don&#8217;t agree and be the bigger person.

## <span style="color: #000000;">The Way of the Consultant</span>

[Sarbashrestha Panda][17] has been a consultant for 5-6 years, working as an analyst and project manager on many projects. There are many types of consulting, from technical to business strategy. Technical consulting still has a strong focus on the business needs, no matter what area you&#8217;re in you are helping solve a problem the business is having. As Panda explained it, the role of the consultant is to always ask the difficult questions and have the difficult conversations. You want to make a problem visible, make people think and help to implement solutions. As a consultant, your knowledge should drive change.<figure id="attachment_364" style="width: 600px;" class="wp-caption aligncenter">

[<img class="wp-image-364 size-full" src="http://mdjnewman.me/wp-content/uploads/2014/05/rhino_painting.jpg" alt="Rhinoceros painting" width="600" height="483" />][18]<figcaption class="wp-caption-text">Most problems are people problems &#8211; recognise that everyone has a different perspective ([source][19])</figcaption></figure> 

If you&#8217;re working as a consultant, embrace the opportunity to work on many different projects &#8211; you can&#8217;t develop a broad skill set without experience. You can be a consultant in any language with any technology, and after a few years should develop the skills to become a consultant for a specific domain. Don&#8217;t let yourself get cornered into a specific technology &#8211; technologies change far too fast.

## <span style="color: #000000;">UI Dev. What and Why?</span>

Eru Penkman gave the next talk, which was originally entitled &#8216;UI Dev. What and Why?&#8217;, but seemed to have transformed into a talk about programmer culture and day-to-day life. Eru pointed out a bunch of things that a lot of programmers/developers have in common. Most of the people in the room had read XKCD at some point, everyone had used Stack Overflow, lots of people read similar blogs etc. Having all these elements in common helps when working in a team, which as Eru pointed out is pretty much what development is about. It&#8217;s very rare to have a project where you don&#8217;t interact with a number of people throughout the day. There are plenty of resources for developers, as everyone uses Stack Overflow it means that SO can answer almost any question, and lots of problems you might want to solve have already been solved by one open source project or another. However, don&#8217;t just consume these resources &#8211; make accounts on SO/GitHub and start contributing!

## <span style="color: #000000;">What they didn&#8217;t tell you about Testing!</span>

> Do not assume anything. Ever.

The final lightning talk for the day was by Leonor Salazar & Brian Mason, covering testing and quality. The first point that Leo & Brian drilled home is that quality is subjective. Everyone has different ideas of quality, and you can&#8217;t do much meaningful testing without knowing what quality means for your project. Quality as defined by the users of the product is the most important. Everyone on a project should be thinking about quality, it&#8217;s not something that one person can &#8216;add in&#8217; at the end. There is also a simple and compelling economic argument for having quality on everyone&#8217;s mind: it&#8217;s up to 1000x times more expensive to fix a bug in production than it is in analysis. Don&#8217;t let that cripple you or force you into a big-design-up-front type approach, but keep quality at the front of your mind.

> Development is solving problems, testing is asking questions.

You need to ask yourself four questions:

  * Are we doing the right things?
  * Are we doing the things right?
  * Are we getting them done well?
  * Are we getting the benefits?

There is no point obsessing over whether you&#8217;re doing things right if you&#8217;re not doing the right things! Testers also have the opportunity to improve process, and take the product in new directions.

## User Testing what you Build &#8211; Hands On Session

Carrying on with the theme of user first was Pete Chemsripong, with a hands on session where each team had to develop a &#8216;product&#8217; that was then tested by a user. For example, a media remote control for a user with boxing gloves on or a lift control panel for someone carrying 15 bags of groceries. To design a good user experience, you need to ask why you&#8217;re building anything in the first place. You need to understand why people would use this product. Ultimately the answer to a question like &#8216;What makes Google better than Bing?&#8217; is always that it offers a better user experience and satisfies the users needs. It doesn&#8217;t matter what you build or how you build it if people don&#8217;t enjoy using it. User testing also doesn&#8217;t have to be expensive. You can even grab a dev from another team who hasn&#8217;t touched your project. Chances are they&#8217;re going to find a lot of the same issues as a &#8216;real&#8217; user of the software, allowing you to pick the low hanging fruit for minimal cost. Pete showed a video from a recent ThoughtWorks experiment, where an [in-store innovation lab at a Woolworths][20] store produced loads of great feedback in a very short time. The other ThoughtWorkers present mentioned [Usability Testing with Morae][21] as a good read for more information about inexpensive usability testing.

## TDD &#8211; from woe to go in 10 minutes &#8211; Hands On Session

> As professional developers, the burden of proving a system works lies with us.

Steve Morris held the floor for the final session of the day, and did a great job showing everyone how simple test driven development can be. TDD provides the following benefits:

  1. Shows the code does what you say it does
  2. Improves quality by making code more testable
  3. Allows you to figure out what to test only once &#8211; no more writing a monolithic class/function and then spending time working through what needs to be tested over and over
  4. At any time, you can see what is broken and whether your code is shippable (as there is never code that isn&#8217;t covered by tests)

> TDD is coding with intent &#8211; don&#8217;t code by accident.

The &#8216;test&#8217; in TDD could just as easily be replaced by &#8216;expectation&#8217;, &#8216;behaviour&#8217;, &#8216;specification&#8217; or &#8216;intent&#8217;. It&#8217;s as much about helping to define expected behaviour and a minimal specification as it is about testing actual code. It doesn&#8217;t matter if you&#8217;re a developer or not, TDD provides the same benefits to BAs, managers and QA testers. I couldn&#8217;t write this post without including the TDD mantra, lest Steve think we all learnt nothing at all from the talk. The TDD mantra is as follows

  * Red &#8211; write a minimal failing test
  * Green &#8211; write the minimum amount of code to make the test pass
  * Refactor &#8211; incrementally refactor the code (both code under test **and** the tests themselves &#8211; test code is first class code!)

Writing tests before code forces you to think about naming, architecture, APIs and design without considering implementation details. This helps with design and forces us to progress with intent, to avoid building unnecessary features. The refactor step encourages design improvements in incremental steps, rather than writing a bunch of code and then struggling through a &#8216;big bang&#8217; refactor later in the project. Failing tests are not a failure of any kind, rather, they are statements of intent. The minimal failing test doesn&#8217;t even have to compile. A test that doesn&#8217;t compile signifies an intent to write the code to make it compile. In this way tests are documentation of future intent as well as progress to date. The hands on component of this talk included getting testing environments for C# and Node.js set up and writing our first code using TDD. Set-up for C# is as simple as installation of a testing framework like NUnit, which in a newer version of Visual Studio is as easy as running

<pre>Install-Package Nunit</pre>

in the package manager console. The set up for Node.js was just as simple, with npm installed simply run

<pre>npm install karma
npm install phantomjs
npm install jasmine</pre>

from your favourite shell. In the talk, it was possible to get this environment set up and have our first test running in under ten minutes for each environment. There really isn&#8217;t any excuse for not giving TDD a try! Steve also pointed out that TDD (like most concepts in software development) [isn&#8217;t as new as you might think][22].

* * *

The second LevelUp EXP event in Brisbane was eye-opening, and I think the attendees learnt a lot to complement what is taught at university. If you attended/presented and I&#8217;ve omitted anything, please let me know and I&#8217;ll fix it up. My post about the first Brisbane LevelUp event is [here][23], and more about ThoughtWorks LevelUp can be found on Twitter (<a style="color: #bc360a;" title="LevelUp on Twitter" href="https://twitter.com/TW_LevelUp">@TW_LevelUp</a>) and <a style="color: #bc360a;" title="ThoughtWorks Level Up" href="https://www.facebook.com/ThoughtworksLevelUp">Facebook</a>.

 [1]: http://mdjnewman.me/wp-content/uploads/2014/05/ThoughtWorks-LevelUp-EXP-Brisbane-May-2014.jpg
 [2]: http://levelup.thoughtworks.com/ "LevelUp"
 [3]: https://twitter.com/markryall "Mark Ryall (markryall) on Twitter"
 [4]: http://docs.seleniumhq.org/projects/webdriver/ "Selenium WebDriver"
 [5]: http://www.specflow.org/ "Specflow - Cucumber for .NET"
 [6]: https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA "ARIA - Accessibility | MDN"
 [7]: http://www.hanselminutes.com/413/im-a-blind-software-technician-ask-me-anything-with-katherine-moss "I'm a Blind Software Technician - Ask Me Anything! with Katherine Moss"
 [8]: https://www.google.com.au/search?q=agile+lego+game "agile lego game - Google"
 [9]: https://henrylawson.net/ "Henry Lawson: Home"
 [10]: http://agilemanifesto.org/ "Manifesto for Agile Software Development"
 [11]: http://mdjnewman.me/wp-content/uploads/2014/05/Waterfall_model.png
 [12]: http://en.wikipedia.org/wiki/File:Waterfall_model.svg "File:Waterfall model.svg"
 [13]: https://www.wickedproblems.com/1_wicked_problems.php "Wicked Problems: Problems Worth Solving"
 [14]: https://twitter.com/hugo_firth "Hugo (hugo_firth) on Twitter"
 [15]: http://www.meetup.com/Brisbane-Functional-Programming-Group/ "Brisbane Functional Programming Group (BFPG) (Brisbane)"
 [16]: https://twitter.com/claudia_onfire "claudia ferreira (claudia_onfire) on Twitter"
 [17]: http://vizualize.me/panda#.U2bXgfmSzOM "vizualize.me - Sarbashrestha Panda"
 [18]: http://mdjnewman.me/wp-content/uploads/2014/05/rhino_painting.jpg
 [19]: http://alligator-sunglasses.com/post/8929519267/poor-rhinoceros "Poor Rhinoceros"
 [20]: http://www.thoughtworks.com/clients/woolworths "Woolworths | ThoughtWorks"
 [21]: http://www.joelonsoftware.com/articles/UsabilityTestingwithMorae.html "Usability Testing with Morae by Joel Spolsky"
 [22]: http://arialdomartini.wordpress.com/2012/07/20/you-wont-believe-how-old-tdd-is/ "You won’t believe how old TDD is"
 [23]: http://mdjnewman.me/2013/10/levelup-exp-brisbane/ "ThoughtWorks LevelUp EXP Brisbane"