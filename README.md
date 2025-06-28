# multivartie-normality-test-and-correlation

---

````markdown
# 📊 Multivariate Normal Distribution Analysis in R

This repository contains an R script that performs multivariate analysis using simulated data. The script includes:

- Normality testing of multiple variables
- Visualization of individual distributions
- 3D scatter plot of the data
- Interactive calculation of **conditional means** and **covariances** based on user input
- Correlation matrix and heatmap visualization

---

## 📁 Dataset Description

The dataset is a 15×3 matrix created manually to simulate social media behavior:

| Variable       | Description                                                  |
|----------------|--------------------------------------------------------------|
| `time`         | Time spent on social media (in minutes)                      |
| `interations`  | Number of likes/comments during that time                   |
| `followers`    | Percentage of successful followers who interacted with posts |

---

## 🧪 Analysis Performed

### 1. **Data Setup**
The script defines a matrix with three variables and calculates:

- Mean vector `mu`
- Covariance matrix `sigma`

```r
mu <- colMeans(x2)
sigma <- cov(x2)
````

---

### 2. **Normality Check**

Normality is tested for each variable using the **Shapiro-Wilk Test**:

```r
shapiro.test(x2[,1])  # time
shapiro.test(x2[,2])  # interations
shapiro.test(x2[,3])  # followers
```

Histograms with normal distribution curves are plotted for each.

---

### 3. **3D Scatter Plot**

Visualizes the relationships among all three variables using:

```r
scatterplot3d(x2[,1], x2[,2], x2[,3])
```

---

### 4. **Conditional Distribution (Interactive)**

The user is prompted to enter a value (1, 2, or 3) to compute conditional distributions:

```r
x <- scan(n=1)
```

* **1**: Conditions on `time`
* **2**: Conditions on `interations`
* **3**: Conditions on `followers`

Based on the selected variable, the script:

* Partitions the mean vector and covariance matrix
* Computes the **conditional mean** and **conditional covariance matrix**
* Uses the formulas:

  ```r
  cond_mean <- mu1 + sigma12 %*% solve(sigma22) %*% (x3 - mu2)
  cov_cond <- sigma11 - sigma12 %*% solve(sigma22) %*% sigma21
  ```

---

### 5. **Correlation and Heatmap**

A correlation matrix is calculated from the conditional covariance matrix:

```r
cor(cov_cond)
corrplot(cor(cov_cond))
```

---

## 💡 Requirements

The script uses only base R and the following packages:

* `scatterplot3d`
* `corrplot`

Install them (if needed) with:

```r
install.packages("scatterplot3d")
install.packages("corrplot")
```

---

## 📂 File Structure

```
/project-root
  ├── multivariate_analysis.R    # Main R script
  └── README.md                  # Project documentation
```


## 🤝 Contributing

Contributions and suggestions are welcome! Please open an issue or pull request to contribute.

```
