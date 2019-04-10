+++ 
title = "Resources" 
slug = "resources" 
+++

Here I compile a list of some helpful resources/tips (created by me or others) that have helped me in the past years. Contributions are more than welcome!

**Topics**: 
:computer: [Code](#code)
:bar_chart: [Design](#design)
:space_invader: [Apps](#apps)

## <a name="code"></a>Code
##### Stata dofile for LaTeX output

If you are like me, and want to fully personalize everything in your LaTeX output, there's nothing better than creating your own table in a dofile instead of using an out-of-the-can package. You can do it by using `texdoc` and writing your table from scratch using macros. Might sound like more work (it is), but it can also be pretty easy for getting that output just as you wanted. You can download a simple example dofile **[here](/files/texdoc_output.do)**.

*(Credits due to [@AndresGonzLira](https://twitter.com/AndresGonzLira) who showed me this command back in 2012 at JPAL LAC).*

##### Need to geocode or reverse geocode?

If you ever needed to go from lat/lon to addresses (or vice versa), then this code might come in handy. The geocode (going from street addresses to latitudes and longitudes) and reverse geocode (the opposite) R script I present here was adapted from the code by **[Kei Saito](https://blog.exploratory.io/reverse-geocoding-part-2-using-google-maps-api-with-r-e676db36fee6)**, and I adapted it to my needs (including geocoding). Be aware that you will need a Google API Key for this (which is easy to get [here](https://developers.google.com/maps/documentation/geocoding/get-api-key)), and you will get charged if you go over the number of requests you are allowed (terms have been changing lately, so keep up to date with that). The code also includes a variable that actually counts how many valid requests you have made, so you can keep that in mind when running this! You can find the code **[here](https://github.com/maibennett/code/tree/master/geocodeAPI)**.

## <a name="design"></a>Design
##### How to make a better poster!

Here's a video by **[Mike Morrison](https://twitter.com/mikemorrison)** on why you should build a better scientific poster (and how to do it):

[![betterposter](/images/betterposter.png?raw=true)](https://www.youtube.com/watch?v=1RwJbhkCA58&feature=youtu.be)

(tl;dr See the templates [here](https://osf.io/ef53g/))


## <a name="apps"></a>Apps

Nothing to do with stats or econ or education, but some apps that are game changers:

* **Chrome remote desktop:** If you use remote desktop to access another computer or even your own laptop (and you should), you should definitely download the app. You can watch your code run from the comfort of your iPhone (or Android, not judging), and overall it has an awesome interface.

* **Splitwise:** The best way to keep track of shared expenses, either for a trip or if you share a household. It's integrated with Venmo, so you can settle accounts directly from the app.

* **Acorns:** Cool app to save (and invest) some money. If you are a grad student or severely budget constrained (*dat me!*), and have trouble saving money, you can use this app to save round-ups, or even include some small weekly or monthly amount. It then invests your money according to a risk portafolio you select. PS: You can use [my code](https://acorns.com/invite/53JKTQ) to get $5!

* **Strava:** Not much to say here. So far, best tracking app for running.
