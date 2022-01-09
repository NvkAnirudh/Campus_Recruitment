# Campus_Recruitment

Campus Recruitment is essential for students as it gives them a chance to go to the recruiters and show their skills directly. Recruiters scrutinize students’ performance very thoroughly, from their high school grades to their grades in recent degrees. However, another factor in evaluating students’ performance is employment tests conducted by colleges or universities. In this project, I estimate the employment test for given high school, secondary education, and degree percentages. I have explored whether the employment test is linearly associated with the degree percentage. I have also compared the means of the employment test across two groups of gender, male and female, using a one-way analysis of variance (ANOVA). 

## Dataset
The dataset consists of 5 variables: gender, ssc_p (Secondary education percentage), hsc_p (High school percentage), degree_p (Degree percentage), and the variable which I estimate using multiplie linear regression etest_p (Employment test percentage). The columns hsc_p and degree_p contained outliers which were removed before the analysis. 

https://www.kaggle.com/niki188/campus-recruitment

## Questions to be answered
1) Is there a linear association between students’ employment test percentages and their high school, secondary education, and degree percentages? Perform this test at the alpha = 0.05 level.
2) Which of the above predictors is a significant predictor of employment test percentage after controlling other two?
3) Does the mean of employment test percentage differ across the male and female students? Perform this test at the alpha = 0.05 level.

Statistical Techniques used: Multiple Linear Regression, Global F-test, MLR inference t-test, One-way analysis of variance (ANOVA), F-test, Pairwise comparisons.
Visualization: Scatter plot

## Conclusion (Results of above questions)
1) There is significant evidence at alpha = 0.05 level of linear association between employment test percentage and high school and/or secondary education and/or degree percentages (p-value < 0.001 and F-statistic > critical value) 
2) We have significant evidence at alpha = 0.05 that high school and secondary education percentages are good predictors of employment test percentage after controlling other respective variables (p-value < 0.05 and t-statistic > critical value). However, the degree percentage is not a good predictor of employment test percentage after controlling for high school and secondary education since there is no significant evidence (p-value > 0.05 and t-statistic < critical value)
3) We have significant evidence at alpha = 0.05 level that there is a difference in employment test percentage among male and female students (p-value < 0.05 and F-statistic > critical value) 

