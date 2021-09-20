#CS50 Lab 1

##A
```grep 'NH' vaccine.csv | grep '^08/[0-9][0-9]/2'```

##B 
```cat vaccine.csv | cut -d "," -f 4,5,6```

##C

``` grep '^08/1[1-3]/2' vaccine.csv```

##D
```grep '^09/13' vaccine.csv | grep 'CA,0' | cut -d "," -f 4```

##E
```grep '^09/13' vaccine.csv | cut -d "," -f 4,5,6 | grep ',0$' | uniq | cut -d "," -f 2 | sort | uniq -c | sort -nr```

##F
```grep '^09/13' vaccine.csv | cut -d "," -f 4,5,6 | sort -t, -k3 -nr | head -10```

##G
```grep '^09/13' vaccine.csv | cut -d "," -f 4,5,6 | sort -t, -k3 -nr | head -10 | sed -e 's/,/\|/' -e 's/,/\|/' -e 's/^/\|/' -e 's/$/\|/' > solutions.md```


##extended answer for question G
_____________________________
County|State|Fully Vaccinated(%)|
|Chattahoochee County|GA|99.9|
|Arecibo Municipio|PR|99.9|
|McKinley County|NM|96.9|
|Bristol Bay Borough|AK|87.7|
|Santa Cruz County|AZ|86.7|
|Culebra Municipio|PR|86.6|
|San Juan County|CO|84.5|
|Martin County|NC|80.4|
|Teton County|WY|77.6|
|Hamilton County|NY|77.1|
