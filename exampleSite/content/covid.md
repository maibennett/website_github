+++ 
title = "It's #COVID-19 time!"
slug = "covid"
+++

### What do you do in self-isolation?

I scrape data and do plots! Chile is posting its new cases every day, with the location of where they are tested. So I'm compiling that information, and putting it [here](/files/data_covid.csv) (full repository [here](https://github.com/maibennett/code/tree/master/covid)). Also, doing some maps, because, why not? It's not like there's a dissertation I need to finish...

**Last update: 03/26/2020** 
(Ministerio de Salud stopped sharing disaggregated data in 03/18, so Santiago won't be updated until further notice. You can still see how Chile is doing, though!)

### How has this evolved in Chile?

How many cases have been tested in Santiago, Chile, by testing center location:
<p align="center">
<img src="/images/covid.gif" width="600">
</p>

An also, how many cases have been tested in all of Chile, by testing center location:
<p align="center">
<img src="/images/covid_chile.gif" width="600">
</p>

In terms of cummulative cases, Chile has experienced an exponential growth of *confirmed* cases (i.e. does not necessarily reflect the real number of people infected):

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

