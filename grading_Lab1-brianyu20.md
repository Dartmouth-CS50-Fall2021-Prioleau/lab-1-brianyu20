# Grading and Commentary for CS50 Lab 1

## Student: Jae Eun (Brian) Yu

## Grader: Amittai

## Date: 09/24/2021

&nbsp;

### **Final Scores**

-------------------
|Problem|Score|
|:-------|------:|
|Delivery|5/5|
|Problem A|5/5|
|Problem B|3/5|
|Problem C|5/5|
|Problem D|10/10|
|Problem E|10/10|
|Problem F|10/10|
|Problem G|5/10|
|Problem H|40/40|
|**TOTAL**|**93**|

### Delivery

> No deductions, but put spaces after "##" in your headings and subheadings. Markdown interprets them as ordinary text sequence if not spaced.

### Problem A

&nbsp;

Recall the prompt:

> A. Write a single bash command or pipeline to print only the lines for the state of New Hampshire in the month of August. The output should not contain the current first line, which lists the names of data fields.

Versus your solution:

```bash
grep 'NH' vaccine.csv | grep '^08/[0-9][0-9]/2'
```

#### Deductions for A

> None.
>

your commands produce the correct results.

#### Score: **5**

&nbsp;

### Problem B

Recall the prompt:

> Write a single bash command or pipeline to print only the county (Recip_County), state (Recip_State), and percentage of fully vaccinated people (Series_Complete_Pop_Pct) columns. The output should be comma separated and should not contain the current first line, which lists the names of data fields.

And your solution

```bash
cat vaccine.csv | cut -d "," -f 4,5,6
```

#### Deductions for B

> -1 for unneeded use of `cat` to generate input for `tail` instead of just passing the file into `tail`.
>
> -1 for not removing the header line from the output (as the prompt asked). You should use commands such as `sed` or `tail` to delete lines from the top of a text stream.

Your pipeline generates the correct output.

#### Score: **3**

&nbsp;

### Problem C

Recall the prompt:

> Write a single bash command or pipeline to print only the lines from August 11 to August 13, including the data on August 11.

And your solution

```bash
grep '^08/1[1-3]/2' vaccine.csv
```

#### Deductions for C

> None.
>

Your output is correct.

Score: **5**

&nbsp;

### Problem D

Recall the prompt:

> Write a single bash command or pipeline to print the counties with zero percent of fully vaccinated people in the state of California. Note that the latest date will have the cumulative data.

And your solution:

```bash
grep '^09/13' vaccine.csv | grep 'CA,0' | cut -d "," -f 4
```

> None.
>
> Hard-coded dates; deduction done in (G).
>

Your pipeline generates the correct output.

Score: **10**

&nbsp;

### Problem E

Recall the prompt:

> Write a single bash command or pipeline to print the number of counties with zero percent of fully vaccinated people in each state. Present this in decreasing order based on the number of counties. Each line of the output should contain the number of counties with zero percent of fully vaccinated people and the state name. Note that the latest date will have the cumulative data

And your solution

```bash
grep '^09/13' vaccine.csv | cut -d "," -f 4,5,6 | grep ',0$' | uniq | cut -d "," -f 2 | sort | uniq -c | sort -nr
```

> None.
>
> Hard-coded dates. Deduction done in (G).
>

Score: **10**

&nbsp;

### Problem F

Recall the prompt:

> Write a single bash command or pipeline to print the counties with the top-10 highest percentage of fully vaccinated people based on the latest data. Present this in decreasing order based on the fully vaccinated percent. Each line of the output should contain the county name, the state, and percent of fully vaccinated people, each separated with a comma. Note that the latest date will have the cumulative data.

And your solution

```bash
grep '^09/13' vaccine.csv | cut -d "," -f 4,5,6 | sort -t, -k3 -nr | head -10
```

> None.
>
> Hard-coded date - deduction done in (G).

Your output is correct.

Score: **10**

&nbsp;

### Problem G

Recall the prompt:

> Extend the previous command line to edit each output line, adding a pipe (|) symbol at the beginning and the end, and replacing the comma(s) with a pipe symbol. Copy and paste that output into your solution.md markdown file. Prepend two lines to it to create a nice table like the one below (created with the data on August 23, 2021). You should not have to edit the output of your commandline - you should just add the header row.

And your solution

```bash
grep '^09/13' vaccine.csv | cut -d "," -f 4,5,6 | sort -t, -k3 -nr | head -10 | sed -e 's/,/\|/' -e 's/,/\|/' -e 's/^/\|/' -e 's/$/\|/'
```

> -5 for hard-coded dates in F and G. A significant part of the assignment was you to figure out how you can extract the latest date from any version of `vaccine.csv`.

Your output is correct.

Score: **5**

&nbsp;

### Problem H

Recall the prompt:

> Write a bash script called [query.sh](./query.sh) that takes the name of a state and outputs the number of fully vaccinated people for this state based on the latest cumulative data. It can also take date as an additional parameter, in which case it will output the number of fully vaccinated people on that date for the specified state.

#### Points

> +2 for correct shebang `#!/bin/bash`
>
> +2 for descriptive header comment.
>
> +6 for correct input checking.
>
> +2 for correct exit on wrong number of arguments.
>
> +3 for checking readability of `vaccine.csv`.
>
> +3 for in-code comments.
>
> +6 for proper use of loops and other control structures.
>
> +15 for correct behaviour on valid and invalid state & date.
>
> * (+3) Correct handling valid states without dates.
> * (+3) Correct handling of valid states with valid dates.
> * (+3) Correct handling of valid states with invalid dates.
> * (+3) Correct handling of invalid dates.
> * (+3) Correct handling of invalid states.
>
> +1 for clean exit
>
> **TOTAL: 40**

#### Comments

> Good job redirecting `stdout` to `stderr` while printing errors!
>
> Your code in [query.sh](./query.sh) is awkwardly indented with 8 spaces a step. There's good chance that was a mistake, but you should pay more attention to what the editors do to your code; sometimes it makes your code harder to read and follow.
