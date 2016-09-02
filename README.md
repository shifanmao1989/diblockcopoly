# diblockcopoly
=======================================

This is a function that uses polymer field theory to find phase behavior of diblock copolymers

The polymers are modeled as wormlike chains, Gaussian chains, and perfectly rigid rods.
Phase transition spinodal and critical wavemode of phase segregation can be found at different
chemical correlation and monomer rigidities.

Renormalized phase diagrams are found by F-H/Brazovskii theory of free energy expansion
up to quartic-order density fluctuations.

## Run example
Here is a walkthrough of example.m

Open Matlab and change directory to `diblockcopoly`. Then add the following folders to path with
```
addpath('functions')
addpath('chainstats')
addpath('misc')
addpath('chainstats/eigcalc')
addpath('chainstats/integrals')
```

Next define the variables of interests. For example:
```
N=1e4;  % number of statistical steps of total chain
FAV=linspace(0.1,0.5,41);  % range of A monomer chemical composition
C=1e3;  % dimensionless excluded volume parameter in the Gaussian limit
        % In the Gaussian chain limit, Nbar = C^2
```
With these variables, one can plot a mean-field diblock copolymer phase diagram using function `plotphase` with
```
plotphase(N,FAV);
```
<img src="./example_figures/MFphase.png" width="800" height="600" />

If fluctuation effects needs to be considered, one can make a phase diagram with presence of density fluctuations with
```
plotphaseRG(N,C,FAV);
```

- spinodal, calculates mean-field phase transition spinodal of diblock copolymer
- spinodalRG, calculates renormalized phase transition spinodal of diblock copolymer with density flucutations
- densityRG, plots density-density correlations with mean-field and flucutation theory
- calcgamma, calculates vertex functions of free energy expansion

## Input specifications
N, number of Kuhn steps of total chain. In general chains are modeled as worm-like chains. In the limit N>1e4, Gaussian chain statistics are used; in the other limit N<1e-4, perfectly rigid rod statistics are used
FA, chemical composition of A type monomers