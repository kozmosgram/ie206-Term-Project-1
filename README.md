IMPORTANT POINTS

+ TermProject1.pdf explains how the simulation will work and the cases.

+ Project1_ID2643740.pdf obtain the data from the simulation run were evaluated.

+ Cases were examined separately for each case and their codes are different from each other. 
Therefore, when running the codes, make sure that all files belonging to the relevant Case are in the same folder.

+ Test.m files exist to obtain more consistent results by running the simulation 200 times. If you want to run the simulation once, you can run the main.m file.

GOAL of The Project

The objective of this study is to employ a computational framework for modeling the spread of the COVID-19 pandemic within a specific area, 
employing carefully determined parameters. By leveraging this 
modeling approach, we aim to simulate the progression of the disease and evaluate its impact under various
scenarios. Through this process, we seek to gain valuable insights into the potential outcomes of different
policy interventions. Initially, we have two main policies and to observe how the system behaves, we consider
the five performance criteria which are the total number of infected people in the system, the total number of
vaccinated people in the system, the total number of infected people who are vaccinated in the system, the total
number of healed people in the system and the total number of dead people in the system.

Introduction of Simulation

This modeling basically consists of 7 files in total, including 1 main body, 1 test main and 5 functions named
infection, isolation, movement, OneVaccination, TwoVaccination.
The movement function defines the movements of people, the isolation function defines the isolation policy,
the infection function defines the spread and results of the disease, the OneVaccination function defines how
people are affected in cases of 1 dose of vaccine, and the TwoVaccination function defines the effects on people
when 2 doses of vaccine are applied.


The main file actually contains the entire simulation itself. However, the data obtained from the main file
contains many free variables such as the initial random location of the infected people, the random location of
the infected people in the simulation, the number of random steps people take and the direction of these steps,
the probability of getting the disease, and their desire to get the second vaccine. That's why we created the test
file to process the data from the main file in order to get more accurate data to provide more accurate estimates
to the government and to make our views more consistent. The test file repeats the simulation we designed 500
times and stores 5 data obtained from the simulation. Then it collects all of this data and divides it by 500,
which is the number of repetitions. With this method, we aimed to ensure that the data obtained from our
simulation were more consistent. The test file is also the file where the average data obtained is stored and
graphed. Test file draws graphs showing how the 5 data obtained after a for loop repeated 500 times change in
each iteration.

