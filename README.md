Hello! This is a code for simulation of blood sugar and glycimic index calculation.
Input format for this code is tab seprated consisting of Tyep Name  glycimicindex/exerciseindex timestamp(seconds precision) 
an example can be:

Food	Banana cake, made with sugar	47	1496401908
Exercise	Crunches	20	1496401911
Food	Banana cake, made without sugar	55	1496401919
Exercise	Sprinting	60	1496401929
Food	Sponge cake, plain	46	1496401923
Exercise	Crunches	20	1496401920
Food	Vanilla cake made from packet mix with vanilla frosting (Betty Crocker)	42	1496401932
Food	Apple, made with sugar	44	1496401943
Food	Apple, made without sugar	48	1496401954
Food	Food, Waffles, Aunt Jemima (Quaker Oats)	76	1496401965
Food	Bagel, white, frozen	72	1496401972
Food	Baguette, white, plain	95	1496401989
Exercise	Squats	60	1496401100
Food	Coarse barley bread, 75-80% kernels, average	34	1496401999
Food	Hamburger bun	61	1496401200
Food	Kaiser roll	73	1496401218
Food	Pumpernickel bread	56	1496401229


You can run the code in two ways.

1. Either run rspec spec and two images will be generated: glycations.png and bloodsugar.png (preferred)
  or 
2. cd to lib folder and Run ruby runprogram.rb (Go through codes in lib folder and uncomment the require blocks as mexplained in each code)


The code has been developed through TDD, with Rspec using composition of classes and following object oriented encapsulation and reponsibilities 


The logic was that for each minute duration:
  1. If there has been no food consumed or exercise done within the last 2 hours and 1 hour respectively, I set the glucose level as 80
  else
    a. I check the food items consumed within 7200 sec and add the glucose level as per the difference in time between the time instant and time of that food consumption, multiplied by the glycimic_index factor
    b. I check the exercise done within 3600 sec and subtract the exercise level as per the difference in time between the time instant and time of that food consumption, multiplied by the exercise_index factor
    c. I store the glucose level for that minute in an array of objects
  
2. Finally I check for that minute, if the glucose level is above 150, if it is I increase the glycation by 1.
   a. I store the glucose level for that minute in an array of objects
  
  I plot these two arrays in a seperate class
  
  
  
