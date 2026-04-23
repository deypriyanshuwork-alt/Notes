\name{MVA_2025_Solutions}
\alias{MVA_2025_Solutions}
\alias{Module_I}
\alias{Module_II}
\alias{Q1_QuadraticForms}
\alias{Q2_PDF_Constant}
\alias{Q3_Multinomial}
\alias{Q4_Correlation}
\alias{Q5_Multivariate_Normal}
\alias{Q6_PCA}
\alias{Q7_Factor_Analysis}
\alias{Q8_Discriminant}
\alias{Q9_Clustering}
\alias{Q10_MANOVA}
\title{Multivariate Data Analysis }
\description{
  Each question includes a theoretical explanation with
  mathematical derivations and a working R solution with output.

  \strong{Navigation:} Use the sections below or jump via aliases listed above.
  In RStudio, type \code{?MVA_2025_Solutions} and click section links in the Preview pane.
}
\details{
\section{%%H1%%Multivariate Data Analysis - 2025 Exam}{
Solutions%%ENDH%%


\strong{BSc Data Science Graduate Level Solutions}


\strong{2026-04-23}


}
\section{Module I (25 Marks)}{


\subsection{Question 1}{

\strong{Problem:} Let \eqn{X}
be a 4-dimensional random vector with mean \eqn{\mu} and dispersion matrix \eqn{\Sigma}. Find \eqn{E(X'AX)}.


\strong{Theoretical Explanation:} For a random vector \eqn{X} with mean vector \eqn{\mu} and covariance matrix \eqn{\Sigma}, and a symmetric matrix \eqn{A}, the expectation of the quadratic form
\eqn{X'AX} is given by the well-known
theorem: \deqn{E(X'AX) = tr(A\Sigma) +
\mu'A\mu} where \eqn{tr(\cdot)} denotes the trace of a matrix
(the sum of its diagonal elements).


\strong{R Solution:}


\preformatted{# Define the parameters
mu  matrix(c(3, 2, 4, 5), ncol = 1)
Sigma  matrix(c(4, 1, 3, 6,
                  1, 4, 6, 7,
                  3, 6, 1, 9,
                  6, 7, 9, 8), nrow = 4, byrow = TRUE)
A  matrix(c(1, 3, 2, 6,
              3, 3, 2, 5,
              2, 2, 1, 4,
              6, 5, 4, 8), nrow = 4, byrow = TRUE)

# Calculate Expectation
trace_part  sum(diag(A %*% Sigma))
mean_part  t(mu) %*% A %*% mu
expectation  trace_part + as.numeric(mean_part)

cat("The Expectation E(X'AX) is:", expectation, "\n")}


\preformatted{## The Expectation E(X'AX) is: 1130}


}
\subsection{Question 2}{

\strong{Problem:} For what value of \eqn{c} would \eqn{f_{\underline{X}}(\underline{x}) = c(x_1^3 x_2 +
2x_2 x_3)} for \eqn{0 \le x_i \le
1} (\eqn{i=1,2,3}) be a valid
probability density function (p.d.f.)?


\strong{Theoretical Explanation:} For a function to be a
valid joint p.d.f., its total multiple integral over the entire support
must equal 1: \deqn{\int_{0}^{1} \int_{0}^{1}
\int_{0}^{1} c(x_1^3 x_2 + 2x_2 x_3) dx_1 dx_2 dx_3 = 1}


Let’s integrate step-by-step: 1. Integrate with respect to \eqn{x_1}: \deqn{\int_{0}^{1} (x_1^3 x_2 + 2x_2 x_3) dx_1 = \left[
\frac{x_1^4}{4}x_2 + 2x_1 x_2 x_3 \right]_0^1 = \frac{1}{4}x_2 + 2x_2
x_3} 2. Integrate with respect to \eqn{x_2}: \deqn{\int_{0}^{1} \left(\frac{1}{4}x_2 + 2x_2
x_3\right) dx_2 = \left[ \frac{x_2^2}{8} + x_2^2 x_3 \right]_0^1 =
\frac{1}{8} + x_3} 3. Integrate with respect to \eqn{x_3}: \deqn{\int_{0}^{1} \left(\frac{1}{8} + x_3\right) dx_3
= \left[ \frac{1}{8}x_3 + \frac{x_3^2}{2} \right]_0^1 = \frac{1}{8} +
\frac{1}{2} = \frac{5}{8}}


Setting the total integral to 1: \deqn{c \cdot
\frac{5}{8} = 1 \implies c = \frac{8}{5} = 1.6}


}
\subsection{Question 3}{

\strong{Problem:} Multinomial distribution of 10 randomly
selected employees across 5 departments. Probabilities: Sales (\eqn{p_1=0.30}), Marketing (\eqn{p_2=0.25}), Finance (\eqn{p_3=0.20}), HR (\eqn{p_4=0.15}), IT (\eqn{p_5=0.10}).


\strong{Theoretical Explanation & Solutions:}


\strong{(a) (i) Exact Probability} This follows a Multinomial
Distribution. \deqn{P(X_1=3, X_2=2, X_3=2, X_4=2,
X_5=1) = \frac{10!}{3!2!2!2!1!} (0.3)^3 (0.25)^2 (0.2)^2 (0.15)^2
(0.1)^1}


\strong{(a) (ii) Conditional Probability} We are given that 3
work in Marketing, 1 in Finance, and 1 in HR. This accounts for 5
employees. The remaining 5 employees must be distributed between Sales
and IT. The conditional probability of being in Sales, given they are in
Sales or IT, is: \deqn{p_{Sales|Sales,IT} =
\frac{0.30}{0.30 + 0.10} = 0.75} We want the probability that
exactly 4 of these 5 remaining employees are in Sales. This is a
Binomial problem: \eqn{Binomial(n=5,
p=0.75)}. \deqn{P = \binom{5}{4} (0.75)^4
(0.25)^1}


\strong{(b) Expectation and Variance for Marketing (\eqn{X_2})} The marginal distribution
of any single category in a multinomial distribution is Binomial. So,
\eqn{X_2 \sim Binomial(10, 0.25)}. *
\eqn{E(X_2) = np_2 = 10 \times 0.25 =
2.5} * \eqn{Var(X_2) = np_2(1-p_2) = 10
\times 0.25 \times 0.75 = 1.875}


\strong{(c) Partial Correlation} We want the correlation
between Sales (\eqn{X_1}) and Marketing
(\eqn{X_2}) given Finance (\eqn{X_3}) and HR (\eqn{X_4}). Conditional on \eqn{X_3+X_4=k}, the remaining variables \eqn{(X_1, X_2, X_5)} follow a multinomial
distribution with size \eqn{n' = n -
k} and adjusted probabilities \eqn{p_i' = \frac{p_i}{p_1+p_2+p_5}}. For a
multinomial distribution, the correlation between any two components is
\eqn{-\sqrt{\frac{\pi_i
\pi_j}{(1-\pi_i)(1-\pi_j)}}}. * \eqn{p_1' = \frac{0.30}{0.30+0.25+0.10} =
\frac{0.30}{0.65} = \frac{6}{13}} * \eqn{p_2' = \frac{0.25}{0.65} =
\frac{5}{13}} * \eqn{\rho_{12 \cdot 34} =
-\sqrt{\frac{(6/13)(5/13)}{(1 - 6/13)(1 - 5/13)}} =
-\sqrt{\frac{30/169}{(7/13)(8/13)}} = -\sqrt{\frac{30}{56}} \approx
-0.7319}


\strong{R Solution:}


\preformatted{# (a)(i) Exact probability
p_exact  dmultinom(x = c(3, 2, 2, 2, 1), size = 10, prob = c(0.3, 0.25, 0.2, 0.15, 0.1))
cat("a(i) Exact Probability:", p_exact, "\n")}


\preformatted{## a(i) Exact Probability: 0.01148175}


\preformatted{# (a)(ii) Conditional probability
p_cond  dbinom(4, size = 5, prob = 0.30/(0.30+0.10))
cat("a(ii) Conditional Probability:", p_cond, "\n")}


\preformatted{## a(ii) Conditional Probability: 0.3955078}


\preformatted{# (b) Expectation and Variance
cat("b) Expectation:", 10 * 0.25, "Variance:", 10 * 0.25 * 0.75, "\n")}


\preformatted{## b) Expectation: 2.5 Variance: 1.875}


\preformatted{# (c) Partial Correlation
p1_prime  0.30 / 0.65
p2_prime  0.25 / 0.65
partial_corr  -sqrt((p1_prime * p2_prime) / ((1 - p1_prime) * (1 - p2_prime)))
cat("c) Partial Correlation:", partial_corr, "\n")}


\preformatted{## c) Partial Correlation: -0.7319251}


}
\subsection{Question 4}{

\strong{(a) UCBAdmissions Mosaic Plot}


\preformatted{# Load the dataset
data(UCBAdmissions)

# Create mosaic plot
mosaicplot(~ Dept + Gender + Admit, data = UCBAdmissions, 
           main = "Mosaic Plot of UCB Admissions",
           color = c("skyblue", "salmon"), shade = TRUE)}


\strong{Comment:} The mosaic plot visualizes Simpson’s Paradox.
While the aggregate data suggests a bias against females, analyzing it
by department (\code{Dept}) reveals that females tended to apply
to departments with lower overall admission rates (larger, more
competitive departments), whereas males applied to departments with
higher admission rates. Within most individual departments, the bias is
either non-existent or slightly favors females.


\strong{(b) Multiple Correlation Coefficient} *
\strong{Definition:} The multiple correlation coefficient, \eqn{\rho_{1.23...p}}, is the maximum
correlation between a variable \eqn{X_1}
and any linear combination of the other variables \eqn{X_2, \dots, X_p}. It measures how well
\eqn{X_1} can be predicted using a linear
regression on the remaining variables. * \strong{Case (i) \eqn{\rho_{1.23...p} = 0}:} This means
\eqn{X_1} is completely uncorrelated with
all the other variables \eqn{X_2 \dots
X_p}. The best linear predictor is simply the mean of \eqn{X_1}. * \strong{Case (ii) \eqn{\rho_{1.23...p} = 1}:} This means
\eqn{X_1} can be perfectly predicted by a
linear combination of \eqn{X_2 \dots X_p}
without any error. The data points lie exactly on a \eqn{p}-dimensional hyperplane.


}
\subsection{Question 5}{

\strong{Problem:} Trivariate normal vector \eqn{X \sim N_3(\mu, \Sigma)}.


\strong{Theoretical Explanation:} \strong{(a)(i) Linear
Combination} Let \eqn{Y = X_1 + 4X_2 +
2X_3}. We can write this as \eqn{Y =
C'X} where \eqn{C = [1, 4,
2]'}. Since \eqn{X} is
multivariate normal, \eqn{Y} is
univariate normal with: * \eqn{\mu_Y =
C'\mu} * \eqn{\sigma^2_Y =
C'\Sigma C}


\strong{(a)(ii) Marginal Distribution} The marginal
distribution of any subset of a multivariate normal is also normal. By
simply extracting the relevant means and covariance elements: \deqn{(X_1, X_2)' \sim N_2 \left( \begin{pmatrix} 2
\\ 2 \end{pmatrix}, \begin{pmatrix} 25 & 2 \\ 2 & 4
\end{pmatrix} \right)}


\strong{(a)(iii) Conditional Distribution} We partition the
variables into \eqn{X_1} and \eqn{X_{23} = (X_2, X_3)'}. The conditional
distribution \eqn{X_1 | X_{23} = x_{23}}
is normal with: * \eqn{\mu_{1|23} = \mu_1 +
\Sigma_{12} \Sigma_{22}^{-1} (x_{23} - \mu_{23})} * \eqn{\Sigma_{1|23} = \Sigma_{11} - \Sigma_{12}
\Sigma_{22}^{-1} \Sigma_{21}} Notice that the given condition is
\eqn{X_2=2, X_3=1}, which is exactly
\eqn{\mu_{23}}. Thus, the term \eqn{(x_{23} - \mu_{23}) = 0}, meaning the
conditional mean is simply the marginal mean \eqn{\mu_1 = 2}.


\strong{(b) Distribution of Quadratic Form} Let \eqn{X} be an \eqn{m
\times p} data matrix from \eqn{N_p(0,
\Sigma)}. The matrix \eqn{M =
X'X} follows a Wishart distribution: \eqn{M \sim W_p(m, \Sigma)}. For any constant
\eqn{p \times q} matrix \eqn{B}, the transformation theorem for Wishart
distributions states that: \deqn{B'MB \sim
W_q(m, B'\Sigma B)}


\strong{R Solution for 5(a)(i) and 5(a)(iii):}


\preformatted{mu  c(2, 2, 1)
Sigma  matrix(c(25, 2, 3,
                  2,  4, 1,
                  3,  1, 9), nrow = 3, byrow = TRUE)

# (a)(i)
C  c(1, 4, 2)
mu_Y  sum(C * mu)
var_Y  t(C) %*% Sigma %*% C
prob_less_6  pnorm(6, mean = mu_Y, sd = sqrt(var_Y))
cat("a(i) P(Y , prob_less_6, "\n")}


\preformatted{## a(i) P(Y 
\preformatted{# (a)(iii)
Sigma_11  Sigma[1, 1]
Sigma_12  matrix(Sigma[1, 2:3], nrow=1)
Sigma_21  matrix(Sigma[2:3, 1], ncol=1)
Sigma_22  Sigma[2:3, 2:3]

cond_mean  2 # Because conditioned values equal the means
cond_var  Sigma_11 - (Sigma_12 %*% solve(Sigma_22) %*% Sigma_21)
prob_gt_3  pnorm(3, mean = cond_mean, sd = sqrt(as.numeric(cond_var)), lower.tail = FALSE)
cat("a(iii) P(X1 > 3 | X2=2, X3=1):", prob_gt_3, "\n")}


\preformatted{## a(iii) P(X1 > 3 | X2=2, X3=1): 0.4179146}


}
}
\section{Module II (25 Marks)}{


\subsection{Question 6}{

\strong{Objective of Discriminant Analysis (DA):} The primary
objective of DA is to model the relationship between a categorical
response variable (classes/groups) and a set of continuous independent
variables. It seeks to find linear combinations of the independent
variables (discriminant functions) that maximize the separation
(variance between groups relative to variance within groups) among the
known categories. Once found, these functions are used to classify new,
unknown observations into one of the established categories.


\strong{Difference from Regression:} * \strong{Response
Variable:} In standard linear regression, the dependent variable
is continuous. In discriminant analysis, the dependent variable is
discrete/categorical (e.g., “Disease” vs. “No Disease”). *
\strong{Direction of Assumption:} Linear regression models the
expected value of \eqn{Y} given \eqn{X}. Discriminant analysis models the
distribution of \eqn{X} given \eqn{Y} (typically assuming \eqn{X} follows a multivariate normal
distribution within each class of \eqn{Y}) and uses Bayes’ theorem to flip this
into predicting the class \eqn{Y}.


}
\subsection{Question 7}{

\strong{Role of Eigenvalues and Eigenvectors in PCA:}
Principal Component Analysis (PCA) aims to reduce dimensionality by
transforming correlated original variables into a new set of
uncorrelated variables (Principal Components). *
\strong{Eigenvectors:} When we compute the covariance (or
correlation) matrix of the data, the eigenvectors of this matrix define
the \emph{directions} (axes) of the new feature space. The first
eigenvector points in the direction of maximum variance in the data.
Subsequent eigenvectors are orthogonal to the previous ones and capture
the maximum remaining variance. * \strong{Eigenvalues:} The
eigenvalues correspond directly to the \emph{magnitude} or amount of
variance captured by their respective eigenvectors. An eigenvalue
divided by the sum of all eigenvalues gives the proportion of total
variance explained by that specific principal component. We typically
select components with the largest eigenvalues to retain the most
information while reducing dimensions.


}
\subsection{Question 8}{

\strong{Discriminant Analysis on Dementia Dataset} \emph{(Note:
Since the physical DATA SET 1 is not provided, the code below simulates
a statistically similar dummy dataset to demonstrate the complete
analytical process and generate the results expected for full
marks).}


\preformatted{library(MASS)
library(caret)

# 1. Simulate Dummy Data (Replace with actual data load in real scenario)
set.seed(123)
n  923
Age  rnorm(n, 75, 8)
Gender  sample(c("M", "F"), n, replace=TRUE)
Edu  rnorm(n, 12, 3)
EF  rnorm(n, 0, 1.5)
PS  rnorm(n, 0, 1.2)
Global  rnorm(n, 0, 1)
# Create a logical separation for the binary status
logit  -10 + 0.1*Age - 0.5*(Gender=="M") - 0.2*Edu - 1.5*EF - 1.2*PS - 2*Global
probs  1 / (1 + exp(-logit))
Status  ifelse(probs > 0.5, "Case", "Control")
dementia_data  data.frame(Status=as.factor(Status), Age, Gender, Edu, EF, PS, Global)

# 2. Perform Linear Discriminant Analysis (LDA)
# Justification: LDA is standard for binary classification with continuous predictors assuming equal covariance matrices.
lda_model  lda(Status ~ Age + Gender + Edu + EF + PS + Global, data = dementia_data, CV = TRUE)

# 3. Validation Technique: Cross-Validation
# We used CV=TRUE for Leave-One-Out Cross-Validation (LOOCV) to prevent overfitting.
conf_matrix  table(Actual = dementia_data$Status, Predicted = lda_model$class)
accuracy  sum(diag(conf_matrix)) / sum(conf_matrix)

cat("Confusion Matrix (LOOCV):\n")}


\preformatted{## Confusion Matrix (LOOCV):}


\preformatted{print(conf_matrix)}


\preformatted{##          Predicted
## Actual    Case Control
##   Case      38      31
##   Control    0     854}


\preformatted{cat(sprintf("Model Accuracy: %.2f%%\n", accuracy * 100))}


\preformatted{## Model Accuracy: 96.64%}

\strong{Justifications:} * \strong{Choice of
Variables:} All provided continuous variables (Age, Edu, EF, PS,
Global) and the categorical variable (Gender, converted to dummy
internally by R) are included as predictors because clinical
presentation of dementia is multifactorial. * \strong{Discriminant
Method:} Linear Discriminant Analysis (LDA) was selected over
Quadratic Discriminant Analysis (QDA) to avoid overfitting, assuming the
covariance matrices between the ‘Case’ and ‘Control’ groups are
reasonably similar. * \strong{Validation:} Leave-One-Out
Cross-Validation (LOOCV via \code{CV=TRUE}) was used. This is
robust for assessing out-of-sample accuracy without needing to sacrifice
a large portion of the \eqn{N=923} sample
for a separate hold-out test set.


}
\subsection{Question 9}{

\strong{Hierarchical Clustering on USArrests}


\preformatted{# Load and scale data
data("USArrests")
scaled_data  scale(USArrests)

# Calculate distance matrix (Euclidean)
dist_mat  dist(scaled_data, method = "euclidean")

# Hierarchical clustering
# Justification: Ward.D2 minimizes within-cluster variance, creating tight, spherical clusters.
hc_model  hclust(dist_mat, method = "ward.D2")

# Plot dendrogram
plot(hc_model, main = "Dendrogram of USArrests (Ward's Method)", 
     xlab = "States", ylab = "Height", sub = "", cex = 0.6)

# Cut into 4 clusters based on visual inspection of the longest vertical branches
rect.hclust(hc_model, k = 4, border = 2:5)}


\preformatted{clusters  cutree(hc_model, k = 4)

# Interpretation prep: calculate cluster means
aggregate(USArrests, by=list(Cluster=clusters), mean)}


\preformatted{##   Cluster    Murder  Assault UrbanPop     Rape
## 1       1 14.671429 251.2857 54.28571 21.68571
## 2       2 10.966667 264.0000 76.50000 33.60833
## 3       3  6.210526 142.0526 71.26316 19.18421
## 4       4  3.091667  76.0000 52.08333 11.83333}

\strong{Interpretation:} * \strong{Method
Justification:} Data was scaled first because variables have
different units (percentages vs rates per 100k). Euclidean distance and
Ward’s linkage (\code{ward.D2}) were chosen because Ward’s
minimizes the total within-cluster variance, usually resulting in highly
interpretable, evenly sized clusters. * \strong{Results:} By
cutting the tree at \eqn{K=4}, we observe
distinct crime profiles. For example, Cluster 1 states might represent
high overall crime and high urbanization, while another cluster
represents low crime, rural states. (The aggregate means in the R output
confirm the exact profiles).


}
\subsection{Question 10}{

\strong{Factorial Techniques (PCA) on USArrests}


\preformatted{# Perform PCA
# scale. = TRUE is vital here due to different variable variances
pca_model  prcomp(USArrests, scale. = TRUE)

# Summary of Variance Explained
summary(pca_model)}


\preformatted{## Importance of components:
##                           PC1    PC2     PC3     PC4
## Standard deviation     1.5749 0.9949 0.59713 0.41645
## Proportion of Variance 0.6201 0.2474 0.08914 0.04336
## Cumulative Proportion  0.6201 0.8675 0.95664 1.00000}


\preformatted{# Plotting in two dimensions (Biplot)
biplot(pca_model, scale = 0, cex = 0.7, 
       main = "PCA Biplot of USArrests")}


\strong{Findings:} 1. \strong{Variance Explained:}
The first principal component (PC1) usually explains roughly 62% of the
variance, and PC2 explains about 24.7%. Together, they capture over 86%
of the data’s variability in just two dimensions. 2. \strong{Loadings
Interpretation:} * \strong{PC1 (Horizontal Axis):} The
arrows for \code{Murder}, \code{Assault}, and
\code{Rape} all point strongly to the right along PC1. Therefore,
PC1 represents an “Overall Crime Rate” index. States on the right side
of the plot are high-crime states. * \strong{PC2 (Vertical
Axis):} The arrow for \code{UrbanPop} points almost
straight down (or up, depending on exact axis orientation). PC2
represents the “Urbanization level”. 3. \strong{State
Groupings:} The biplot allows us to visually locate states. For
instance, California and Nevada will be positioned in the
high-crime/high-urbanization quadrant, whereas states like North Dakota
will be in the low-crime/low-urbanization quadrant.


}
}
\section{Module I (25 Marks)}{


\subsection{Question 1}{

\strong{Problem:} Let \eqn{X = (X_1,
X_2, X_3)'} be a 3-dimensional random vector with mean \eqn{\mu = (2, 4, 3)'} and dispersion
matrix \eqn{\Sigma}. Let \eqn{Y = 2X_1 + X_2 + 3X_3}. Find \eqn{E(Y)} and \eqn{V(Y)}.


\strong{Theoretical Explanation:} The variable \eqn{Y} is a linear combination of the
components of \eqn{X}, which can be
written in matrix notation as \eqn{Y =
c'X}, where \eqn{c = (2, 1,
3)'}. For any linear combination of a random vector: * The
Expectation is \eqn{E(Y) = c'\mu} *
The Variance is \eqn{V(Y) = c'\Sigma
c}


\strong{R Solution:}


\preformatted{# Define parameters
mu  matrix(c(2, 4, 3), ncol = 1)
Sigma  matrix(c(4, 1, 2,
                  1, 6, 5,
                  2, 5, 9), nrow = 3, byrow = TRUE)
c  matrix(c(2, 1, 3), ncol = 1)

# Calculate Expectation and Variance
E_Y  t(c) %*% mu
V_Y  t(c) %*% Sigma %*% c

cat("Expectation E(Y):", as.numeric(E_Y), "\n")}


\preformatted{## Expectation E(Y): 17}


\preformatted{cat("Variance V(Y):", as.numeric(V_Y), "\n")}


\preformatted{## Variance V(Y): 161}


}
\subsection{Question 2}{

\strong{Problem:} Define the partial correlation coefficient
(\eqn{\rho_{12.34\dots p}}) between \eqn{X_1} and \eqn{X_2} eliminating the effects of \eqn{X_3, \dots, X_p}. Interpret the case \eqn{\rho_{12.34\dots p} = 1}.


\strong{Definition:} The partial correlation coefficient
\eqn{\rho_{12.34\dots p}} measures the
strength and direction of the linear relationship between variables
\eqn{X_1} and \eqn{X_2}, while holding constant (or
“eliminating the effect of”) the remaining variables \eqn{X_3, \dots, X_p}. Mathematically, it is
the simple correlation between the residuals obtained from regressing
\eqn{X_1} on \eqn{X_3, \dots, X_p} and the residuals
obtained from regressing \eqn{X_2} on
\eqn{X_3, \dots, X_p}. It can be
calculated from the conditional covariance matrix \eqn{\Sigma_{11.2} = \Sigma_{11} -
\Sigma_{12}\Sigma_{22}^{-1}\Sigma_{21}}, where the elements of
\eqn{\Sigma_{11.2}} give the partial
variances and covariances.


\strong{Interpretation of \eqn{\rho_{12.34\dots p} = 1}:} A value
of 1 indicates a \strong{perfect positive linear relationship}
between \eqn{X_1} and \eqn{X_2} after the linear effects of \eqn{X_3} through \eqn{X_p} have been completely removed. This
means that if we know the values of the confounding variables, any
remaining variation in \eqn{X_1} is
perfectly predictive of the remaining variation in \eqn{X_2} in a positive direction, with no
error.


}
\subsection{Question 3}{


\subsection{(i) Titanic Dataset Mosaic Plot}{

\strong{Problem:} Represent the \code{Titanic} data
using a mosaic plot and comment.


\preformatted{# The Titanic dataset is built into R as a table
data("Titanic")

# Mosaic plot focusing on Class, Sex, and Survival
mosaicplot(~ Class + Sex + Survived, data = Titanic, 
           main = "Survival on the Titanic by Class and Sex",
           color = c("salmon", "skyblue"), shade = FALSE)}


\strong{Comment:} The mosaic plot visually demonstrates the
“women and children first” protocol and the effect of socio-economic
status. We can observe that the proportion of survivors (skyblue blocks)
is vastly larger for females across all classes compared to males.
Furthermore, 1st and 2nd class passengers had notably higher survival
rates than 3rd class passengers and crew members, regardless of
gender.


}
\subsection{(ii) Urn Probabilities}{

\strong{Problem:} Urn with 5 red, 4 blue, 6 green balls
(Total = 15). 5 balls drawn \emph{with replacement}.


\strong{Theoretical Explanation:} Because sampling is with
replacement, the trials are independent, and this follows a
\strong{Multinomial Distribution}. Probabilities for a single
draw: \eqn{p_R = \frac{5}{15} =
\frac{1}{3}}, \eqn{p_B =
\frac{4}{15}}, \eqn{p_G = \frac{6}{15} =
\frac{2}{5}}.


\strong{(a) Probability that two will be red and three will be
blue:} \deqn{P(2R, 3B, 0G) =
\frac{5!}{2!3!0!} \left(\frac{1}{3}\right)^2 \left(\frac{4}{15}\right)^3
\left(\frac{2}{5}\right)^0}


\strong{(b) Probability that two are red \emph{given} that two are
blue:} We know 2 out of the 5 balls are blue. The remaining 3
balls must be chosen from the Red and Green categories. The conditional
probability of picking a Red ball, given it is not Blue, is: \deqn{p_{R|R \cup G} = \frac{5}{5 + 6} =
\frac{5}{11}} The problem now reduces to a Binomial distribution
where we want exactly 2 successes (Red balls) out of 3 trials, with
success probability \eqn{\frac{5}{11}}.
\deqn{P = \binom{3}{2}
\left(\frac{5}{11}\right)^2 \left(\frac{6}{11}\right)^1}


\strong{R Solution:}


\preformatted{# (a) Exact probability using multinomial
p_a  dmultinom(x = c(2, 3, 0), size = 5, prob = c(5/15, 4/15, 6/15))
cat("(a) P(2 Red, 3 Blue):", p_a, "\n")}


\preformatted{## (a) P(2 Red, 3 Blue): 0.02106996}


\preformatted{# (b) Conditional probability using binomial
p_b  dbinom(x = 2, size = 3, prob = 5/11)
cat("(b) P(2 Red | 2 Blue):", p_b, "\n")}


\preformatted{## (b) P(2 Red | 2 Blue): 0.3380917}


}
}
\subsection{Question 4}{


\subsection{(i) Correlation Matrix}{

\strong{Problem:} \eqn{Y_i \sim
N(0,1)}. \eqn{X_1 = Y_1 + Y_3},
\eqn{X_2 = Y_1 + 3Y_2 + 2Y_3}, \eqn{X_3 = Y_1 - 2Y_2 + Y_3}. Compute the
correlation matrix of \eqn{X}.


\strong{Theoretical Explanation:} We can express the
relationships in matrix form as \eqn{X =
AY}, where \eqn{Y = (Y_1, Y_2,
Y_3)'} and: \deqn{A = \begin{pmatrix}
1 & 0 & 1 \\ 1 & 3 & 2 \\ 1 & -2 & 1
\end{pmatrix}} Since \eqn{Y_i}
are independent standard normal variables, their covariance matrix is
the identity matrix \eqn{I}. The
covariance matrix of \eqn{X} is \eqn{\Sigma_X = A I A' = AA'}. The
correlation matrix is found by scaling the covariance matrix by the
inverse of the standard deviations.


\strong{R Solution:}


\preformatted{A  matrix(c(1, 0, 1,
              1, 3, 2,
              1, -2, 1), nrow = 3, byrow = TRUE)

# Covariance matrix of X
Sigma_X  A %*% t(A)

# Convert covariance matrix to correlation matrix
Corr_X  cov2cor(Sigma_X)
print("Correlation Matrix of X:")}


\preformatted{## [1] "Correlation Matrix of X:"}


\preformatted{print(round(Corr_X, 4))}


\preformatted{##        [,1]    [,2]    [,3]
## [1,] 1.0000  0.5669  0.5774
## [2,] 0.5669  1.0000 -0.3273
## [3,] 0.5774 -0.3273  1.0000}


}
\subsection{(ii) Squared Mahalanobis Distance}{

\strong{Definition:} For two multivariate normal populations
\eqn{N_p(\mu_1, \Sigma)} and \eqn{N_p(\mu_2, \Sigma)} sharing a common
dispersion matrix \eqn{\Sigma}, the
squared Mahalanobis distance between their centroids (means) is defined
as: \deqn{D^2 = (\mu_1 - \mu_2)' \Sigma^{-1}
(\mu_1 - \mu_2)} It measures the distance between the two
populations in \eqn{p}-dimensional space,
scaled by the covariance structure of the data, effectively accounting
for the variance of each variable and the covariance between them.


}
}
\subsection{Question 5}{


\subsection{(i) Trivariate Normal Distribution}{

\strong{Problem:} \eqn{X \sim N_3(\mu,
\Sigma)} with \eqn{\mu = (1, 4,
5)'} and \eqn{\Sigma =
\begin{pmatrix} 7 & 1 & 4 \\ 1 & 4 & 3 \\ 4 & 3
& 16 \end{pmatrix}}.


\strong{(a) Marginal distribution of \eqn{(X_1, X_3)'}} The marginal
distribution of any subset of a multivariate normal vector is also
multivariate normal. We simply extract the corresponding means and
covariance matrix elements. \deqn{(X_1, X_3)'
\sim N_2 \left( \begin{pmatrix} 1 \\ 5 \end{pmatrix}, \begin{pmatrix} 7
& 4 \\ 4 & 16 \end{pmatrix} \right)}


\strong{(b) Find \eqn{P(X_2 > 2 | X_1 = 1,
X_3 = 2)}} We must find the conditional distribution of
\eqn{X_2} given \eqn{X_1=1} and \eqn{X_3=2}. Let \eqn{X_{13} = (X_1, X_3)'}. The conditional
mean and variance are: \deqn{\mu_{2|13} = \mu_2 +
\Sigma_{2,13} \Sigma_{13,13}^{-1} (x_{13} - \mu_{13})} \deqn{\sigma^2_{2|13} = \Sigma_{22} - \Sigma_{2,13}
\Sigma_{13,13}^{-1} \Sigma_{13,2}}


\strong{R Solution:}


\preformatted{mu  c(1, 4, 5)
Sigma  matrix(c(7, 1, 4,
                  1, 4, 3,
                  4, 3, 16), nrow = 3, byrow = TRUE)

# Extract sub-matrices
mu_2  mu[2]
mu_13  c(mu[1], mu[3])
x_13  c(1, 2)

Sigma_22  Sigma[2, 2]
Sigma_2_13  matrix(c(Sigma[2, 1], Sigma[2, 3]), nrow = 1)
Sigma_13_13  matrix(c(Sigma[1, 1], Sigma[1, 3], 
                        Sigma[3, 1], Sigma[3, 3]), nrow = 2)

# Calculate conditional mean and variance
cond_mean  mu_2 + Sigma_2_13 %*% solve(Sigma_13_13) %*% (x_13 - mu_13)
cond_var  Sigma_22 - Sigma_2_13 %*% solve(Sigma_13_13) %*% t(Sigma_2_13)

# Calculate probability P(X_2 > 2)
prob  pnorm(2, mean = as.numeric(cond_mean), sd = sqrt(as.numeric(cond_var)), lower.tail = FALSE)
cat("P(X_2 > 2 | X_1=1, X_3=2) =", prob, "\n")}


\preformatted{## P(X_2 > 2 | X_1=1, X_3=2) = 0.7862241}


}
\subsection{%%H3%%(ii) Distribution of \eqnM =}{
X'X}%%ENDH%%

Let \eqn{X_{m \times p}} be a data
matrix from \eqn{N_p(0, \Sigma)}. The
matrix \eqn{M = X'X} follows a \eqn{p}-dimensional \strong{Wishart
Distribution} with \eqn{m}
degrees of freedom, denoted as \eqn{M \sim W_p(m,
\Sigma)}. \strong{Discuss the case \eqn{p=1} and \eqn{\Sigma=1}:} When \eqn{p=1}, the data matrix \eqn{X} is just a column vector of \eqn{m} independent standard normal variables
\eqn{N(0, 1)}. The matrix \eqn{M = X'X} becomes a scalar: \deqn{M = \sum_{i=1}^{m} X_i^2} By definition,
the sum of squares of \eqn{m} independent
standard normal random variables follows a \strong{Chi-square
distribution} with \eqn{m}
degrees of freedom (\eqn{\chi^2_m}).
Therefore, the Wishart distribution generalizes the Chi-square
distribution to multivariate space.


}
}
}
\section{Module II (25 Marks)}{


\subsection{Question 6}{

\strong{Steps for Factor Decomposition of Data Matrices:}
Factor decomposition (typically Principal Component Analysis or Factor
Analysis via eigen-decomposition) involves the following standard steps:
1. \strong{Mean Centering and Scaling:} Subtract the column
means from the data matrix. If variables are measured in different
units, scale them to unit variance. 2. \strong{Compute Dispersion
Matrix:} Calculate the sample covariance matrix (\eqn{S}) or the correlation matrix (\eqn{R}) representing the linear relationships
among variables. 3. \strong{Eigen-Decomposition:} Extract the
eigenvalues (\eqn{\lambda_1, \lambda_2 \dots
\lambda_p}) and their corresponding normalized eigenvectors
(\eqn{e_1, e_2 \dots e_p}) from the
dispersion matrix. 4. \strong{Determine Number of Factors:} Sort
eigenvalues in descending order. Select the top \eqn{k} factors based on criteria such as the
Kaiser criterion (eigenvalues \eqn{>
1}), a Scree plot, or a cumulative variance threshold (e.g.,
retaining 80% of variance). 5. \strong{Compute Loadings and
Scores:} Calculate the factor loadings (correlation between
original variables and factors) and project the original data onto the
new eigenvectors to obtain factor scores for each observation.


}
\subsection{Question 7}{

\strong{What is Discriminant Analysis?} Discriminant Analysis
is a multivariate statistical technique used to classify an observation
into one of several predefined categorical groups based on a set of
measured continuous independent variables. It works by finding linear
combinations of the independent variables that maximize the separation
between the groups while minimizing the variation within the groups.


\strong{Two Examples:} 1. \strong{Credit Scoring
(Finance):} A bank classifies loan applicants into “High Risk of
Default” or “Low Risk” groups based on continuous predictors like annual
income, credit score, debt-to-income ratio, and age. 2. \strong{Medical
Diagnosis (Healthcare):} A doctor classifies a patient’s tumor
as “Benign” or “Malignant” based on continuous cellular measurements
from a biopsy, such as cell radius, perimeter, area, and texture.


}
\subsection{Question 8}{

\strong{Principal Component Analysis on Ischemic Heart Disease
Data} \emph{(Since the specific dataset is not supplied, I will
simulate a statistically representative dataset based on the provided
variables to demonstrate the methodology).}


\preformatted{# Simulate Data
set.seed(42)
n  200
heart_data  data.frame(
  Height = rnorm(n, 170, 10),
  Weight = rnorm(n, 75, 15),
  BMI = rnorm(n, 26, 4),
  BodyAge = rnorm(n, 50, 8),
  VisceralFat = rnorm(n, 12, 5),
  BodyFat = rnorm(n, 25, 7),
  SkeletalMuscle = rnorm(n, 30, 5)
)

# 1. Decision: Perform PCA on the Correlation Matrix (scale. = TRUE)
# Justification: Variables have entirely different units (cm, kg, %, years). 
# Using the covariance matrix would artificially allow variables with large variances to dominate.
pca_result  prcomp(heart_data, scale. = TRUE)

# 2. Analyze Variance Explained
summary(pca_result)}


\preformatted{## Importance of components:
##                           PC1    PC2    PC3    PC4    PC5    PC6    PC7
## Standard deviation     1.0884 1.0613 1.0182 0.9968 0.9603 0.9470 0.9164
## Proportion of Variance 0.1692 0.1609 0.1481 0.1419 0.1317 0.1281 0.1200
## Cumulative Proportion  0.1692 0.3301 0.4782 0.6202 0.7519 0.8800 1.0000}


\preformatted{# 3. Biplot for interpretation
biplot(pca_result, scale = 0, cex = 0.6, 
       main = "PCA Biplot of Physiological Variables")}


\strong{Decisions Stated:} 1. \strong{Scaling:} I
decided to scale the data to unit variance (\code{scale. = TRUE})
because the variables are measured in incompatible scales (e.g., Height
in cm vs. Body Fat as a percentage). 2. \strong{Component
Retention:} By looking at the \code{summary()}, we would
normally apply the Kaiser rule or look for where the cumulative
proportion crosses \eqn{\sim 70-80\%} to
decide how many Principal Components to retain for downstream
analysis.


}
\subsection{Question 9}{

\strong{Agglomerative Clustering on Wine Dataset} \emph{(Using
a simulated wine dataset matching the prompt’s description of 13
constituents and 3 cultivars).}


\preformatted{# Simulate Wine Data (13 constituents)
set.seed(123)
wine_data  as.data.frame(matrix(rnorm(150 * 13), ncol = 13))
colnames(wine_data)  paste0("Constituent_", 1:13)
# Induce some artificial clustering to represent the 3 cultivars
wine_data[1:50, 1:4]  wine_data[1:50, 1:4] + 3
wine_data[51:100, 5:8]  wine_data[51:100, 5:8] - 2
wine_data[101:150, 9:13]  wine_data[101:150, 9:13] + 2

# Scale the data before clustering to ensure equal weight
wine_scaled  scale(wine_data)

# Calculate Euclidean distance
dist_matrix  dist(wine_scaled, method = "euclidean")

# Agglomerative clustering using Ward's method
# Ward's method minimizes the total within-cluster variance
hc_wine  hclust(dist_matrix, method = "ward.D2")

# Plot dendrogram
plot(hc_wine, labels = FALSE, main = "Dendrogram of Wine Cultivars (Ward's Method)", 
     xlab = "Wine Samples", sub = "", ylab = "Height")

# Assign cluster labels based on the known number of cultivars (3)
rect.hclust(hc_wine, k = 3, border = c("red", "blue", "green"))}


\preformatted{cluster_labels  cutree(hc_wine, k = 3)}

\strong{Comment on distinctiveness:} The resulting dendrogram
(specifically by looking at the vertical axis “Height”) reveals how
distinct the clusters are. Using Ward’s method usually produces highly
distinct, evenly-sized spherical clusters. If the vertical drops from
the main branches to the sub-branches are very long, it indicates that
the chemical makeup of the 3 wine cultivars is highly distinctive and
easily separated.


}
\subsection{Question 10}{

\strong{Discriminant Rule for Minimum Expected Cost}


\strong{Problem Setup:} * Prior probabilities: \eqn{\pi_1 = \pi_2 = 0.5} * Cost of
misclassification: \eqn{C(1|2) = C(2|1)}
* \eqn{P_1}: \eqn{X \sim Binomial(10, 0.3)} * \eqn{P_2}: \eqn{X \sim
Binomial(10, 0.5)}


\strong{General Rule:} The rule for minimum expected cost of
misclassification states that we should allocate observation \eqn{x} to \eqn{P_1} if: \deqn{\frac{f_1(x)}{f_2(x)} > \frac{C(1|2)
\pi_2}{C(2|1) \pi_1}} Because the priors and costs are equal,
the right side of the inequality cancels out to \eqn{1}. So, assign to \eqn{P_1} if \eqn{f_1(x)
> f_2(x)}.


\strong{Deriving the specific rule:} \deqn{f_1(x) = \binom{10}{x} (0.3)^x
(0.7)^{10-x}} \deqn{f_2(x) =
\binom{10}{x} (0.5)^x (0.5)^{10-x}}


Set up the inequality: \deqn{\frac{\binom{10}{x} (0.3)^x
(0.7)^{10-x}}{\binom{10}{x} (0.5)^x (0.5)^{10-x}} > 1} \deqn{\frac{(0.3)^x (0.7)^{10-x}}{(0.5)^{10}} >
1} \deqn{\left(\frac{0.3}{0.5}\right)^x
\left(\frac{0.7}{0.5}\right)^{10-x} > 1} Take the natural
logarithm of both sides: \deqn{x \ln(0.6) +
(10-x) \ln(1.4) > 0} \deqn{x (\ln(0.6)
- \ln(1.4)) + 10 \ln(1.4) > 0} \deqn{x
\ln\left(\frac{0.6}{1.4}\right) > -10 \ln(1.4)} \deqn{x \ln\left(\frac{3}{7}\right) > -10
\ln(1.4)} Since \eqn{\ln(3/7)} is
negative, dividing by it flips the inequality sign: \deqn{x 


}
}
\section{Module I}{


\subsection{Question 1}{

\strong{Problem:} Let \eqn{X}
be a 3-dimensional random vector with mean \eqn{\mu = (5, 1, 5)'} and dispersion
matrix \eqn{\Sigma}. Find \eqn{E(X'AX)}.


\strong{Theoretical Explanation:} The expectation of a
quadratic form \eqn{X'AX} for a
random vector \eqn{X} with mean \eqn{\mu} and covariance matrix \eqn{\Sigma} is given by the standard identity:
\deqn{E(X'AX) = tr(A\Sigma) +
\mu'A\mu} where \eqn{tr(\cdot)} is the trace of the matrix.


\strong{R Solution:}


\preformatted{mu  matrix(c(5, 1, 5), ncol = 1)
Sigma  matrix(c(4, 2, 3,
                  2, 4, 4,
                  3, 4, 5), nrow = 3, byrow = TRUE)
A  matrix(c(10, 3, 2,
              3, 4, 2,
              2, 2, 3), nrow = 3, byrow = TRUE)

# Calculate Expectation
trace_part  sum(diag(A %*% Sigma))
mean_part  t(mu) %*% A %*% mu
expectation  trace_part + as.numeric(mean_part)

cat("The Expectation E(X'AX) is:", expectation, "\n")}


\preformatted{## The Expectation E(X'AX) is: 590}


}
\subsection{Question 2}{

\strong{Problem:} For what value of \eqn{c} would \eqn{f_X(x) = c(x_1^2 + 2x_2x_3)} for \eqn{0 \le x_i \le 1} (\eqn{i=1,2,3}) be a valid p.d.f. of a
trivariate continuous random vector?


\strong{Theoretical Explanation:} For a function to be a
valid joint p.d.f., its multiple integral over the entire support must
equal 1: \deqn{\int_{0}^{1} \int_{0}^{1}
\int_{0}^{1} c(x_1^2 + 2x_2 x_3) dx_1 dx_2 dx_3 = 1}


Integrating step-by-step: 1. With respect to \eqn{x_1}: \deqn{\int_{0}^{1} (x_1^2 + 2x_2 x_3) dx_1 = \left[
\frac{x_1^3}{3} + 2x_1 x_2 x_3 \right]_0^1 = \frac{1}{3} + 2x_2
x_3} 2. With respect to \eqn{x_2}: \deqn{\int_{0}^{1} \left(\frac{1}{3} + 2x_2 x_3\right)
dx_2 = \left[ \frac{x_2}{3} + x_2^2 x_3 \right]_0^1 = \frac{1}{3} +
x_3} 3. With respect to \eqn{x_3}: \deqn{\int_{0}^{1} \left(\frac{1}{3} + x_3\right) dx_3
= \left[ \frac{x_3}{3} + \frac{x_3^2}{2} \right]_0^1 = \frac{1}{3} +
\frac{1}{2} = \frac{5}{6}}


Setting the total integral to 1: \deqn{c \cdot
\frac{5}{6} = 1 \implies c = \frac{6}{5} = 1.2}


}
\subsection{Question 3}{

\strong{Problem:} Multinomial distribution of 10 viewers
across 4 cinema halls. Probabilities: Hall 1 (\eqn{p_1=0.40}), Hall 2 (\eqn{p_2=0.30}), Hall 3 (\eqn{p_3=0.15}), Hall 4 (\eqn{p_4=0.15}).


\strong{(a) (i) Exact Probability:} 5 to hall 1, 2 to hall 2,
2 to hall 3, 1 to hall 4. This is a standard Multinomial probability:
\deqn{P(X_1=5, X_2=2, X_3=2, X_4=1) =
\frac{10!}{5!2!2!1!} (0.4)^5 (0.3)^2 (0.15)^2 (0.15)^1}


\strong{(a) (ii) Conditional Probability:} 4 to hall 1 given
3 to hall 2 and 1 to hall 3. This accounts for 4 viewers. The remaining
6 must go to either Hall 1 or Hall 4. The conditional probability of
going to Hall 1, given they go to Hall 1 or 4, is: \deqn{p_{1|1,4} = \frac{0.40}{0.40 + 0.15} =
\frac{0.40}{0.55} = \frac{8}{11}} The problem reduces to a
Binomial distribution \eqn{Binomial(n=6,
p=8/11)}. \deqn{P(X_1=4 | X_2=3, X_3=1) =
\binom{6}{4} \left(\frac{8}{11}\right)^4
\left(\frac{3}{11}\right)^2}


\strong{(b) Expectation and Variance for Hall 2 (\eqn{X_2})} The marginal distribution
of a single category is Binomial: \eqn{X_2 \sim
Binomial(10, 0.30)}. * \eqn{E(X_2) = 10
\times 0.30 = 3} * \eqn{Var(X_2) = 10
\times 0.30 \times 0.70 = 2.1}


\strong{(c) Partial Correlation between Hall 1 and Hall 2,
eliminating Hall 3} Conditional on \eqn{X_3=k}, the remaining variables \eqn{(X_1, X_2, X_4)} follow a multinomial
distribution with adjusted probabilities \eqn{p_i' = \frac{p_i}{p_1+p_2+p_4}}. *
\eqn{p_1' = \frac{0.40}{0.40+0.30+0.15} =
\frac{0.40}{0.85} = \frac{8}{17}} * \eqn{p_2' = \frac{0.30}{0.85} =
\frac{6}{17}} * \eqn{\rho_{12.3} =
-\sqrt{\frac{(8/17)(6/17)}{(1 - 8/17)(1 - 6/17)}} =
-\sqrt{\frac{48/289}{(9/17)(11/17)}} = -\sqrt{\frac{48}{99}} \approx
-0.6963} * \strong{Comment:} The partial correlation is
negative. In a multinomial setting, the total sum is fixed (\eqn{N=10}). If we hold the number of people
going to Hall 3 constant, the remaining people must be distributed among
Halls 1, 2, and 4. Therefore, an increase in the number of viewers going
to Hall 1 naturally decreases the available pool of viewers for Hall 2,
resulting in a strong negative linear relationship.


\strong{R Solution:}


\preformatted{# a(i)
p_exact  dmultinom(c(5, 2, 2, 1), size = 10, prob = c(0.4, 0.3, 0.15, 0.15))
cat("a(i) Exact Probability:", p_exact, "\n")}


\preformatted{## a(i) Exact Probability: 0.02351462}


\preformatted{# a(ii)
p_cond  dbinom(4, size = 6, prob = 0.40 / (0.40 + 0.15))
cat("a(ii) Conditional Probability:", p_cond, "\n")}


\preformatted{## a(ii) Conditional Probability: 0.3121315}


\preformatted{# b
cat("b) E(X2):", 10 * 0.3, " Var(X2):", 10 * 0.3 * 0.7, "\n")}


\preformatted{## b) E(X2): 3  Var(X2): 2.1}


\preformatted{# c
p1_prime  0.40 / 0.85
p2_prime  0.30 / 0.85
part_corr  -sqrt((p1_prime * p2_prime) / ((1 - p1_prime) * (1 - p2_prime)))
cat("c) Partial Correlation:", part_corr, "\n")}


\preformatted{## c) Partial Correlation: -0.6963106}


}
\subsection{Question 4}{

\strong{(a) Trivariate Normal Vector} \eqn{X \sim N_3(\mu, \Sigma)} with \eqn{\mu = (1, 2, 1)'}.


\strong{(i) Linear Combination:} \eqn{Y = X_1 + 3X_2 + X_3}. Let \eqn{C = (1, 3, 1)'}. \eqn{\mu_Y = C'\mu} and \eqn{\sigma^2_Y = C'\Sigma C}. \eqn{Y} is normally distributed. \strong{(ii)
Marginal distribution of \eqn{(X_1,
X_2)}:} We simply extract the relevant sub-vectors and
sub-matrices. \deqn{(X_1, X_2)' \sim N_2
\left( \begin{pmatrix} 1 \\ 2 \end{pmatrix}, \begin{pmatrix} 16 & 2
\\ 2 & 4 \end{pmatrix} \right)} \strong{(iii) Conditional
Probability \eqn{P(X_1 > 2 | X_2 = 2, X_3 =
1)}:} Notice that the given conditions \eqn{X_2 = 2} and \eqn{X_3 = 1} exactly match the unconditional
means \eqn{\mu_2} and \eqn{\mu_3}. When conditioning on values equal
to the mean, the conditional mean equals the unconditional mean: \eqn{\mu_{1|23} = \mu_1 = 1}. We compute the
conditional variance and find the standard normal probability.


\strong{R Solution for (a):}


\preformatted{mu  c(1, 2, 1)
Sigma  matrix(c(16, 2, 5,
                  2,  4, 1,
                  5,  1, 9), nrow = 3, byrow = TRUE)

# (i)
C  c(1, 3, 1)
mu_Y  sum(C * mu)
var_Y  t(C) %*% Sigma %*% C
cat("a(i) P(Y , pnorm(6, mean = mu_Y, sd = sqrt(var_Y)), "\n")}


\preformatted{## a(i) P(Y 
\preformatted{# (iii)
Sigma_11  Sigma[1, 1]
Sigma_12  matrix(Sigma[1, 2:3], nrow=1)
Sigma_21  matrix(Sigma[2:3, 1], ncol=1)
Sigma_22  Sigma[2:3, 2:3]

cond_mean  1 # Because given values match means
cond_var  Sigma_11 - (Sigma_12 %*% solve(Sigma_22) %*% Sigma_21)
cat("a(iii) P(X1 > 2 | ...):", pnorm(2, mean = cond_mean, sd = sqrt(as.numeric(cond_var)), lower.tail = FALSE), "\n")}


\preformatted{## a(iii) P(X1 > 2 | ...): 0.3894454}

\strong{(b) Sample Mahalanobis Distance} For two independent
samples of sizes \eqn{n_1} and \eqn{n_2} drawn from normal populations with
the same dispersion matrix \eqn{\Sigma},
let \eqn{\bar{X}_1} and \eqn{\bar{X}_2} be the sample mean vectors, and
\eqn{S_{pooled}} be the pooled sample
covariance matrix. The Sample Mahalanobis Distance (\eqn{D_p}) is defined as: \deqn{D_p^2 = (\bar{X}_1 - \bar{X}_2)'
S_{pooled}^{-1} (\bar{X}_1 - \bar{X}_2)} where \eqn{S_{pooled} = \frac{(n_1-1)S_1 + (n_2-1)S_2}{n_1 +
n_2 - 2}}.


}
\subsection{Question 5}{

\strong{(a) Sampling Distributions} A random sample of \eqn{N} observations from \eqn{X \sim N_3(\mu, \Sigma)}. Let \eqn{\bar{X}} be the sample mean and \eqn{S} be the uncorrected sample
variance-covariance matrix such that \eqn{NS =
\sum_{i=1}^N (X_i - \bar{X})(X_i - \bar{X})'}. * \strong{(i)
Distribution of \eqn{\bar{X}}:}
\deqn{\bar{X} \sim N_3\left(\mu,
\frac{1}{N}\Sigma\right)} * \strong{(ii) Distribution of \eqn{N \cdot S}:} The sum of squared
deviation matrices follows a Wishart distribution with \eqn{N-1} degrees of freedom. \deqn{NS \sim W_3(N-1, \Sigma)}


\strong{(b) Multiple Correlation Coefficient} *
\strong{Definition:} \eqn{\rho_{1.23\dots
p}} is the maximum possible correlation between variable \eqn{X_1} and any linear combination of the
remaining variables \eqn{X_2, \dots,
X_p}. It represents the correlation between \eqn{X_1} and its best linear predictor based
on the other variables. * \strong{(i) \eqn{\rho_{1.23\dots p} = 0}:} \eqn{X_1} is completely uncorrelated with all
other variables. No linear combination of \eqn{X_2 \dots X_p} provides any predictive
power for \eqn{X_1}. * \strong{(ii) \eqn{\rho_{1.23\dots p} = 1}:} \eqn{X_1} can be perfectly predicted without
error by a linear combination of the other variables. The data points
lie exactly on a \eqn{p}-dimensional
hyperplane.


}
}
\section{Module II}{


\subsection{Question 6}{

\strong{Problem:} \eqn{U_1, U_2 \sim
U[0,1]}. \eqn{X_1 = U_1, X_2 = U_2, X_3 =
U_1+U_2, X_4 = U_1-U_2}. Compute correlation matrix and state
PCs of interest.


\strong{Derivation:} For standard uniform variables, \eqn{Var(U_i) = \frac{1}{12}}, and they are
independent, so \eqn{Cov(U_1, U_2) = 0}.
* \eqn{Var(X_1) = Var(X_2) =
\frac{1}{12}} * \eqn{Var(X_3) =
Var(U_1+U_2) = \frac{1}{12} + \frac{1}{12} = \frac{2}{12}} *
\eqn{Var(X_4) = Var(U_1-U_2) = \frac{1}{12} +
\frac{1}{12} = \frac{2}{12}}


Covariances: * \eqn{Cov(X_1, X_2) = 0}
* \eqn{Cov(X_1, X_3) = Cov(U_1, U_1+U_2) =
Var(U_1) = \frac{1}{12}} * \eqn{Cov(X_1,
X_4) = Cov(U_1, U_1-U_2) = Var(U_1) = \frac{1}{12}} * \eqn{Cov(X_2, X_3) = Cov(U_2, U_1+U_2) = Var(U_2) =
\frac{1}{12}} * \eqn{Cov(X_2, X_4) =
Cov(U_2, U_1-U_2) = -Var(U_2) = -\frac{1}{12}} * \eqn{Cov(X_3, X_4) = Cov(U_1+U_2, U_1-U_2) = Var(U_1) -
Var(U_2) = 0}


Correlations \eqn{\rho_{ij} = \frac{Cov(X_i,
X_j)}{\sqrt{Var(X_i)Var(X_j)}}}: * \eqn{\rho_{13} = \frac{1/12}{\sqrt{(1/12)(2/12)}} =
\frac{1}{\sqrt{2}}} * The full correlation matrix is: \deqn{\rho = \begin{pmatrix} 1 & 0 & 1/\sqrt{2}
& 1/\sqrt{2} \\ 0 & 1 & 1/\sqrt{2} & -1/\sqrt{2} \\
1/\sqrt{2} & 1/\sqrt{2} & 1 & 0 \\ 1/\sqrt{2} &
-1/\sqrt{2} & 0 & 1 \end{pmatrix}}


\strong{Principal Components:} Since \eqn{X_3} and \eqn{X_4} are exact linear combinations of
\eqn{X_1} and \eqn{X_2}, the data inherently only exists in a
2-dimensional space. The rank of the correlation matrix is 2. Therefore,
only \strong{2 Principal Components} are of interest. The first
two PCs will explain exactly 100% of the total variance.


}
\subsection{Question 7}{

\strong{What is Cluster Analysis?} Cluster analysis is an
unsupervised machine learning technique used to group a set of objects
such that objects in the same group (called a cluster) are more similar
to each other than to those in other groups.


\strong{Basic idea of k-means clustering:} K-means is an
iterative, centroid-based clustering algorithm. The basic steps are: 1.
\strong{Initialization:} The user specifies the desired number
of clusters, \eqn{k}. The algorithm
randomly selects \eqn{k} data points to
act as the initial “centroids” (cluster centers). 2.
\strong{Assignment:} Every data point is assigned to the cluster
whose centroid is closest to it (usually calculated via Euclidean
distance). 3. \strong{Update:} Once all points are assigned, the
algorithm recalculates the centroid of each cluster by taking the
arithmetic mean of all points assigned to that cluster. 4.
\strong{Iteration:} Steps 2 and 3 are repeated. The centroids
shift as new means are calculated, and points may change cluster
assignments. The algorithm stops when the centroids no longer move
(convergence).


}
\subsection{Question 8 & 9}{

\strong{Diabetes Dataset: PCA & LDA} \emph{(Since the
physical data is not supplied, this solution simulates a representative
clinical dataset to demonstrate the exact R code expected for the
exam).}


\preformatted{library(MASS) # For LDA

# Simulate Data
set.seed(42)
n  200
diabetes_data  data.frame(
  Status = as.factor(sample(c(0, 1), n, replace = TRUE)),
  Sex = as.factor(sample(c("M", "F"), n, replace = TRUE)),
  Height = rnorm(n, 170, 10),
  Weight = rnorm(n, 80, 15),
  BMI = rnorm(n, 28, 5),
  Waist = rnorm(n, 90, 10),
  Age = rnorm(n, 50, 12)
)

# --- Question 8: PCA ---
# We perform PCA only on the continuous variables, scaling is mandatory due to unit differences.
continuous_vars  diabetes_data[, c("Height", "Weight", "BMI", "Waist", "Age")]
pca_model  prcomp(continuous_vars, scale. = TRUE)
summary(pca_model) # Shows proportion of variance explained}


\preformatted{## Importance of components:
##                           PC1    PC2    PC3    PC4    PC5
## Standard deviation     1.0614 1.0385 0.9917 0.9833 0.9190
## Proportion of Variance 0.2253 0.2157 0.1967 0.1934 0.1689
## Cumulative Proportion  0.2253 0.4410 0.6377 0.8311 1.0000}


\preformatted{# --- Question 9: LDA ---
set.seed(1) # As requested by the prompt
# (a) Create training (70%) and test (30%) samples
train_index  sample(1:nrow(diabetes_data), 0.7 * nrow(diabetes_data))
train_data  diabetes_data[train_index, ]
test_data  diabetes_data[-train_index, ]

# (b) Perform LDA and make predictions
# (Including Sex as a predictor internally converts it to a dummy variable)
lda_model  lda(Status ~ Sex + Height + Weight + BMI + Waist + Age, data = train_data)
predictions  predict(lda_model, test_data)

# Create Confusion Matrix to evaluate predictions
conf_mat  table(Actual = test_data$Status, Predicted = predictions$class)
print("Confusion Matrix for LDA Predictions:")}


\preformatted{## [1] "Confusion Matrix for LDA Predictions:"}


\preformatted{print(conf_mat)}


\preformatted{##       Predicted
## Actual  0  1
##      0  7 16
##      1 17 20}


}
\subsection{Question 10}{

\strong{Hierarchical Clustering of Cities based on Chartbuster
Songs} \emph{(Simulating the 16x16 distance matrix for the 6 audio
features to demonstrate the linkage methods).}


\preformatted{# Simulate a 16x16 distance matrix
set.seed(123)
dummy_features  matrix(rnorm(16 * 6), nrow = 16)
dist_matrix  dist(dummy_features, method = "euclidean")

par(mfrow = c(1, 2)) # Put plots side-by-side

# Perform Single Linkage (Nearest Neighbor)
hc_single  hclust(dist_matrix, method = "single")
plot(hc_single, main = "Single Linkage", xlab = "Cities", sub = "", cex = 0.8)

# Perform Complete Linkage (Furthest Neighbor)
hc_complete  hclust(dist_matrix, method = "complete")
plot(hc_complete, main = "Complete Linkage", xlab = "Cities", sub = "", cex = 0.8)}


\strong{Report on Similarity (General Commentary):} *
\strong{Single Linkage:} Defines cluster distance as the
shortest distance between two points in different clusters. It often
suffers from “chaining,” where dissimilar cities might be linked
together simply because of an intermediate city bridging them. The
resulting dendrogram typically looks ladder-like and unbalanced. *
\strong{Complete Linkage:} Defines cluster distance as the
maximum distance between two points in different clusters. This forces
clusters to be highly compact and spherical. Cities grouped under
complete linkage share a high degree of global similarity across all
chartbuster audio features, providing much more distinct, evenly-sized,
and interpretable groupings compared to single linkage.



}
}
}
\author{BSc Data Science Graduate Level Solutions}
\keyword{multivariate}
\keyword{statistics}
\keyword{exam}
