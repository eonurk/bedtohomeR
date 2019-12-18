# bedtohomeR

An R package to convert bed formated files into Homer Ready txt format on Mac.


### Installation:
```r 
library(devtools) # install.packages("devtools")
```
then,
```r
install_github("eonurk/bedtohomeR")
```

### Usage

```r
bed_to_homer(bed, "path/to/homer_ready_file.txt")
```
this will create a file with uniqueIDs and add "." for strands.

Then, you can go to terminal and use this file:

```bash
annotatePeaks.pl path/to/homer_ready_file.txt <genome> > output.txt
```
For more information: [Homer Manual](http://homer.ucsd.edu/homer/ngs/annotation.html)

## License

This package is free software; you can redistribute it and/or modify it
under the terms of the GNU General Public License, version 3, as
published by the Free Software Foundation.

This program is distributed in the hope that it will be useful, but
without any warranty; without even the implied warranty of
merchantability or fitness for a particular purpose.  See the GNU
General Public License for more details.

A copy of the GNU General Public License, version 3, is available at
<https://www.r-project.org/Licenses/GPL-3>