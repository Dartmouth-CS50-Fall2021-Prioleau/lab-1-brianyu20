#!/bin/bash

#lab 1 
#Brian Yu
#09/20/2021
#Usages: 
#1) ./query.sh state -> to get the latest data on the number of people vaccinated in the state. (state should be given in its abbreviated name)
#2) ./query.sh state MM/DD/YYYY -> get the number of people vaccinated in the state on the particular day


#First to see if the file exists/is readable
if [ ! -r vaccine.csv ]; then
        echo 1>&2 "Incorrect number of arguments. Usage: ./query.sh state MM/DD/YYYY"
        exit 1  
fi

#handling when there are no arguments are passed 
if [ $# = 0 ]; then
       echo 1>&2 "Error: No state or date"
       exit 1
fi

#handling all cases where there is only one argument (state) passed
if [ $# = 1 ]; then
        total=0 #create a variable to add the numbers of people vaccinated for each county in a state
        for state in $(grep '^09/13' vaccine.csv | cut -d "," -f 5 | sort -u) #looping through each state
        do
                if [ $1 = $state ]; then #if the state exists
                        
                        #getting the most recent vaccination data for the number of people who are vaccinated for that state
                        for n in $(grep '^09/13' vaccine.csv | cut -d "," -f 4,5,7 | grep $1 | cut -d "," -f 3)
                        do
                        ((total+=n)) #loop for each county and add to the total
                        done
                        echo "$1: $total"
                        exit 0
                fi
        done
        #when it exits the for-loop, the state must not exist
        echo 1>&2 "$1 state does not exist"
        exit 1
fi

#handling all cases where there are two arguments being passed in
if [ $# = 2 ]; then 
        total=0 #creating the variable to add all the people who are vaccinated
        for state in $(grep '^09/13' vaccine.csv | cut -d "," -f 5 | sort -u) #looping through existing states 
                do
                        if [ $1 = $state ]; then # if the state exists and
                                for date in $(grep $1 vaccine.csv | cut -d "," -f 1) #then loop through all the dates in that state
                                
                                do
                                        if [ $2 = $date ]; then #if the date exists for that state
                                            for n in $(grep $2 vaccine.csv | cut -d "," -f 4,5,7 | grep $1 | cut -d "," -f 3) #for the number of vaccinated people
                                                do
                                                        ((total+=n))
                                                done
                                                        echo "$1: $total"
                                                        exit 0  
                                        fi
                                done
                                #if it exits the nested for-loop, the date must not exist for that state
                                echo 1>&2 "This date ($2) does not exist for $1"
                                exit 1         
                                
                        fi
                done 
                #if it exits the for-loop, the state must not exist         
                echo 1>&2 "$1 state does not exist"
                exit 1
fi

#handling cases where there are more than 2 arguments being passed
if [ $# -ge 3 ]; then
        echo 1>&2 "Incorrect number of arguments. Usage: ./query.sh state MM/DD/YYYY"
        exit 1
fi

exit 0

