---
layout: post
title: The Rise of the Machine Learning Industry
tags: [machine learning, programming, opinion]
comments: true
---

There is a new industry being built in the tech world. Not many may be aware of the explosion of interest in machine
learning, but most may have heard of its recent high profile applications: Google's
[Self Driving Car](http://www.citylab.com/tech/2014/05/the-trick-that-makes-googles-self-driving-cars-work/371060/)
project,
Apple's [Siri](https://backchannel.com/an-exclusive-look-at-how-ai-and-machine-learning-work-at-apple-8dbfb131932b#.obz2q29ft),
IBM's
[Watson on Jeopardy](http://www.nytimes.com/2010/06/20/magazine/20Computer-t.html?hp).
It's silently been applied to a lot of things we use on a
daily basis, such as doing a
[web search](https://en.wikipedia.org/wiki/Learning_to_rank),
getting
[recommendations for movies](https://en.wikipedia.org/wiki/Recommender_system)
to watch, viewing
[personalized feeds](https://code.facebook.com/posts/1072626246134461/introducing-fblearner-flow-facebook-s-ai-backbone/)
on social networks, it's even embedded deep in your
[phone's processor](http://www.theregister.co.uk/2016/08/22/samsung_m1_core/).

What is machine learning? How did this happen?
And what does the future look like for us in this new world? I will dive into these questions from my prior experience
and from active research as well as make some predictions. This is largely an opinion essay, especially regarding my
predictions, although I've tried my best to add citations.

## A brief overview
Machine learning, despite its recent popularity, is not a new technology.
It has roots back to the early 1950s, along
with computer science as a theoretical field. Alan Turing, who's name has been immortalized with the concept of the
[Turing Test](https://en.wikipedia.org/wiki/Turing_test),
was one of the
[first pioneers into the field](http://mind.oxfordjournals.org/content/LIX/236/433).
Another pioneer in the
field was Arthur Samuel, who designed the world's first machine learning application: a program that could learn to play
chess. It was Samuel who also first proposed a definition of machine learning:

> Machine Learning is a field of study that gives computers the ability to learn without being explicitly programmed.

Concretely and in layman terms, machine learning can be viewed as a computer program that learns to make predictions
about what to do given lots of previous examples. It learns the patterns of data and builds rules based on the patterns.
This often comes in the form of making estimations about things, classifying information or discovering anomalies. For
example, a machine learning program could learn to play chess by looking at all the moves expert chess players have
previously made at various points in a chess game and then making best estimations of future moves in game based on
what it learned about each situation. Here's also a wonderful
[visualization of how machine learning works](http://www.r2d3.us/visual-intro-to-machine-learning-part-1/).

So if machine learning is nothing new, why has it suddenly become interesting? This is the result of two
major recent advancements...

## The turning point

In the past, machine learning was usually
[limited by computing constraints](https://blogs.nvidia.com/blog/2016/07/29/whats-difference-artificial-intelligence-machine-learning-deep-learning-ai/),
such as processing power and memory. Machine learning was impractical when
compared to alternative methods, and these methods were deemed good enough, so the field did not progress. Without companies
willing to experiment on machine learning systems, research stalled. However, technology has caught up in recent times
with improvements in hardware and as computing has moved to the cloud.

Machine learning has another problem: to learn, we must have data. Lots of it. It's from that data we can find patterns
and make good predictions. This is often called the
[cold start](https://en.wikipedia.org/wiki/Cold_start)
problem. Most companies rarely had the technical capabilities nor the resources to collect the amount of data needed to
solve this problem.

Recently we've seen the field of big data take off. Companies, such as Facebook and Google, have been
[hording data](https://en.wikipedia.org/wiki/Datalogix). Data storage, which once was costly, has been
[falling sharply](https://techcrunch.com/2014/08/20/cloud-storage-is-eating-alive-traditional-storage/)
in price and again cloud services have made storage accessible to those without the
capital requirements to invest in data centers.

The progression in hardware, cloud computing and data collection has become the
[turning point](http://a16z.com/2016/06/10/ai-deep-learning-machines/)
for machine learning. With
the basic elements needed for machine learning becoming more accessible, machine learning research has flourished. And
large tech companies have become incubators for further research to stay ahead of their competition.

Many machine learning discoveries still remain buried in publications, as this hot field churns out innovations. Over
time, these publications will be implemented in real environments and also commoditized which will lead to a new
industry.

## A new industry is born

Machine learning innovations lead to a myriad of applications across many domains. Although it is still an active field of
research as of 2016 and machine learning is not a
[magic solution to all problems](http://smerity.com/articles/2016/ml_not_magic.html),
there are many
practical usages for it today. For example, for insurance, it can be used to make predictions on the likelihood of
insurance claims, for banks, it can be used for predicting defaults, for healthcare, it can be used by medical professionals to help
diagnose an illness, for governments it can be used to discover radicals, for education it may be used to make predictions on
grades. Some of these applications are just becoming realized and others haven't even crossed the minds of those who
will actively be using it in the future.

Businesses will quickly learn that their data is a valuable currency in building machine learning systems.
Those with the most useful data will have a potent edge over their competitors. SaaS companies already have a head start.
For example, ZenDesk has
[recently begun applying machine learning](http://www.computerworld.com/article/2990197/enterprise-applications/zendesk-taps-machine-learning-for-its-satisfaction-prediction-tool.html)
to their client's data to make predictions
on the likeliness of their client's customer's satisfaction.

As the limitations of machine learning research is pushed, we will undoubtedly find an upper limit to its usefulness.
But for now, untapped experiments and potentially drastic outcomes lay the seeds for excitement in ML's potential.

## Predicting the future

When I was in college, machine learning wasn't being taught to computer science undergraduates. Many of my peers have
graduated without much in the way of an idea of how machine learning works let alone how to use it. Now many schools
are offering machine learning classes in their computer science programs. Indeed, those with a background in data
analytics, statistics or just recently graduating from computer science programs are likely to have a ready advantage.

As machine learning research starts to be applied in the real world, we will see it become more approachable to
outsiders. Publications will turn into educational materials, generalized and specialized machine learning services
will cater to less technical businesses, tech companies will develop tools to make it easier to write machine learning
systems, new consultancies will be born.

I predict a new type of technical role, similar in the vein of an IT, DevOps, security consultant, web developer or
mobile developer:

**The ML Developer**

Soon recruiters from all over will be scanning resumes for keywords related to machine learning, deep learning, neural
networks, TensorFlow, etc. This developer's job will be to interface with data analysts (or substitute them) to perform
duties in employing machine learning libraries, engineering ML models for production environments, building the
facilities to run experiments and caching prediction results, amongst all other kinds of duties.

Over the next 5 years, I suspect this new industry will likely grow to be as big, if not much larger, than the other
aforementioned industries given the diversity of applications.

In the long term, machine learning could greatly offset previous manual work of many types of jobs, including those of the
developer, who may have to write less software as machines learn how to do it themselves. The ramifications of
artificial intelligence, or technology in general, its displacement of jobs, and
[possible solutions](https://blog.ycombinator.com/moving-forward-on-basic-income)
is an active socio-economic topic for many in my industry.

## Wrapping up

In many ways, machine learning is an exciting new topic that will soon become on the minds of many and creating new
value for those who are the most ready to adopt it. It has seen its
strongest growth in recent years, given a cascading series of technological windfalls that has opened the doors for
its use. A new industry will be born from it that I predict will create tremendous amounts of wealth for some,
change the landscape of businesses, create new jobs while likely largely reducing work for others. A new, different
world awaits us.

