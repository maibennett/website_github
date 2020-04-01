+++ 
title = "It's #COVID-19 time!"
slug = "covid"
+++

<meta property="og:image" content = "https://raw.githubusercontent.com/maibennett/website_github/master/exampleSite/content/images/virus.png">

### What do you do in self-isolation?

I scrape data and do plots! Chile is posting its new cases every day, with the location of where they are tested. So I'm compiling that information, and putting it [here](/files/data_covid.csv) (full repository [here](https://github.com/maibennett/code/tree/master/covid)). Also, doing some maps, because, why not? It's not like there's a dissertation I need to finish...

**Last update: 03/31/2020** 
(Ministerio de Salud stopped sharing disaggregated data in 03/18, so Santiago won't be updated until further notice. You can still see how Chile is doing, though!)

### Shiny App

(Direct link in https://maibennett.shinyapps.io/corona_app)

<iframe src="https://maibennett.shinyapps.io/corona_app" width="100%" height="800px"></iframe>

### How has this evolved in Chile?

How many cases have been tested in Santiago, Chile, by testing center location:
<p align="center">
<img src="/images/covid.gif" width="600">
</p>

An also, how many cases have been tested in all of Chile, by testing center location:
<p align="center">
<img src="/images/covid_chile.gif" width="600">
</p>

You can also see some static plots here for the evolution of COVID-19:

<p align="center">
<img src="/images/cum_cases.png" width="600">
</p>

How does it look by region? Santiago is pretty much driving the growth:

<p align="center">
<img src="/images/cum_regions.png" width="600">
</p>


And if we take the Metropolitan Region out, this is how it looks:

<p align="center">
<img src="/images/cum_regions_minus_met.png" width="600">
</p>
