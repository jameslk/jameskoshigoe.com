---
layout: post
title: Self-documenting code
tags: [programming, opinion]
comments: true
---

Once upon a time when I was a wee lad, I was taught a good programmer should comment their code thoroughly. It was
explained to me that someday, another (unfortunate) programmer will have to look at my code and make sense of it. Or
even I may have to make sense of my own stale, dilapidated code after months or years of neglect. Thus to aid future
maintainers of my code, comments should be placed strategically to explain what my code is doing. And so, without
questioning it, I ladened my code with comment after comment, [JavaDoc](http://en.wikipedia.org/wiki/Javadoc)
statements and PRE/POST conditions abound, until
there was more comments filling my code than code itself. It was tedious, but I was told it was the right thing to do,
and given better grades when I did it. I smiled upon my creation of clean, well-documented code. For
I had done a job well done as the disciplined programmer I had become.

As I wrote more and more software, whether for fun or profit, I found this cumbersome routine too difficult to maintain
and unnecessary. The evolution of my coding style has seen the shedding of comments. What happened?
Have I become a sloppy programmer? No, in fact, I have become a *better* programmer. I learned the great art of writing
clean, [self-documenting](http://en.wikipedia.org/wiki/Self-documenting) code.

### Comments considered harmful

Comments are nice, and when used appropriately (which I'll get to later), are very helpful. But comments for the sake
of documenting code have become something of a code smell for me. If you have to write comments for your code, this
could either mean one of two things: your code has likely become unreadable or the language you're using is unreadable.
Worse yet, comments can be harmful to the maintainability of code. They can lead to bad practices, document outdated
information or outright tell a lie. When multiple developers must maintain a codebase, there's no guarantee they will
maintain the comments as well.

Let's consider a few example pieces of code and see how this can get ugly:

#### Exhibit A: An unreadable wall of code, with comments

{% highlight php %}
// Use reservations to modify availability
foreach ($p['Reservation'] as $r) {
	if ($r['status_code'] != 'Cancelled') {
		// Set start date as incoming unless already outgoing, then out/in
		if (isset($days[date("Ymd",strtotime($r['StartDate']))]) && isset($days[date("Ymd",strtotime($r['StartDate']))]['status'])) {
		if ($days[date("Ymd",strtotime($r['StartDate']))]['status'] == 'outgoing') $days[date("Ymd",strtotime($r['StartDate']))]['status'] = 'unavailable';
		else $days[date("Ymd",strtotime($r['StartDate']))]['status'] = 'incoming';
		}

		// Loop through days until end day
		$cd = strtotime(date("Y-m-d",strtotime($r['StartDate'])) . ' 12:00:00');
		$ed = strtotime(date("Y-m-d",strtotime($r['EndDate'])) . ' 12:00:00');
		while ($cd < $ed) {
		// Increase to next day
		$cd += 60*60*24;
		if (date("G",$cd) == 11) $cd += 60*60; // Daylight savings.
		if (date("G",$cd) == 13) $cd += -1*(60*60);
		// Set day as unavailable
		if (isset($days[date("Ymd",$cd)]) && isset($days[date("Ymd",$cd)]['status'])) {
		$days[date("Ymd",$cd)]['status'] = 'unavailable';
		}
		}
		// Set end day as outgoing
		if (isset($days[date("Ymd",strtotime($r['EndDate']))]) && isset($days[date("Ymd",strtotime($r['EndDate']))]['status'])) {
		$days[date("Ymd",strtotime($r['EndDate']))]['status'] = 'outgoing';
		}
	}
}
{% endhighlight %}

What the hell is going on? This code has been so poorly written, compiling it and then disassembling
it into some assembly language would make it more readable. But hey, at least there's comments...

#### Exhibit C: A stale comment

{% highlight javascript %}
// add the time to each element
time = Time.now
maxLength = 150
minLength = 10
arbitrage = 32.5
for (i = 0; i < stateProps.length; ++i) {
	stateProps[i].timeSetting = time
	stateProps[i].maxLength = mmaxLength
	stateProps[i].minLength = minLength
	stateProps[i].arbitrage = arbitrage
}
{% endhighlight %}

Oops looks like there's a little more going on here than just adding on a time value to each element of this array.
This is a case of hit-and-run. Another developer quickly hacked in some extra code and left the comment as is.

#### Exhibit D: A comment that lies

{% highlight ruby %}
# Now aggregate total prices of all books
total_price = 0
i = 0
books.each do |book|
	break if i > 2
	total_price = book.price
	i += 1
end
{% endhighlight %}

Developers are fickle. Looks like this developer changed their mind later on and decided to only total up the first
few books in this array. Unfortunately their comment says otherwise.

#### Exhibit E: A comment that threatens

{% highlight javascript %}
// DON'T TOUCH THIS! DRAGONS BE HERE!
{% endhighlight %}

Have you ever seen one of these type of comments? The ones that *tell* you not to touch the code. Change anything here
and unexpected bad things could happen. Unless you have a thing for masochism--you know, chains, ball gag, latex--it's
best to heed to the warning of the author and leave this code alone. Seriously, this code is one of those gems
that is so poorly written, any changes will require years of regression testing. Just leave it alone.


### Writing self-documenting code

So how do we kill two stones with one bird? By writing self-documenting code of course! Writing self-documenting code
both saves you time and ensures your code is readable for future maintainers. Here's some suggestions for writing
self-documenting code:

#### Use your words

Modern IDEs and editors take the pain out writing long variables and functions with auto-completion and intellisense. In
addition, screen real estate has grown. There's no longer a good excuse for single-letter variables or abbreviations.
When in doubt, type it out. I should have a general idea of what's contained in a variable or what a method is going to
do just by reading its name, not looking at its documentation.

#### Split long functions into multiple functions

Got a hundred-line function? Perhaps it needs to be ten, ten-line functions. When the length of a function grows
unwieldy, it can be tempting to start chunking up the lines and putting comments between them. Instead, chunk the
functions into multiple functions. The benefit is many-fold: not only does the code become more readable, it also
becomes more testable and composable. Now you're cooking with [DRY](http://en.wikipedia.org/wiki/Don%27t_repeat_yourself)!

#### Refactor complex conditionals into variables (or functions)

Got a complex `if` condition that can't be easily understood in a passing glance? Break it into several variables
instead. It doesn't take much effort to introduce a bug due to a convoluted `if` statement. Make that `if` read like
English!

Take the following convoluted example:
{% highlight javascript %}
if(
	(book.price < 25 || book.hardcoverPrice < 15)
	&& (book.isNyBestSeller
		|| (book.reviewsCount > 100 && book.ratingScore > 4))
	&& book.isNew
) {
	// ...
}
{% endhighlight %}

This could be rewritten as:
{% highlight ruby %}
bookPricesAreInRange = book.price < 25 || book.hardcoverPrice < 15
bookHasHighRating = book.reviewsCount > 100 && book.ratingScore > 4
bookIsPopular = book.isNyBestSeller || bookHasHighRating

if(bookPricesAreInRange && bookIsPopular && book.isNew) {
	// ...
}
{% endhighlight %}

#### Refactor switch statements into multiple functions

When it's time to roll out the old `switch` statement, this could be a very good sign your code is becoming too
complex. In addition, that `switch` statement may also be leading your code down the path of
[control coupling](http://en.wikipedia.org/wiki/Coupling_%28computer_programming%29#Procedural_programming)

Consider the following example:
{% highlight javascript %}
sort(array, criteria = VALUES_ASC) {
	switch(criteria) {
		case VALUES_ASC:
			// Sort on values in ascending order

		case VALUES_DESC:
			// Sort on values in descending order

		case VALUES_RANDOMLY:
			// Sort on values randomly

		case BY_KEYS:
			// Sort a hash array by keys
	}
}
{% endhighlight %}

This could be refactored into four functions instead:
{% highlight javascript %}
sortValuesAscending(array) {
	// Sort on values in ascending order
}

sortValuesDescending(array) {
	// Sort on values in descending order
}

sortValuesRandomly(array) {
	// Sort on values randomly
}

sortHashByKeys(array) {
	// Sort a hash array by keys
}
{% endhighlight %}

### Using comments appropriately

There is a place for everything. Even `goto` statements have a place (e.g. error handling). So of course I'm not
suggesting you *shouldn't* use comments, only that it's often more appropriate to write self-documenting code.

In fact, there's a place for comments in self-documenting code as well. Writing code that documents itself usually
answers the question of ***what*** it's doing, but sometimes the reason ***why*** is important as well. This is why it's
important to leave comments about your **intent**. For example, after hours of hunting down an optimization issue in
a piece of code, you find it and rewrite it in a non-obvious manner. Now another developer comes along and wonders why.
This is the time and place to leave a comment.

In addition to documenting intent, I also think it's important to document public APIs. That is, leave comments or write
documentation on the **public** interfaces only. This should serve as a quick reference for anyone using your code so
they don't have to dig into the internals.

And finally, sometimes you just don't have a choice, and need to write obfuscated code. Perhaps the language or library
you're using prohibits expressing your semantics elegantly. Or perhaps you have to write something super performant that
must eschew readability. These are the exceptions to the case.

Regardless of the situation, the next time you need to write some code, try reading it after writing it. If you think
another developer wouldn't be able to make sense of it at a glance without comments, then it might be time to refactor.