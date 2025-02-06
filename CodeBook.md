---
title: "R Notebook"
output: html_notebook
---

This is an [R Markdown](http://rmarkdown.rstudio.com) Notebook. When you execute code within the notebook, the results appear beneath the code. 

Try executing this chunk by clicking the *Run* button within the chunk or by placing your cursor inside it and pressing *Ctrl+Shift+Enter*. 

```{r}
plot(cars)
```

Add a new chunk by clicking the *Insert Chunk* button on the toolbar or by pressing *Ctrl+Alt+I*.

When you save the notebook, an HTML file containing the code and output will be saved alongside it (click the *Preview* button or press *Ctrl+Shift+K* to preview the HTML file).

The preview shows you a rendered HTML copy of the contents of the editor. Consequently, unlike *Knit*, *Preview* does not run any R code chunks. Instead, the output of the chunk when it was last run in the editor is displayed.
# Code Book

## Variables in `tidy_data.txt`

### Subject
- Identifier for the subject (1-30).

### Activity Name
- Descriptive name of the activity (e.g., Walking, Sitting).

### Measurements
- TimeBodyAccelerometerMeanX: Mean of time-domain body acceleration in X direction.
- TimeBodyAccelerometerStdX: Standard deviation of time-domain body acceleration in X direction.
- [Other measurements follow similar naming conventions.]

## Summary Calculations
- Each measurement is averaged for each subject and activity combination.
