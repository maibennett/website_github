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

##### Who cites me?

Mirya Holman posted the following tweet, and I thought it was a super interesting question. *Who do I cite and who cites me?*

<p align="center">
<img src="/images/mirya_tweet.png" width="500">
</p>

For that reason, I started looking around whether there was something that did this at the researcher level and not the article level. I wasn't able to find anything that did exactly this, so I thought it was a good opportunity to try to code this. Using **[SerpAPI](https://serpapi.com/google-scholar-api)**, I wrote the [following Python code](https://github.com/maibennett/code/tree/master/WhoCitesMe) to scrape Google Scholar and find who is citing my (or other author's) paper. *You will need to get an API key from SerpAPI, but they have a free plan*.

So far, I only have one side of the network. **I will update this then to find who an author cites, creating the full network of reciprocity by year.**  


##### How is the 2nd ballot going to turn out in the Chilean presidential election?

I created a simple shinyapp to play around with different scenarios for the second round of the presidential election in Chile 2021 (website in Spanish). You can see the live app [here](https://maibennett.shinyapps.io/2daVuelta/), and check out the code in my repository.

<p align="center">
<img src="/images/2daVuelta.png" width="700">
</p>

##### Easy way to scrape some data in R

This code was posted by [Sue Marquez](https://github.com/Suemarquez/covid_nys) for scraping some COVID-19 data, and I found it super useful. I am fairly new at scraping data, and this made it very easy and intuitive. The main advantage is that by using Inspect on your browser, you can see exactly the different content you want to scrape and download. I slightly adapted Sue's code for scraping data from the Chilean Ministry of Health, and commented it so you know how to adapt it for your own needs. Check it out [here](https://github.com/maibennett/code/blob/master/covid/code/scrape_daily_data.R).

<p align="center">
<img src="/images/example_html.png" width="700">
</p>

##### R script for doing quick maps

This can be used in combination with the geocode Rscript that's down below, but here's a quick way to visualize some locations in R. I illustrate this with the specific case of the spread of #COVID-19 in Chile. I download a map from Google into R (you will need an API key for this, so check out [this website](https://developers.google.com/maps/documentation/geocoding/get-api-key)), and then plot the locations of the detected cases. In this case, I make the size of the points proportional to the number of cases detected in that center. You can check out the end results [here](https://www.magdalenabennett.com/covid) or the full repository [here](https://github.com/maibennett/code/tree/master/covid), including the code and data.

<p align="center">
<img src="/images/example_covid.png" width="500">
</p>

##### Python script for ArcGIS to characterize geographic zones with census tract data

Sometimes we need to characterize certain geographic zones (e.g. school districts) with geographic data that is in a different level (e.g. census tract data). How do we do that? **[Here](https://github.com/maibennett/code/tree/master/geographic_characterization)** I have some example code on how to create a csv file using a Python script that can be run in ArcGIS. The idea is that by combining both levels of geographic data, we can later create weights for our areas of interest depending on the overlapping surface of other geographic areas. The code sets an example using Florida school districts and census tracts, and merges tract level income data (you can merge way more census tract data!). The Python code is first run in ArcGIS, and the analysis is later conducted in Stata for simplicity. The example map below shows Collier County School district in FL and the overlapping census tracts:

<p align="center">
<img src="/images/map_collier_county.png" width="600">
</p>

If we wanted the average household income for the district using the census tract data, we can generate a weighted average of the overlapping census tracts.

##### Stata dofile for LaTeX output

If you are like me, and want to fully personalize everything in your LaTeX output, there's nothing better than creating your own table in a dofile instead of using an out-of-the-can package. You can do it by using `texdoc` and writing your table from scratch using macros. Might sound like more work (it is), but it can also be pretty easy for getting that output just as you wanted. You can download a simple example dofile **[here](/files/texdoc_output.do)**.

*(Credits due to [@AndresGonzLira](https://twitter.com/AndresGonzLira) who showed me this command back in 2012 at JPAL LAC).*

##### Need to geocode or reverse geocode?

If you ever needed to go from lat/lon to addresses (or vice versa), then this code might come in handy. The geocode (going from street addresses to latitudes and longitudes) and reverse geocode (the opposite) R script I present here was adapted from the code by **[Kei Saito](https://blog.exploratory.io/reverse-geocoding-part-2-using-google-maps-api-with-r-e676db36fee6)**, and I adapted it to my needs (including geocoding). Be aware that you will need a Google API Key for this (which is easy to get [here](https://developers.google.com/maps/documentation/geocoding/get-api-key)), and you will get charged if you go over the number of requests you are allowed, which go up to 40,000 requests with the free $200 credit/month (terms have been changing lately, so keep up to date with that). The code also includes a variable that actually counts how many valid requests you have made, so you can keep that in mind when running this! You can find the code **[here](https://github.com/maibennett/code/tree/master/geocodeAPI)**. 

*PS: You can also easily adapt this code to use Open Street Map (OSM) instead of the Google API, if you want. However, keep in mind that OSM does cap the number of requests significantly compared to Google.*

##### Send a text message to your phone when your code is done!

This is some code that [@RichPauloo](https://twitter.com/RichPauloo) created and tweeted about, and you can find [here](https://richpauloo.github.io/2019-09-11-Using-Twilio-to-text-myself-after-long-running-jobs/). If you have ever been running code that takes forever (e.g. a **lot** of simulations), you might have dreamt of something like this. I implemented it as soon as he tweeted about it: It works great, and its super easy to incorporate to your R code. You will have to set up a Twilio account, but it's no fuzz. For changing the emojis, I found useful to install the `emo` package:
```{r}
# install.packages("devtools")
devtools::install_github("hadley/emo")
library(emo)

# Dancer emoji (of course)
dancer <- emo::ji("dancer") 
```
I also randomized different messages you could get, just because I thought it was more fun :). Here's a brief example:

```{r}
textme <- function(){
  # First you need to set up your accound SID and token as environmental variables
  Sys.setenv(TWILIO_SID = "YOUR_TWILIO_SID")
  Sys.setenv(TWILIO_TOKEN = "YOUR_TWILIO_TOKEN")
  
  # Then we're just going to store the numbers in some variables
  my_phone_number <- "YOUR PHONE NUMBER"
  twilios_phone_number <- "TWILIO'S PHONE NUMBER"
  
  #Some messages:
  msg_list = c(paste(emo::ji("dancer"),"So either your code ran smoothly or you just hit a bump. Either way, go check it out!",emo::ji("celebrate")),
               paste(emo::ji("flower"),"You smell like flowers",emo::ji("flower"),"Now get to work, because your code is done!",emo::ji("sparkles")))
  
  #Choose a random message
  msg = sample(msg_list,1)
  
  # Now we can send away!
  twilio::tw_send_message(from = twilios_phone_number, 
                          to = my_phone_number, 
                          body = msg)
  
}
```

And voilà! (PS: You will get the ugly "free trial" message ahead of your own customized message, but you can get rid of that by, you know, paying money).

<p align="center">
<img src="/images/text_message.jpg" width="400">
</p>

## <a name="design"></a>Design
##### How to make a better poster!

Here's a video by **[Mike Morrison](https://twitter.com/mikemorrison)** on why you should build a better scientific poster (and how to do it):

[![betterposter](/images/betterposter.png?raw=true)](https://www.youtube.com/watch?v=1RwJbhkCA58&feature=youtu.be)

(tl;dr See the templates [here](https://osf.io/ef53g/))

##### Xaringan \#FTW

Lately, I've fully moved to Rmarkdown presentations, especifically with **[`Xaringan`](https://github.com/yihui/xaringan)**. These are not only beautiful, but also fully flexible, and way more convenient in the way you can host them. I started a repository of my presentations **[here](https://maibennettslides.netlify.app)**, which include both slides and code. I'll right a longer post about certain resources, but some game changers:

- **[`Xaringanthemer`](https://pkg.garrickadenbuie.com/xaringanthemer/articles/xaringanthemer.html)** has worked amazing for customizing my slides.
- Check out some of [Andrew Heiss' slides](https://www.andrewheiss.com/teaching/). They are **#GOALS**, and I picked up a bunch of tricks from his available code.
- Shoutout to [Allison Horst](https://github.com/allisonhorst/stats-illustrations) as well. She posts the most wonderful stats/`R` artwork. 

![](https://raw.githubusercontent.com/allisonhorst/stats-illustrations/master/rstats-artwork/ggplot2_masterpiece.png)

##### Tips for beamer

From the great [Paul Goldsmith-Pinkham](https://twitter.com/paulgp), some [beamer tips](https://github.com/paulgp/beamer-tips)! (pretty self-explanatory). From palettes that are color-blind friendly, to different features that beamer has and a lot of people (it me!) didn't know. Check them out when building your next beamer presentation (click the image to see the slides). Totally worth it.

[![beamer_presentation](/images/beamer_presentation.png?raw=true)](https://github.com/paulgp/beamer-tips/blob/master/slides.pdf)

## <a name="apps"></a>Apps

Nothing to do with stats or econ or education, but some apps that are game changers:

* **Copilot Money:** Do you know where your money is going? I thought I did, but.. nope. Copilot helps keep track of your finances, stay on budget, and actually has a daily forecast of how you're doing wrt your monthly budget. And everything is automatic! (It even sends you notifications when one of your credit card debts goes over a %, to keep up your credit score). Truly a game changer! You can download it from the Apple Store using my code (9AKMUP) for some discounts [here](https://copilot.money/link/jmJLXypuLBXfDm4Z7--).

* **Chrome remote desktop:** If you use remote desktop to access another computer or even your own laptop (and you should), you should definitely download the app. You can watch your code run from the comfort of your iPhone (or Android, not judging), and overall it has an awesome interface.

* **Splitwise:** The best way to keep track of shared expenses, either for a trip or if you share a household. It's integrated with Venmo, so you can settle accounts directly from the app.

* **Acorns:** Cool app to save (and invest) some money. If you are a grad student and have trouble saving money, you can use this app to save round-ups, or even include some small weekly or monthly amount. It then invests your money according to a risk portafolio you select. PS: You can use [my code](https://acorns.com/invite/53JKTQ) to get $5!

* **Strava:** Not much to say here. So far, best tracking app for running.
