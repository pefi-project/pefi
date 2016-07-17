# What is PeFi

**PeFi** stands for **Pe**rsonal **Fi**nance. It is a hobby project aimed to solve a simple yet boring task - tracking your personal finances. And just to make sure the purpose is clear let me tell you what PeFi is not:


> PeFi doesn't *manage* your money, it's not aimed to make budget, set financial goals or calculate your balance based on credits, investments or whatever comes to your mind. It simply tracks where you spend your money and it tries to make it as simple as possible ... and fun!

# The problem ...

A while ago I was trying to come up with a cool startup idea. I really liked 37signals approach described in [Rework][1] known as *scratch your own itch* in the open-source. Back then I was reading a lot about managing personal finances, investment strategies, personal financial plans setting goals, etc. And the cornerstone for all of the above is expense tracking. However, I found it really hard to force myself to do it regularly. One day all the pieces of the puzzle fit together - I decided I should make an expense tracking app/service that *I'd love* to use! Hopefully there will be other who will find it useful and fun. After all I can't be the only disorganized person who wonders where most of their paycheck goes!

After discussing it with several friends I came up with the two major problems I wanted to target:

1. Entering a spending in the system must be as easier as possibly can
2. Even if point 1 is just a click away the user still needs motivation to do it

I know there're sophisticated services like [mint][2]. However, as much as find [mint][2] inspiring I think it is useless in under developed countries where most of the payments are done in cash and often doesn't involve bills. So here is my proposal:

# ... and the solution

1. Solution to problem 1 would involve a mobile app that uses the phone's camera to take a photo of the bill or type easily amount of money. It may involve a lot of interesting tricks to make it easier - OCR, smart suggestions, background processing of images, etc. But it's a topic for other discussion. Because in this project initially we'll be focusing on the other aspect...
2. ... Motivation! I believe the answer here is gamification with *optional* social elements!
 
> Track at least one spending three days in a row - get a badge, track 50% of your expenses this month - get another, cooler, badge! Get ranked as "Warren Buffett" and appear on top of the leaderboard among your facebook friends using the same app! ... etc, etc

The whole idea is hugely inspired by [foursquare][3] and the initial design - by [twitter][4]:

## Home screen
The first out of three main tabs. Three main operations - add spending, add earning, checkout period (will explain later on):

![PeFi home screen 1](https://github.com/pefi-project/pefi/blob/master/png/pefihome1.png)

You can access your profile, or browse history of spendings or simply query the history using the search box:

![PeFi home screen 1](https://github.com/pefi-project/pefi/blob/master/png/pefihome2.png)

### Add/Edit spending and earnings
![PeFi home screen 1](https://github.com/pefi-project/pefi/blob/master/png/pefiadd.png)
===
![PeFi home screen 1](https://github.com/pefi-project/pefi/blob/master/png/pefiedit.png)
=== 
![PeFi home screen 1](https://github.com/pefi-project/pefi/blob/master/png/pefiaddearning.png)

### Checkout periods
Naming things is hard! I don't like this one but I wanted to move forward and change it later. The meaning of the *checkout* is to enter your current ballance and based on your history of spendings/earnings PeFi will calculate what percentage the spendings was tracked.

![PeFi home screen 1](https://github.com/pefi-project/pefi/blob/master/png/peficheckout.png)

## Leaderboard
If you choose to connect your facebook, tweeter or G+ account and share your achievements a leaderboard will appear with the rest of your friends using who use PeFi:

![PeFi home screen 1](https://github.com/pefi-project/pefi/blob/master/png/pefileaderboard.png)

## Account page
If you change your mind about sharing and social networks or if you have a new haircut and want to update your profile picture with it - tweak it on the personal account page:

![PeFi home screen 1](https://github.com/pefi-project/pefi/blob/master/png/pefiaccount.png)

## Statistics
In this section you can explore where your moeny goes - food, gaming, charity, clothes, presents, etc. Also track your tracking progress over time!

![PeFi home screen 1](https://github.com/pefi-project/pefi/blob/master/png/pefistats.png)

# Set up development environment
The project is using [Docker][7] and docker-compose, previously known as [Fig][8], to set up easily reproduceable development environment. Simply execute ```docker-compose up``` in the project directory and it will take care of everything. For more information on installing and configuring docker and docker-compose check the [docs](https://docs.docker.com/).

# Epilogue
If you find the project intresting and want to share an idea or help feel free to contact [me][5]. Sketches are built and exported to PNG using [Pencil][6]. Pencil's project file is ```PeFi_sketches.ep```. 


[1]: https://37signals.com/rework
[2]: https://www.mint.com/
[3]: https://foursquare.com/
[4]: https://twitter.com/
[5]: https://github.com/hristoyankov
[6]: http://pencil.evolus.vn/
[7]: https://www.docker.com/
[8]: http://www.fig.sh/
