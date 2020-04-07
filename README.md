# Advance Analytics and Visualizations with R
## Objectives:
1. Discuss some of the R packages that improve the efficiency for data analytic
2. Cover the intiutive data analytic tools for analyzing different data sets
3. Apply different visualization tools to demonstrate the data

## Index:
### Section 1: Applying dplyr Package to Increase Efficiency
[dplyr](https://dplyr.tidyverse.org/) package is rooted from the plyr package, developed by [Hadley Wickham](http://hadley.nz/). The package starts with "d" to emphasize the use on "data.frame".  For "list" and "vector", it will be handled by a separated package "purrr", which will be covered in section 2. It is worth to note that the dplyr package has significantly improved the efficiency and computational speed for R users.  It also offers a better readability coding logic for the average R users, especially people who are already fimilar with database query language.
- 1.1: tbl Object & data.frame
- 1.2: Select
- 1.3: Partial Match
- 1.4: Filter
- 1.5: Slice
- 1.6: Mutate
- 1.7: Summarize
- 1.8: Group By
- 1.9: Arrange
- 1.10: Do
- 1.11: dplyr with Database

### Section 2: Applying purrr for List and Vector
R has many packages to process a list or vector of elements.  Among all these packages, [purrr](https://purrr.tidyverse.org/index.html), developed by Hadley Wickham, is one of the most standardized and efficient package to handle lists or vectors computation by replacing many for loop with code that is both more succint and easier to read.  The name "purrr" emphasizes the idea of "pure" functional programming design philosophy rooted in base R.  
- 2.1: Map
- 2.2: Return Data Type from Map
- 2.3: Map a Data Frame
- 2.4: Map over Multiple Inputs

### Section 3: Applying tidyverse for Data Manipulation
The tidyverse is an opinionated collection of R packages designed for data science. As discussed in the previous 2 sections, dplyr and purrr are the two most popular packages in tidyverse for data analytics.  In this section, we combine the use of dplyr and tidyr packages for data cleaning and manipulation.  Even though the main stream for this process is processed with plyr, reshape2, and data.table packages, dplyr and [tidyr](https://tidyr.tidyverse.org/) has been gaining its popularity in the data science industry.
- 3.1: Combine Rows and Columns
- 3.2: Join
- 3.3: Transform Data Format

### Section 4: Applying lattice and ggplot2 for Visualization
In my opinion, visualization is the most important part in data analytics.  Without the intuitive visualization, a research, project, or report will not be able to deliver to the audiences effectively. Base R has some very nice and user-friendly graphical tools. Here, we introduce [lattice](https://www.statmethods.net/advgraphs/trellis.html) and [ggplot2](https://ggplot2.tidyverse.org/) packages to demonstrate the use of visualization in explanatory data analysis in R.  
- 4.1: Base R Graphic Tools
- 4.2: ggplot2 Package
- 4.3: lattice Package
