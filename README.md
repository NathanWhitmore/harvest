# harvest
## Tools for estimating the sustainability of wildlife harvesting

### Introduction
Conservation practitioners the world over have to make decisions based on limited amounts of empirical data.
Estimating whether or not a specific wildife population is in need of an intervention to remain viable in the face of a harvest
is one such dilemma. In much of the world harvested wildlife remains nutritionally important for forest fringing human communities.
The productivity of such species, and the potentially sustainability (or unsustianability) of the harvest only emerges slowly 
over time. The reality is, however, important wildlife management decisions will preceded good ecological data. This package 
"harvest" attempts to aid conservation practitioners in visualising the possible sustainability of the population in question
given the knowledge at hand.

### Concept
The basic concept of this package is to build a simple to use package in R to help wildlife practicioners visualise graphically 
the possibility of a population being sustainably harvested based on knowledge at hand using estimates of:
 1. population growth 
 2. density
 3. biomass
 4. offtake
  
The package's main  function is "harvest.tolerance" which is arranged in such a way that existing knowledge (real data, surrogates,
and informed guestimates) can be used to make a visual estimate using a simple Monte Carlo recombination technique. If safety 
margins or buffers are required these can be introduced by a threshold value in kilograms. The user can then see the likelihood 
of sustainability given the knowledge at hand, as well as the minimum intervention required to attain that goal.

### How to download

First install the "devtools" package then run:

```library("devtools") ```

```install_github("NathanWhitmore/harvest")```
