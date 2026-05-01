\name{predictive_analysis_notes}
\alias{predictive_analysis_notes}
\title{Predictive Analysis - Semester 2 Lecture Notes}
\description{
  Complete transcription of handwritten lecture notes on Statistical /
  Predictive Analysis covering: business case datasets, regression theory,
  simple and multiple linear regression, model diagnostics, K-Nearest
  Neighbours regression, model selection techniques, backward stepwise
  regression, regularisation (shrinkage methods), cross validation,
  classification, logistic regression, KNN classification, and
  multicategory logistic regression.
}

\section{Date: 07/01/26 – A Single Dataset, Multiple Questions}{

  \subsection{Business Case: Credit Card Application Assessment}{
    A credit card manager receives applications from individuals who are new to
    the bank.  For each applicant the bank has access to information provided in
    the application form as well as the details obtained through a soft credit-
    bureau check.  Typical information available at this stage includes:

    \itemize{
      \item Annual income, age, total outstanding loan amount, years of education
            (ratio scale).
      \item Credit rating on a scale of 1–10, 10 being the highest rating
            (ordinal scale).
      \item Occupation, employment type (government, private, self-employed),
            residential status (owned, rented, company accommodation)
            (nominal scale).
      \item Marital status (married, not married), student status (student,
            not a student) (nominal, binary).
    }
  }

  \subsection{Business Questions}{
    Using historical records of past 400 applicants – including their profile
    details (as mentioned above), sanctioned credit limits, and default status
    (defaulter or not a defaulter) – the manager seeks to explore several
    practical questions:

    \enumerate{
      \item Given a new applicant's profile, can we decide whether it is safe
            to approve the card?
      \item For a new applicant, what could be an estimated credit card limit
            that can be sanctioned?
      \item Which applicant characteristics are most influential in deciding
            that the person would be a credit card defaulter?
      \item Which applicant characteristics are most influential in shaping
            credit limit decisions?
      \item Using variables such as income, age, outstanding loans, education,
            credit rating, occupation, employment type, residential status,
            marital status, and student status – can applicants be grouped into
            different risk-lifestyle profiles?
    }
  }
}

\section{Converting the Business Problem to a Statistical Problem}{

  \subsection{Few Terminologies}{
    \describe{
      \item{Supervised Learning}{Estimating or predicting an output based on
            inputs by using suitable statistical models.}
      \item{Unsupervised Learning}{There are inputs but no supervised outputs.
            We can learn relationships or structure from such data.}
      \item{Response (dependent variable / study variable)}{Output.}
      \item{Predictors (features / carriers / independent variables)}{Input.}
      \item{Problem of Regression}{Output is numeric (measured in ratio scale).}
      \item{Problem of Classification}{Output (response) is categorical.}
      \item{Inference (Diagnostic / Explanation)}{Understanding relationships.}
      \item{Prediction (Prognostic)}{Forecasting future outcomes.}
    }

    \itemize{
      \item If the output is numeric (i.e. measured in ratio scale) then it is
            called the \emph{Problem of Regression}.
      \item If the response / output is categorical then it is called the
            \emph{Problem of Classification}.
    }
  }

  \subsection{Converting Business Questions to Statistical Answers}{
    \enumerate{
      \item Response: Default status; Predictor(s): Applicant's profile.
            \strong{Classification Prediction.}
      \item Response: Credit card limit; Predictor(s): Applicant's profile.
            \strong{Regression Prediction.}
      \item Response: Default status; Predictor(s): Applicant's profile.
            \strong{Classification Diagnostic.}
      \item Response: Credit limit; Predictor(s): Applicant's profile.
            \strong{Regression Diagnostic.}
      \item Response: (none); Predictor(s): Applicant's profile.
            Here, we are not interested in finding any meaningful output /
            response; we are interested to form some clusters, i.e. divide into
            some homogeneous groups.  Hence, \strong{Unsupervised}.
    }
  }
}

\section{Some More Datasets}{

  \enumerate{
    \item Dataset consisting of 6830 gene expression measurements for each of
          64 cancer cell lines.  We are interested in determining whether there
          are groups or clusters among the cell lines based on their gene
          expression measurements.  Here also we are interested in determining
          groups, not any meaningful outputs.  \strong{Therefore: Unsupervised.}

    \item Suppose you are a statistical consultant hired by a client to provide
          advice on how to improve sales of a particular product.  You are given
          information on the sales of that product in 200 different markets, along
          with advertising budgets for the product in each of those markets for
          three different media: TV, radio, and newspaper.  Your client wants to
          increase sales.  What do you suggest?
          \strong{Supervised, Diagnostic.}
          \itemize{
            \item n = sample size = 200
            \item p = No. of predictors = 3
          }

    \item For each of the 50 states in the United States, the dataset contains
          the number of arrests per 100,000 residents for each of three crimes:
          Assault, Murder, and Rape.  The record on urban population (the percent
          of the population in each state living in urban areas) is also provided.
          What can you study?  (Unsupervised / clustering possible.)

    \item \strong{Heart Disease Dataset} (reprocessed Hungarian data from UC
          Irvine Machine Learning Repository):
          Data pertaining to 14 parameters for 291 individuals.
          \itemize{
            \item[1.] AGE (in years)
            \item[2.] GENDER (1 = male, 0 = female)
            \item[3.] Chest pain type (value 1: typical angina; value 2:
                      atypical angina; value 3: non-anginal pain)
            \item[4.] Resting Blood Pressure (in mm Hg on admission to the
                      hospital)
            \item[5.] Serum cholesterol (in mg/dl)
            \item[6.] Fasting blood sugar (>120 mg/dl: 1 = true; 0 = false)
            \item[7.] Resting electrocardiographic results (0: Normal;
                      1: having ST-T wave abnormality (T wave inversions and/or
                      ST elevation or depression of > 0.05 mV);
                      2: showing probable or definite left ventricular
                      hypertrophy)
            \item[8.] Maximum heart rate achieved
            \item[9.] Exercise induced angina (1 = yes; 0 = no)
            \item[10.] ST depression induced by exercise relative to rest
            \item[11.] Slope of the peak exercise ST segment
                       (1: up sloping, 2: flat, 3: down sloping)
            \item[12.] Number of major vessels (0–3) coloured by fluoroscopy
            \item[13.] THAL (3 = normal, 6 = fixed defect, 7 = reversible defect)
            \item[14.] Diagnosis of heart disease (angiographic disease status)
                       0: < 50\% diameter narrowing; 1: > 50\% diameter narrowing
          }
          Response: Diagnosis of heart disease.  n = 294, p = 13.

    \item \strong{Wage Data} – income survey information for 100 males from the
          central Atlantic region of the United States.
          Variables: WAGE, AGE, YEAR, EDUCATION LEVEL (1–5, with 1 = no high
          school diploma, 5 = an advanced graduate degree).
          Response: WAGE.  Predictors: AGE, YEAR, EDUCATION LEVEL.  n = 100, p = 3.

    \item A company wants to conduct a marketing campaign to identify which
          individuals would positively respond to mailing.  Age, gender, location
          (rural or urban), occupation, education level of the individuals are
          noted along with their response to the marketing campaign (positive or
          negative).
          Response: Marketing campaign response.
          Predictors: Age, Gender, Location, Occupation, Education level.
  }
}

\section{Date: 08/01/26 – Regression Problem}{

  \subsection{Model}{
    \deqn{y = f(x, \varepsilon)}
    where \eqn{y} is the response, \eqn{x} is the predictor, and
    \eqn{\varepsilon} is the random error.

    In the regression problem, \eqn{y} is numeric and \eqn{x} is
    qualitative / quantitative.
    \eqn{x = (x_1, x_2, \ldots, x_p)}: collection of predictors.

    \eqn{f} is that function (model) that captures the relationship between
    \eqn{y} and \eqn{x}.

    Though this should be an appropriate model, \eqn{\varepsilon} within
    \eqn{f} with \eqn{x} is complicated.  So we use a simplified model:
    \deqn{y = f(x) + \varepsilon \quad (1)}
    \eqn{\varepsilon} contains all that has been missed out in capturing the
    relationship between \eqn{y} and \eqn{x}.  \eqn{\varepsilon}: random error
    (unknown).
  }

  \subsection{Conditional Expectation Function (CEF)}{
    \deqn{CEF = E(y \mid x)}
    From the diagram: (i) CEF is a linear function in \eqn{x};
    (ii) it is increasing with \eqn{x}.

    \strong{Objective:} To find a good choice for \eqn{f(x)}.  Determine
    \eqn{f(x)} such that we minimise the \eqn{L_2} loss function.

    \deqn{\text{Minimise} \quad E(y - f(x))^2 = E(\varepsilon^2), \quad
          \varepsilon = y - f(x)}

    Expanding:
    \deqn{E(y - f(x))^2
          = E(y - E(y|x) + E(y|x) - f(x))^2}
    \deqn{= E\left[(y - E(y|x))^2 + (E(y|x) - f(x))^2
                   + 2(y - E(y|x))(E(y|x) - f(x))\right]}
    \deqn{= E(y - E(y|x))^2 + E(E(y|x) - f(x))^2
           + 2E[(y - E(y|x))(E(y|x) - f(x))]}

    The product term \eqn{2E[(y - E(y|x))(E(y|x) - f(x))]} equals zero because
    \eqn{E(E(y|x)) = E(y)} and \eqn{E(y) - E(y) = 0}.

    \deqn{E(y - f(x))^2 = E(y - E(y|x))^2 + (E(y|x) - f(x))^2}

    Now, \eqn{E(y - f(x))^2 \geq E(y - E(y|x))^2}.

    The minimum (equality case) is attained if the second term is zero:
    \deqn{(E(y|x) - f(x))^2 = 0 \implies f(x) = E(y|x)}

    So model (1) can be written as:
    \deqn{y = E(y|x) + \varepsilon \quad (2)}

    Now: \eqn{E(y|x) = E(f(x)|x) + E(\varepsilon|x)},
    so \eqn{E(\varepsilon|x) = 0} – this is an assumption by construction.
    Also \eqn{E(\varepsilon) = E\,E(\varepsilon|x) = 0}.

    \deqn{\text{cov}(\varepsilon, \psi(x))
          = E(\varepsilon \cdot \psi(x)) - E(\varepsilon)\,E(\psi(x))
          = \psi(x)\,E(\varepsilon) = 0}
  }
}

\section{Date: 14/01/26 – Training Sample and Test Data}{

  \subsection{Definitions}{
    \describe{
      \item{Training Sample}{The sample that is used to build up the model is
            called the training sample.  The rest that is kept aside is known as
            the \strong{test data}.}
    }
    Customarily, training sample size is much larger than test data sample size.
    For example, suppose total n = 400: 300 used for training, 100 for test.

    \eqn{\hat{f}(x)} is built on 300; \eqn{\hat{f}(x_{\text{new}})} is used on
    test data.  Test error: \eqn{\frac{1}{100}\sum_{i \in \text{test}} (y_i -
    \hat{f}(x_i))^2}.

    For totally new data points: \eqn{x^* \to y^*} (never available).
    \eqn{E(y^* - \hat{f}(x^*))^2} should be small.
  }

  \subsection{Training Mean Square Error (Training MSE)}{
    \deqn{\text{Training MSE} = \frac{1}{n_t} \sum_{i \in \text{training sample}}
          (y_i - \hat{f}(x_i))^2}
    where \eqn{n_t} is the training data sample size.
  }

  \subsection{Test Mean Square Error (Test MSE)}{
    Suppose \eqn{x_0} is the new value of the predictor, and the predicted
    response is given by \eqn{\hat{y}_0 = \hat{f}(x_0)}.  However, let the true
    value of the response be \eqn{y_0} (unknown).

    \eqn{(y_0 - \hat{y}_0)} is the error in prediction.

    \deqn{\text{Test MSE} = E(y_0 - \hat{y}_0)^2
          = E(y_0 - \hat{f}(x_0))^2
          = E(f(x_0) + \varepsilon - \hat{f}(x_0))^2}
    \deqn{= E[(f(x_0) - \hat{f}(x_0))^2] + E(\varepsilon^2)
           + 2\,E[(f(x_0) - \hat{f}(x_0))\,\varepsilon]}
    \deqn{= \underbrace{E(\hat{f}(x_0) - f(x_0))^2}_{\text{reducible part}}
           + \underbrace{V(\varepsilon)}_{\text{irreducible part}}}

    (Note: \eqn{V(\varepsilon) = E(\varepsilon^2) - (E(\varepsilon))^2 =
    E(\varepsilon^2)} since \eqn{E(\varepsilon) = 0}.)

    The product term is 0 since \eqn{\varepsilon} is uncorrelated with any
    function of \eqn{x}.
  }
}

\section{Date: 15/01/26 – Bias-Variance Decomposition}{

  \deqn{\text{Test MSE} \geq E(\hat{f}(x_0) - f(x_0))^2}

  Expanding the reducible part:
  \deqn{E(\hat{f}(x_0) - f(x_0))^2
        = V(\hat{f}(x_0)) + \text{Bias}^2(\hat{f}(x_0))}

  where:
  \deqn{\text{Bias}(\hat{f}(x_0)) = E(\hat{f}(x_0)) - f(x_0)}

  Finally, the complete decomposition of Test MSE:
  \deqn{\text{Test MSE} = V(\hat{f}(x_0)) + \text{Bias}^2(\hat{f}(x_0))
         + V(\varepsilon)}

  \subsection{Accuracy and Precision}{
    \itemize{
      \item \strong{Accuracy} captures bias.
      \item \strong{Precision} captures variance.
      \item \eqn{\text{Precision} = \frac{1}{\text{Variance}}}
    }
  }

  \subsection{How to Calculate Bias and Variance (Monte Carlo Simulation)}{
    \strong{Accuracy / Bias steps:}
    \enumerate{
      \item Training sample size \eqn{n_t}.
      \item Fit \eqn{\hat{f}(x)}.
      \item Compute \eqn{\hat{f}(x_0)}.
      \item Compute \eqn{\hat{f}(x_0) - f(x_0)}.
      \item Repeat the process for a large number of times (e.g. 10,000).
      \item Now we have 10,000 \eqn{\hat{f}(x_0) - f(x_0)} gaps.
      \item \eqn{\text{Bias} \approx \hat{f}(x_0) - f(x_0)}.
      \item \eqn{\frac{1}{10000} \sum \text{bias} \approx
                 E(\hat{f}(x_0) - f(x_0))}.
    }
    If the value in step viii is low, then the accuracy of the model is high.

    \strong{Variability / Precision steps:}
    \enumerate{
      \item \eqn{n_t}
      \item Fit \eqn{\hat{f}(x)}.
      \item Compute \eqn{\hat{f}(x_0)}.
      \item Repeat 10,000 times.
      \item Compute \eqn{\text{Var}(\hat{f}(x_0))}.
    }
    If \eqn{\text{Var}(\hat{f}(x_0))} is small, then the model is precise.
  }
}

\section{Date: 21/01/26 – Simple Linear Regression}{

  \subsection{Recap}{
    \deqn{y = Y + \varepsilon}
    \deqn{y = f(x) + \varepsilon}
    After \eqn{L_2} loss: \eqn{f(x) = E(y|x)}, therefore
    \eqn{y = E(y|x) + \varepsilon}.
  }

  \subsection{Population Regression Function (PRF) / CEF}{
    \deqn{E(y|x) = \beta_0 + \beta x}
    (unknown; fixed and constant.)

    \strong{Interpretation of \eqn{\beta}:} Change in the population conditional
    mean for 1 unit increment in \eqn{x}.

    \strong{Interpretation of \eqn{\beta_0}:} Conditional mean when \eqn{x = 0}.

    \itemize{
      \item \eqn{\frac{d\,E(y|x)}{dx} = \beta}
      \item \eqn{E(y|x=0) = \beta_0}
    }
  }

  \subsection{Estimation of the Population Regression Function}{
    \deqn{\hat{E}(y|x) = \hat{\beta}_0 + \hat{\beta}\,x}
    where \eqn{\hat{\beta}_0, \hat{\beta}} are the least squares estimators
    obtained by minimising the error sum of squares using the training data.
    This is called the \strong{Sample Regression Function (SRF)}.

    The SRF is not fixed; it depends on the size of the training sample.
  }

  \subsection{Interpretation of \eqn{\hat{\beta}_0, \hat{\beta}}}{
    \describe{
      \item{\eqn{\hat{\beta}}}{Change in the estimated conditional mean /
            predicted response for one unit increment in \eqn{x};
            \eqn{\hat{\beta} = d\hat{y}/dx}.}
      \item{\eqn{\hat{\beta}_0}}{Predicted response when \eqn{x = 0};
            \eqn{\hat{\beta}_0 = \hat{E}(y|x=0)}.}
    }

    From least squares theory:
    \deqn{\hat{\beta} = \frac{\text{cov}(y, x)}{V(x)}, \quad
          \hat{\beta}_0 = \bar{y} - \hat{\beta}\,\bar{x}}

    \strong{NOTE:}
    \enumerate{
      \item \eqn{E(\hat{\beta}) = \beta}
      \item \eqn{E(\hat{\beta}_0) = \beta_0}
      \item \eqn{\hat{\beta}} and \eqn{\hat{\beta}_0} are unbiased estimators of
            \eqn{\beta} and \eqn{\beta_0} respectively.
    }
  }

  \subsection{Precision of \eqn{\hat{\beta}} and \eqn{\hat{\beta}_0}}{
    \deqn{V(\hat{\beta}) \approx \frac{1}{R} \sum_{r=1}^{R}
          (\hat{\beta}_{(r)} - \bar{\beta})^2}
    (Monte Carlo approximation.)

    Standard error: \eqn{\sqrt{V(\hat{\beta})} \to \text{s.e. of } \hat{\beta}}.
  }

  \subsection{Confidence Interval of \eqn{\beta}}{
    \deqn{P\left(\hat{\beta} - 1.96\,\text{se}(\hat{\beta})
          \leq \beta
          \leq \hat{\beta} + 1.96\,\text{se}(\hat{\beta})\right) = 0.95}
    Lower Confidence Limit (LCL) and Upper Confidence Limit (UCL).

    \strong{NOTE:}
    \itemize{
      \item Smaller se(\eqn{\hat{\beta}}) \eqn{\Rightarrow} narrower / tighter
            C.I.; C.I. becomes less uncertain.
      \item Larger s.e. \eqn{\Rightarrow} wider C.I.; larger uncertainty.
    }

    If the experiment is repeated 100 times, the random intervals (LCL, UCL)
    will contain the true value of \eqn{\beta} 95 times.
  }

  \subsection{Hypothesis Testing}{
    \deqn{H_0: \beta = 0 \quad \text{vs} \quad H_1: \beta \neq 0}
    \deqn{t = \frac{\hat{\beta} - \beta_{H_0}}{\text{se}(\hat{\beta})}
              = \frac{\hat{\beta} - 0}{\text{se}(\hat{\beta})}}

    For a finite sample size: \eqn{t \sim t_{n-2}}
    (2 = number of parameters estimated, here \eqn{\beta_0, \beta}).
    For large \eqn{n}: \eqn{t \sim N(0,1)} by CLT.

    \itemize{
      \item If p-value of the test is very small, reject \eqn{H_0}.
      \item C.I. approach: if C.I. contains 0, accept \eqn{H_0}; otherwise
            reject \eqn{H_0}.
    }

    \strong{p-value:} \eqn{P(T \geq t_{\text{obs}} \mid H_0) = p}.
  }

  \subsection{Goodness of Fit}{
    \describe{
      \item{Residuals}{\eqn{e = \hat{\varepsilon} = y - \hat{y}}}
      \item{Residual Plot}{Plots \eqn{x} on x-axis and residuals on y-axis.
            A plot that reveals no pattern is a good residual plot.}
    }

    \strong{iii) Residual Sum of Squares (RSS):}
    \deqn{RSS = e_1^2 + e_2^2 + \cdots + e_n^2
              = \sum_{i=1}^{n} (y_i - \hat{\beta}_0 - \hat{\beta}\,x_i)^2}

    \strong{iv) Residual Standard Error (RSE):}
    \deqn{RSE = \sqrt{\frac{RSS}{n - 2}}}
    Lesser the value of RSE, better is the model fit.

    \strong{v) R-squared:}
    \deqn{R^2 = 1 - \frac{RSS}{TSS}, \quad
          TSS = \sum_{i=1}^{n} (y_i - \bar{y})^2}
    \deqn{0 \leq R^2 \leq 1}
    Higher the value of \eqn{R^2}, better is the fit.
  }
}

\section{Date: 22/01/26 – Bias-Variance Tradeoff Illustration}{

  Three fitted curves are discussed:
  \itemize{
    \item \strong{Curve 1 (simple linear):} High interpretability, high bias,
          low variance.  Not fitting the given data well (linear regression fit).
    \item \strong{Curve 2:} Complicated, closer to data points.  Low bias,
          high variance.  Lesser training MSE but higher test MSE than Curve 3.
    \item \strong{Curve 3:} Closer to the truth (test data).  Lowest test MSE
          among the three.  Higher bias than Curve 2 but lower variance.
  }

  \itemize{
    \item \strong{Complicated Model:} Flexible model, less interpretable,
          bias low, variance high.
    \item \strong{Simple Model:} High interpretability, bias high, variance low.
    \item \strong{Flexibility} increasing means increasing complications.
    \item \strong{Interpretability} increasing means model is simple.
    \item Test MSE is always U-shaped.
    \item \eqn{\text{Test MSE} = V(\hat{f}(x_0)) + \text{Bias}^2(\hat{f}(x_0))
              + V(\varepsilon)}.
          Hence Test MSE cannot come below the \eqn{V(\varepsilon)} line.
  }
}

\section{Date: 28/01/26 – Statistical Learning (Bias-Variance Graphs)}{

  Two sets of bias-variance-MSE vs. flexibility graphs are shown in the notes.
  \itemize{
    \item Graph 1: MSE has a U-shape; variance increases monotonically; bias
          decreases monotonically with flexibility.
    \item Graph 2 (different scenario): Similar pattern but different scale /
          values.
  }
}

\section{Multiple Linear Regression}{

  \subsection{Setup}{
    Consider the Credit Card data in R (ISLR library) with variables:
    1. Limit, 2. Balance, 3. Income, 4. Rating.
    All four variables are numeric, measured in ratio scale.

    Response: Balance.  Predictors: Limit, Income, Rating.

    \strong{Questions:}
    \enumerate{
      \item Is there a relationship between Balance and Credit Limit Sanctioned,
            Income, and Rating of a person?
      \item Are all the predictors useful in predicting the response?  Which
            predictor is useful?
      \item How well does the model fit the data?
      \item Given a set of predictors, how accurately can we predict future
            Balance?
    }
  }

  \subsection{Model}{
    \deqn{y = f(x) + \varepsilon = \beta_0 + \beta_1 x_1 + \beta_2 x_2
            + \cdots + \beta_p x_p + \varepsilon}
    \strong{NOTE:}
    \enumerate{
      \item \eqn{f(x)} is linear in both the predictors and the parameters.
      \item \eqn{\beta_0, \beta_1, \ldots, \beta_p} are unknown constants
            (parameters) which need to be estimated on the basis of the training
            data.
    }
  }

  \subsection{Assumption}{
    \deqn{\varepsilon \sim N(0, \sigma^2); \quad \sigma^2 \text{ known, constant}}
    Let the training sample be of size \eqn{n}.  Design matrix \eqn{X} is
    \eqn{n \times p}; response vector \eqn{y} is \eqn{n \times 1}.

    \eqn{x_{ji}}: \eqn{j} = predictor index, \eqn{i} = person index.
    Each row represents information on a specific individual.
    Each column represents information on a specific predictor.

    \deqn{y_i = \beta_0 + \beta_1 x_{1i} + \beta_2 x_{2i} + \cdots
              + \beta_p x_{pi}, \quad i = 1, 2, \ldots, n}

    Random error vector \eqn{\varepsilon = (\varepsilon_1, \ldots,
    \varepsilon_n)^T}.
    \deqn{\varepsilon_i \sim N(0, \sigma^2) \quad \forall\, i = 1, 2, \ldots, n}
    \deqn{\text{cor}(\varepsilon_i, \varepsilon_j) = 0 \quad \forall\, i \neq j}

    \strong{Estimation Theory – Ordinary Least Squares (OLS):}
    Least squares technique minimises the error sum of squares, i.e. minimises
    the \eqn{L_2} loss function.
    \deqn{\text{Minimise} \sum_{i=1}^{n} e_i^2
          = \sum_{i=1}^{n} (y_i - \beta_0 - \beta_1 x_{1i} - \cdots
            - \beta_p x_{pi})^2}
    Solve by equating the first order partial derivatives to 0.

    Let \eqn{\hat{\beta}_0, \hat{\beta}_1, \ldots, \hat{\beta}_p} denote the
    least square estimators of \eqn{\beta_0, \beta_1, \ldots, \beta_p}
    respectively.
    \strong{NOTE:} \eqn{\hat{\beta}_0, \hat{\beta}_1, \ldots, \hat{\beta}_p}
    are random quantities because they are functions of sample observations.
  }

  \subsection{Interpretation of \eqn{\beta_j}}{
    \eqn{\beta_j} is the amount by which the CEF/PRF increases for one unit
    increment in \eqn{x_j} holding other predictors fixed.

    \eqn{\hat{\beta}_j} is the amount by which the SRF increases for one unit
    increment in \eqn{x_j} holding other predictors fixed.

    \strong{NOTE:} \eqn{E(\hat{\beta}_j) = \beta_j}.
  }

  \subsection{Testing}{
    \strong{Question 1: Overall F-test}
    \deqn{H_0: \beta_1 = \beta_2 = \cdots = \beta_p = 0}
    \deqn{H_1: \text{At least one inequality holds in } H_0}
    Test statistic: F-test.
    \deqn{F \overset{H_0}{\sim} F_{p,\, n-p-1}}
    Reject \eqn{H_0} if \eqn{F > F_{\alpha, p, n-p-1}}.
    Alternatively, if p-value is very small, reject \eqn{H_0}.

    \strong{Question 2: Individual t-tests}
    \deqn{H_{0j}: \beta_j = 0 \quad \text{vs} \quad H_{1j}: \beta_j \neq 0,
          \quad j = 1, 2, \ldots, p}
    \deqn{t = \frac{\hat{\beta}_j}{\text{se}(\hat{\beta}_j)}
              \overset{H_0}{\sim} t_{n-p-1}}
    Reject \eqn{H_0} if \eqn{t > t_{\alpha, n-p-1}} or p-value is small.

    Interpretation of \eqn{\hat{\beta}_j = -7.433}: Holding all other predictors
    fixed, for one unit increment in income, the predicted balance decreases by
    7.433 units.
  }

  \subsection{Measures of Model Adequacy}{
    \strong{i) R-squared:}
    \deqn{R^2 = 1 - \frac{RSS}{TSS}, \quad 0 \leq R^2 \leq 1}
    \deqn{RSS = \sum_{i=1}^{n} \hat{\varepsilon}_i^2
              = \sum_{i=1}^{n}(y_i - \hat{\beta}_0 - \hat{\beta}_1 x_{1i}
                - \cdots - \hat{\beta}_p x_{pi})^2}
    \deqn{TSS = \sum_{i=1}^{n}(y_i - \bar{y})^2}

    \strong{ii) Adjusted R-squared:}
    \deqn{\text{Adj}\,R^2 = 1 - \frac{RSS/(n-p-1)}{TSS/(n-1)}
                          = 1 - \frac{n-1}{n-p-1}(1-R^2)}
    Maximum value is 1; minimum value may be negative.

    \strong{iii) Residual Standard Error (RSE):}
    \deqn{RSE = \sqrt{\frac{RSS}{n-p-1}}, \quad n > p+1}
    Lower RSE, better the model.  Prefer \eqn{R^2} over RSE as it is bounded
    between 0 and 1.

    \strong{iv) Training MSE:}
    \deqn{\text{Training MSE} = \frac{1}{n} \sum_{i=1}^{n}(y_i - \hat{y}_i)^2}
    If training MSE is small, the model is good.

    \strong{v) Test MSE:}
    \deqn{\text{Test MSE} = \frac{1}{n_{\text{test}}} \sum_{i=1}^{n_{\text{test}}}
          (y_i - \hat{y}_i)^2}
    (\eqn{\hat{y}} obtained by using \eqn{x} from test data.)

    \strong{vi) AIC} – Akaike Information Criteria.

    \strong{vii) BIC} – Bayesian Information Criteria.

    \strong{viii) Mallow's \eqn{C_p} measure.}

    All criteria 6, 7, 8 take the form: Training MSE + penalty function, and
    give some estimates of test MSE.  Everything is based on RSS; smaller AIC /
    BIC / \eqn{C_p} means better model.

    \strong{NOTE on prediction vs confidence intervals:}
    \itemize{
      \item To predict the average response: use confidence interval.
      \item To predict an individual's response: use prediction interval.
      \item Prediction intervals are wider than confidence intervals.
    }
  }
}

\section{Date: 04/02/26 – Other Considerations in Multiple Linear Regression}{

  \subsection{1. Qualitative Predictors}{

    \strong{Part A – Two nominal categories:}
    Example: \eqn{y} = cholesterol level, \eqn{x} = Gender (Male/Female).
    \deqn{y_i = \beta_0 + \beta\,x_i + \varepsilon_i}
    \deqn{x_i = \begin{cases} 1 & \text{if ith person is Male} \\
                               0 & \text{if ith person is Female} \end{cases}}
    \deqn{E(y|x=M) = \beta_0 + \beta \quad (i)}
    \deqn{E(y|x=F) = \beta_0}
    From least squares:
    \deqn{\hat{\beta}_0 = \bar{y}_{\text{female}}, \quad
          \hat{\beta} = \bar{y}_{\text{male}} - \bar{y}_{\text{female}}}

    Example interpretation (\eqn{\hat{f}(x) = 44.5 - 1.34x}):
    \itemize{
      \item Average cholesterol level for females is 44.5.
      \item Average cholesterol level for males is estimated as 43.16.
      \item On average, females have higher cholesterol levels than males.
      \item If '*' is present, females have significantly higher cholesterol
            levels than males (significant at 5\% level).
    }

    To study the impact of Gender on cholesterol:
    \deqn{H_0: \beta = 0 \quad \text{vs} \quad H_1: \beta \neq 0}
    \deqn{\equiv H_0: \mu_M - \mu_F = 0 \quad \text{vs} \quad
          H_1: \mu_M - \mu_F \neq 0}

    \strong{Part B – More than two categories:}
    Example: \eqn{y} = height, \eqn{x} = ethnicity (Asian, African, American).
    \deqn{x_{1i} = \begin{cases}1 & \text{Asian}\\0 & \text{otherwise}\end{cases},
          \quad
          x_{2i} = \begin{cases}1 & \text{African}\\0 & \text{otherwise}\end{cases}}

    \tabular{lll}{
      \eqn{x_1} \tab \eqn{x_2} \tab Identity \cr
      1 \tab 1 \tab – \cr
      1 \tab 0 \tab Asian \cr
      0 \tab 1 \tab African \cr
      0 \tab 0 \tab American \cr
    }
    (American is the baseline category.)

    \deqn{y_i = \beta_0 + \beta_1 x_{1i} + \beta_2 x_{2i} + \varepsilon_i}
    \deqn{E(y|x_1=1,x_2=0) = \beta_0 + \beta_1 \quad \text{(Asian)}}
    \deqn{E(y|x_1=0,x_2=1) = \beta_0 + \beta_2 \quad \text{(African)}}
    \deqn{E(y|x_1=0,x_2=0) = \beta_0 \quad \text{(American)}}
    \deqn{\hat{\beta}_0 = \bar{y}_{\text{American}}, \quad
          \hat{\beta}_1 = \bar{y}_{\text{Asian}} - \bar{y}_{\text{American}},
          \quad
          \hat{\beta}_2 = \bar{y}_{\text{African}} - \bar{y}_{\text{American}}}

    Example output (\eqn{\hat{\beta}_0 = 150.32, \hat{\beta}_1 = -16.11,
    \hat{\beta}_2 = 18.10}):
    \itemize{
      \item Average height of Americans is 150.32 cm.
      \item On average, Americans are taller than Asians.
      \item Average height of Asians is 134.21 cm.
      \item On average, Africans are taller than Americans.
      \item Average height of Africans is 168.42 cm.
    }
  }

  \subsection{2. Qualitative and Quantitative Predictors}{
    \deqn{y = \beta_0 + \beta_x\,x + \beta_z\,z + \varepsilon,
          \quad \varepsilon \sim N(0, \sigma^2)}
    \eqn{y}: marks; \eqn{x}: stream (stat, math, CS); \eqn{z}: daily hours
    of study.

    Dummy variables:
    \deqn{x_{1i} = \begin{cases}1 & \text{Math}\\0 & \text{otherwise}\end{cases},
          \quad
          x_{2i} = \begin{cases}1 & \text{Stat}\\0 & \text{otherwise}\end{cases}}
    (CS is baseline.)

    \deqn{E(y|x_1=1,x_2=0) = \beta_0 + \beta_1 + \beta_z\,z \quad\text{(Math)}}
    \deqn{E(y|x_1=0,x_2=1) = \beta_0 + \beta_2 + \beta_z\,z \quad\text{(Stat)}}
    \deqn{E(y|x_1=0,x_2=0) = \beta_0 + \beta_z\,z \quad\text{(CS)}}

    \strong{NOTE:} The slope \eqn{\beta_z} remains the same across streams.
    There is no interaction between study hours and the nature of the stream.
    One unit increment in study hours increases average marks by \eqn{\beta_z}
    irrespective of the stream.
  }

  \subsection{Part D – Including Interaction Term (Synergy Effect)}{
    \deqn{y = \beta_0 + \beta_1 x_1 + \beta_2 x_2 + \beta_3 x_1 x_2 + \varepsilon}
    This removes the additivity assumption.

    \deqn{E(y|x_1, x_2) = \beta_0 + \beta_1 x_1 + \beta_2 x_2 + \beta_3 x_1 x_2}

    \deqn{\frac{\partial \hat{y}}{\partial x_1} = \hat{\beta}_1 + \hat{\beta}_3\,x_2}

    \strong{Interpretation of \eqn{\hat{\beta}_3}:}
    \deqn{\frac{\partial}{\partial x_2}\left(\frac{\partial \hat{y}}{\partial x_1}
          \right) = \hat{\beta}_3}
    For one unit increment in \eqn{x_2}, the predicted response (due to one unit
    increment in \eqn{x_1}) increases by \eqn{\hat{\beta}_3} units.  Therefore
    \eqn{\hat{\beta}_3} captures the effectiveness in \eqn{\hat{y}} due to one
    unit increment in \eqn{x_1}.

    Example (Balance, Income, Student interaction):
    \deqn{y_i = \beta_0 + \beta_1\,\text{Income}_i + \beta_2\,\text{Student}_i
              + \beta_3(\text{Income}_i \times \text{Student}_i) + \varepsilon_i}
    \deqn{\frac{\partial \hat{y}_i}{\partial\,\text{Income}_i}
          = \hat{\beta}_1 + \hat{\beta}_3\,\text{Student}_i}
    If customer is a student: \eqn{\hat{\beta}_1 + \hat{\beta}_3}.
    If not: \eqn{\hat{\beta}_1}.

    \deqn{\frac{\partial \hat{y}_i}{\partial\,\text{Student}_i}
          = \hat{\beta}_2 + \hat{\beta}_3\,\text{Income}_i}
  }

  \subsection{Part E – Ordinal Predictors}{
    If predictors are ordinal, treat them like nominal categories but fix the
    baseline category as the lowest or highest category.
  }

  \subsection{Part F – Non-Linearity}{
    If the relationship between the study variable (\eqn{y}) and the predictors
    is not linear, we can choose higher degree polynomials for fitting the model.
    \deqn{y = \beta_0 + \beta_1 x + \beta_2 x^2 + \varepsilon}
    It is still a linear model because it is linear in parameters.

    \strong{NOTE:} \eqn{R_1^2 \leq R_2^2 \leq \cdots \leq R_p^2}
    (for linear, quadratic, \ldots, pth order polynomial x).
    \eqn{R^2} will increase as we increase the degree of polynomial.
    But after a certain level of polynomial, we need to stop due to overfitting.
    Overfitting \eqn{\Rightarrow} low bias, high variance.
  }
}

\section{Some Potential Problems in Multiple Linear Regression}{

  \subsection{1. Collinearity}{
    Suppose \eqn{x_2 = 2x_1} or \eqn{x_2 = 2 + 3x_1}: there is a perfect
    linear relationship between predictors \eqn{x_1, x_2}.  We say \eqn{x_1,
    x_2} is collinear.

    Model becomes:
    \deqn{y = \beta_0 + (\beta_1 + 2\beta_2)\,x_1 + \varepsilon}
    From OLS we can only obtain \eqn{\hat{\beta}_0} and
    \eqn{\widehat{\beta_1 + 2\beta_2}}.  We cannot obtain \eqn{\hat{\beta}_1}
    and \eqn{\hat{\beta}_2} separately.  This is an \strong{identifiability issue}.

    Even if the relationship is not perfectly linear, there will be uncertainty
    in the coefficient estimates.  Standard errors will be very large; t-ratio
    would be very small, leading to acceptance of \eqn{H_0} more often.  Power
    of the test is reduced due to collinearity.

    \strong{Power} = Prob\{Reject \eqn{H_0} | \eqn{H_0} is false\}.

    \strong{How to detect collinearity:}

    \emph{Method 1:} Look into the correlation matrix of the predictors.  The
    pair with high correlation (positive or negative) indicates highly correlated
    variables.  If \eqn{x_i} and \eqn{x_j} are highly correlated, discard one.

    \emph{Method 2 – Variance Inflation Factor (VIF):}
    \deqn{VIF(\hat{\beta}_j) = \frac{1}{1 - R^2_{x_j | x_j^-}}}
    where \eqn{R^2_{x_j | x_j^-}} is the \eqn{R^2} value obtained by regressing
    \eqn{x_j} on all the remaining predictors.
    For large \eqn{R^2_{x_j | x_j^-}}, VIF is large.
    For large VIF, multicollinearity is present.

    \strong{Thumb rule:} If \eqn{VIF(\hat{\beta}_j) > 5} or \eqn{10}, suspect
    \eqn{x_j} is linearly dependent on other predictors.

    \strong{Multicollinearity:} Linear dependence of predictors on the other
    predictors.

    \strong{Notes:}
    \itemize{
      \item \eqn{VIF(\hat{\beta}_j) = 1 \Leftrightarrow} No multicollinearity.
      \item Large VIF \eqn{\Leftrightarrow} Multicollinearity is present.
      \item VIF is always greater than 1.
    }

    Alternative VIF formula:
    \deqn{VIF(\hat{\beta}_j) = \frac{V(\hat{\beta}_j : \text{full model})}
                                    {V(\hat{\beta}_j : \text{on its own})}}

    Solutions to multicollinearity:
    \itemize{
      \item Drop one of the problematic predictors (one at a time).
      \item Combine the two problematic predictors into a single predictor
            (e.g. average of "Limit" and "Rating" to create "credit worthiness").
            Disadvantage: the new predictor may lack practical significance.
    }
  }

  \subsection{2. Outliers}{
    Observations of the response that are far away from the regression function
    are called \strong{outliers}.

    Detection:
    \itemize{
      \item Obtain the residual plot.  Isolated points on the top or bottom are
            potential outliers.
      \item Use Standardized Residuals (SR).  We expect 95\% of SR to lie
            between \eqn{\pm 2}.  A point is declared a potential outlier if
            \eqn{|SR| > 2.5}.
    }
  }

  \subsection{3. Leverage Points}{
    Unusual values of the predictors are known as \strong{leverage points}.

    Detection:
    \itemize{
      \item In the residual plot, isolated values on the left or right are
            potential leverage points.
      \item Compute the hat matrix \eqn{H = (h_{ii})}.
            \eqn{h_{ii}} measures how much of an effect an observation has on
            its own fitted value.  \eqn{0 < h_{ii} < 1}.
            The closer \eqn{h_{ii}} goes to 1, the more that fitted value is
            completely determined by its own observation.
    }

    Thumb rule:
    \deqn{l_0 = \frac{3(p+1)}{n}}
    Cases with leverage point value \eqn{> l_0} are called potential leverage
    points.
  }

  \subsection{4. Influential Points}{
    A point is said to be \strong{influential} if, when removed from the dataset,
    it results in a large change in the regression function.

    Detection: Use \strong{Cook's Distance (\eqn{D_i})}.
    \eqn{D_i} is a function of the standardized residuals and elements of the
    hat matrix.  A value of \eqn{D_i > 1} indicates an influential point.
  }

  \subsection{Final Steps for Regression Diagnostics}{
    \enumerate{
      \item Pick up the dataset and fit regression.
      \item Check multicollinearity.
      \item Check leverage points.
      \item Check outliers.
      \item Check for influential points.
      \item If yes (any of 2–5), remove.
      \item Then run the regression again.
    }
  }
}

\section{K-Nearest Neighbours (KNN) Regression}{

  \subsection{Overview}{
    Multiple linear regression is a \strong{parametric} approach since the
    functional form of \eqn{f(x)} is specified.

    \strong{Non-parametric approach:} Non-parametric methods are more flexible.
    They do not make explicit assumptions on functional forms.  KNN regression
    is the simplest non-parametric method.
  }

  \subsection{Case 1: Single Predictor}{
    Given \eqn{K} (number of nearest neighbours) and a new point \eqn{x_{\text{new}}},
    find the \eqn{K} nearest neighbours of \eqn{x_{\text{new}}} and compute
    \eqn{\hat{y}} as the arithmetic mean of the \eqn{y} values corresponding to
    these \eqn{K} nearest neighbours.

    Example (\eqn{n = 10, K = 4, x_{\text{new}} = 5}): 4 nearest neighbours of
    5 are x = 5, 5, 4, 6 (units 4, 9, 10, 8); corresponding y = 11, 31, 40, 22.
    \deqn{\hat{y} = \frac{11 + 22 + 31 + 40}{4} = 26}
  }

  \subsection{Case 2: Double Predictors}{
    Use Euclidean distance:
    \deqn{d = \sqrt{(x_{1,\text{new}} - x_{1i})^2 + (x_{2,\text{new}} - x_{2i})^2}}
    Find \eqn{K} points with minimum distance.  \eqn{\hat{y}} = average of
    corresponding \eqn{y} values.
  }

  \subsection{Distance Properties}{
    A distance \eqn{d} satisfies:
    \enumerate{
      \item \eqn{d(x,y) \geq 0}
      \item \eqn{d(x,y) = 0 \Leftrightarrow x = y}
      \item \eqn{d(x,y) = d(y,x)}
      \item \eqn{d(x,y) \leq d(x,z) + d(y,z)} [Triangle inequality]
    }
  }

  \subsection{Choice of K and Bias-Variance Tradeoff}{
    \itemize{
      \item If \eqn{K} is small: predicted value is close to true \eqn{y}; bias
            low, variance high (predicted value might change drastically if
            training sample changes).
      \item If \eqn{K} is large: predicted response is the average of a large
            number of values; variance is lower; bias higher.
    }
  }

  \subsection{Limitations}{
    As the number of predictors increases, it becomes difficult to find
    neighbours.  The nearest neighbours may have a very large Euclidean distance,
    which might result in a poor fit.
    \deqn{\text{predictors} \uparrow \Rightarrow \text{Bias} \uparrow}
  }
}

\section{Date: 18/02/26 – Model Selection}{

  Three model selection techniques:
  \enumerate{
    \item Best Subset Selection Technique.
    \item Forward Stepwise Selection.
    \item Backward Stepwise Selection.
  }

  \subsection{Best Subset Selection Technique}{
    \strong{Step 1:} Fit the null model.
    \deqn{y_i = \beta_0 + \varepsilon_i, \quad i = 1, \ldots, n}
    \deqn{\hat{\beta}_0 = \bar{y}, \quad R^2 = 0 \text{ (worst fit)}}

    \strong{Step 2:} Regress \eqn{y} on each of the predictors one by one.
    Choose the predictor that gives the highest \eqn{R^2} as the best model.

    \strong{Step 3:} Fit all possible models with exactly 2 predictors; choose
    the model which gives the largest \eqn{R^2}.

    \strong{Step 4:} Fit all 3 predictors (full model).

    Use \strong{Adjusted \eqn{R^2}} to draw the final conclusion across steps
    (as \eqn{R^2} always increases with more predictors).  Select the single
    best model with the highest Adjusted \eqn{R^2}.

    Total models fitted: \eqn{2^p}.

    \strong{Limitation:} Fitting \eqn{2^p} models is computationally expensive.
  }

  \subsection{Forward Stepwise Selection}{
    \strong{Step 1:} Fit a null model.

    \strong{Step 2:} Augment predictors one by one; choose model with highest
    \eqn{R^2}.

    \strong{Step 3:} Augment predictors one by one to the best model from Step 2;
    again choose the best.

    Continue until all predictors added.

    Total number of models fitted: \eqn{\frac{p(p+1)}{2} + 1}.

    \strong{Advantage:} Reduced computational time.
    \strong{Limitation:} Leaves out some combination of predictors which might
    give a better fit.
  }

  \subsection{Backward Stepwise Selection}{
    \strong{Step 1:} Start with the full model.
    \deqn{y_i = \beta_0 + \beta_1 x_{1i} + \beta_2 x_{2i} + \beta_3 x_{3i}
              + \varepsilon_i}

    \strong{Step 2:} Drop predictors one by one from the full model and check
    for the best model (highest Adj \eqn{R^2}).

    Continue dropping until only one predictor remains.
  }
}

\section{Backward Stepwise Regression - Model Comparison Table}{

  Step 2: From the full model, drop predictors one by one.

  \tabular{llll}{
    \strong{Model} \tab \strong{Predictor Dropped} \tab \strong{Fitted Response} \tab \strong{R^2} \cr
    M1 \tab Age    \tab yhat = -385.17 + 0.264*x2 - 7.6632*x3 \tab 0.871 \cr
    M2 \tab Limit  \tab yhat = 359.64 - 2.1851*x1 + 6.2359*x3 \tab 0.218 \cr
    M3 \tab Income \tab yhat = -173.4 - 2.291*x1 + 0.1734*x2  \tab 0.7408 \cr
  }

  \strong{Best Model: M1}

  \deqn{\hat{y} = -385.17 + 0.264\,x_2 - 7.6632\,x_3}

  Adj R^2 = 0.871

  \strong{Step 3:} From the best model in previous step, drop predictors one by one.

  \tabular{llll}{
    \strong{Model} \tab \strong{Predictor Dropped} \tab \strong{Fitted Response} \tab \strong{R^2} \cr
    M4 \tab Income \tab yhat = -292.8 + 0.1716*x2         \tab 0.743 \cr
    M5 \tab Limit  \tab yhat = 246.5148 + 6.048*x3        \tab 0.215 \cr
  }

  \strong{Best Model: M4}

  \deqn{\hat{y} = -292.8 + 0.1716\,x_2}

  Adj R^2 = 0.743

  \strong{Step 4:} We drop predictors one by one from the best model selected in Step 3.

  \deqn{\hat{y} = 520.01}

  Adj R^2 = 0

  The best model is the one from all the best models at each step;
  we choose that selected as the final model as the one with the
  largest Adj R^2 value.

  \strong{Therefore, the best model is M1:}

  \deqn{\hat{y} = -385.17 + 0.264\,x_2 - 7.6632\,x_3}

  \strong{Advantage:} Limitations of both Forward and Backward Stepwise are the same.
}

\section{B. Regularisation (Shrinkage Methods)}{

  Model: \eqn{y_i = \beta x_i + \varepsilon_i}, \eqn{i = 1, 2, \ldots, n}

  \strong{OLS Estimator:}
  \deqn{\hat{\beta}_{OLS} = \arg\min_{\beta} \sum_{i=1}^{n} (y_i - \beta x_i)^2
        = \frac{\sum_{i=1}^{n} x_i y_i}{\sum_{i=1}^{n} x_i^2}}

  \strong{Ridge Estimator:}
  \deqn{\hat{\beta}_R = \arg\min_{\beta} \left[ \sum_{i=1}^{m} (y_i - \beta x_i)^2 + \lambda \beta^2 \right]}

  \deqn{\hat{\beta}_{Ridge} = \frac{\sum x_i y_i}{\sum x_i^2 + \lambda} = \hat{\beta}_R(\lambda)}

  Note: \eqn{\hat{\beta}_{OLS} \geq \hat{\beta}_R(\lambda)}

  \strong{Shrinkage Methods:}
  \enumerate{
    \item Ridge Regression
    \item LASSO
    \item Elastic Net
  }

  In case \eqn{n} is very close to \eqn{p} (\eqn{n \approx p}) or \eqn{p > n},
  we face the problem of overfitting. The ordinary least squares estimators
  become very unstable; the variance of the regression coefficients becomes
  large (in some cases infinity). The t-tests are often accepted leading to
  wider confidence intervals and loss of power.

  In these cases, OLS estimates are not reliable and we opt for shrinkage
  techniques which are automated methods to shrink some of the regression
  coefficients towards 0.
}

\section{Ridge Regression}{

  We consider the model:
  \deqn{y_i = \beta_0 + \beta_1 x_{1i} + \beta_2 x_{2i} + \cdots + \beta_p x_{pi} + \varepsilon_i,
        \quad i = 1(1)n}

  \deqn{\varepsilon_i \overset{iid}{\sim} N(0, \sigma^2)}

  OLS Technique minimises the quantity RSS:
  \deqn{RSS = \sum_{i=1}^{n} (y_i - \beta_0 - \beta_1 x_{1i} - \cdots - \beta_p x_{pi})^2}

  \deqn{\hat{\beta}_{OLS} = \arg\min_{\beta}\, RSS}

  In Ridge Regression we minimise the penalised residual sum of squares:
  \deqn{PRSS = \sum_{i=1}^{n}(y_i - \beta_0 - \beta_1 x_{1i} - \cdots - \beta_p x_{pi})^2
               + \lambda \sum_{j=1}^{p} \beta_j^2 \quad \cdots (1)}

  \deqn{PRSS = RSS + \lambda \sum_{j=1}^{p} \beta_j^2}

  The Ridge estimator of \eqn{\beta} is given by:
  \deqn{\hat{\beta}_{Ridge} = \arg\min_{\beta}\, PRSS}

  \deqn{\hat{\beta}_R(\lambda), \quad \text{where } \lambda \geq 0 \text{ is known as the tuning parameter.}}

  The Ridge Regression Problem can be written in an alternative way as:
  \deqn{\min_{\beta} \sum_{i} (y_i - \beta_0 - \beta_1 x_{1i} - \cdots - \beta_p x_{pi})^2
        \quad \text{subject to} \quad \sum_{j=1}^{p} \beta_j^2 \leq t \quad \cdots (2)}

  where \eqn{t} acts as a Budget parameter.

  Now there is a one-to-one correspondence between the minimisation problem
  in (1) and (2).

  \eqn{\lambda = 0} gives the ordinary least squares (OLS) estimation problem.

  \strong{Example (simple case):} \eqn{y_i = \beta x_i + \varepsilon_i}
  \deqn{\hat{\beta}_{OLS} = \frac{\sum x_i y_i}{\sum x_i^2}}
  \deqn{\hat{\beta}_R(\lambda) = \frac{\sum x_i y_i}{\sum x_i^2 + \lambda}}
  \deqn{\hat{\beta}_R(\lambda) \leq \hat{\beta}_{OLS}}

  \strong{Notes:}
  \enumerate{
    \item \eqn{\lambda \sum_{j=1}^{p} \beta_j^2} is known as the \strong{shrinkage penalty}.
          Therefore Ridge Regression uses \strong{L2 penalty} function.
          Larger the value of \eqn{\lambda}, more is the shrinkage since for PRSS
          to be minimum we must have \eqn{\sum_{j=1}^{p} \beta_j^2} to be small,
          which implies \eqn{\beta_j}'s must be small and shrink towards 0.

    \item \eqn{\lambda} controls the \strong{bias-variance tradeoff}.
          Hence determining an optimal value of \eqn{\lambda} is very crucial.
          It is done using \strong{Cross-Validation} method.

          If \eqn{\lambda} is large, most coefficients will shrink towards 0.
          Hence the model will become more explainable and simple. A simple model
          will have high bias but low variance. Moreover, large \eqn{\lambda}
          implies low flexibility.

    \item When there are too many predictors in the model, there may occur
          correlated variables; the coefficients of which may be poorly
          determined with high variances. This is the problem of
          \strong{multicollinearity}. Shrinking the coefficients will help
          reduce this multicollinearity problem.

    \item Ridge Regression will shrink some coefficients to 0 (coefficients
          of variables that are not important) but will not set all the
          predictors' coefficients to 0 exactly. Hence finally all the
          predictors will remain in the model but with reduced weightage for
          some predictors.
  }

  Sometimes instead of plotting \eqn{\hat{\beta}_R(\lambda)} against \eqn{\lambda},
  we plot \eqn{\hat{\beta}_R(\lambda)} against:
  \deqn{\frac{\|\hat{\beta}_R(\lambda)\|_2}{\|\hat{\beta}\|_2}}

  where \eqn{\|\hat{\beta}\|_2 = \sum_d \beta_d^2}

  \deqn{0 \leq \frac{\sum_{j=1}^{p} \hat{\beta}_{Rj}^2(\lambda)}{\sum_{j=1}^{p} \hat{\beta}_{OLS,j}^2} \leq 1}

  Maximum value '1' is attained when \eqn{\lambda = 0}.

  \eqn{\lambda} and \eqn{\frac{\sum_{j=1}^{p} \hat{\beta}_{Rj}^2(\lambda)}{\sum_{j=1}^{p} \hat{\beta}_{OLS,j}^2}}
  are inversely related.

  Large \eqn{\lambda} => most coefficients shrink to 0 => simple model => Bias high.

  \strong{Note:} Before doing Ridge Regression we must standardise the input variables first.

  \strong{Bias-Variance Tradeoff Diagram:}

  As \eqn{\lambda} increases: Test MSE forms a U-shape; Bias increases;
  Variance decreases. The optimum point is where Test MSE is minimised.
}

\section{LASSO (Least Absolute Shrinkage and Selection Operator)}{

  LASSO performs a two-fold task:
  \enumerate{
    \item Variable Selection
    \item Regularisation / Shrinkage
  }

  \itemize{
    \item Variable selection - LASSO is similar to subset selection.
    \item Shrinkage - LASSO is similar to Ridge Regression (Regularisation).
  }

  Suppose \eqn{p >> n} but the true model is actually sparse, i.e., \eqn{k (<p)}
  of the \eqn{p} predictors are important. Then using LASSO we can estimate the
  parameters efficiently without knowing which \eqn{k} parameters are non-zero.
  LASSO yields sparse solution vector, i.e., only some of the coefficients
  would be non-zero.

  \strong{Importance of Sparsity:}
  \enumerate{
    \item Model interpretation becomes easier since many predictors will not
          appear in the final model.
    \item Use a procedure that performs well in sparse problems. Since no
          procedure works well on dense problems, this is known as the
          "best on sparsity" principle.
    \item Prediction accuracy can be improved at the cost of reduced variance
          though bias will increase.
  }

  \strong{OLS:} obtained by minimising RSS
  \deqn{RSS = \sum_{i=1}^{n} (y_i - \beta_0 - \beta_1 x_{1i} - \cdots - \beta_p x_{pi})^2 \quad \cdots (1)}

  \strong{LASSO} minimises a penalised residual sum of squares:
  \deqn{PRSS = \sum_{i=1}^{p} (y_i - \beta_0 - \beta_1 x_{1i} - \cdots - \beta_p x_{pi})^2
               + \lambda \sum_{j=1}^{p} |\beta_j| \quad \cdots (2)}

  where \eqn{\lambda > 0} is the tuning parameter that controls the
  bias-variance tradeoff of the model.

  The minimisation problem in (2) can alternatively be written as:
  \deqn{\min \sum_{i=1}^{n}(y_i - \beta_0 - \beta_1 x_{1i} - \cdots - \beta_p x_{pi})^2
        \quad \text{subject to} \quad \sum_{j=1}^{p} |\beta_j| \leq t \quad \cdots (3)}

  There is a one-to-one correspondence between the minimisation problems
  in (2) and (3).

  \strong{Notes:}
  \enumerate{
    \item \eqn{\lambda \sum_{j=1}^{p} |\beta_j|} is known as the penalty function.
          Therefore LASSO uses \strong{L1 penalty} function.

    \item Bias-variance tradeoff:
      \enumerate{
        \item \eqn{\lambda = 0} gives the least squares regression.
        \item As \eqn{\lambda \to \infty}, LASSO will yield very sparse solution.
              Most of the coefficients will be 0. This will fail to capture
              the main signals of the data.
        \item \eqn{\lambda} should be so chosen that it can strike a balance
              between a simple model and a complex model.
      }
  }

  \strong{Constraint regions:}
  \itemize{
    \item LASSO: \eqn{|\beta_1| + |\beta_2| \leq t}
    \item Ridge: \eqn{\beta_1^2 + \beta_2^2 \leq t}
  }
}

\section{Elastic Net}{

  Elastic Net is a weighted combination of L1 and L2 penalty combination.
  Elastic Net minimises the Penalised Residual Sum of Squares:

  \deqn{PRSS = \sum_{i=1}^{n}(y_i - \beta_0 - \beta_1 x_{1i} - \cdots - \beta_p x_{pi})^2
               + \lambda_1 \sum_{j=1}^{p} \beta_j^2
               + \lambda_2 \sum_{j=1}^{p} |\beta_j|}

  \eqn{\lambda_1, \lambda_2} are the tuning parameters which are chosen by
  cross validation method.

  Elastic Net gives an improved model prediction.
}

\section{Cross Validation}{

  How to choose the optimal value of \eqn{\lambda} (tuning parameter or
  hyperparameter) using Cross Validation?

  \strong{Step 0:} Set aside 20\% of the data as test data.
  We shall work with 80\% of the data.
  We denote the sample size of this 80\% data as 'n'.

  \strong{Step 1:} Divide the \eqn{n} observations randomly into 'K' groups.
  Take \eqn{K = 5, 6}, etc.

  Example (suppose \eqn{K = 5}): Set 1, Set 2, ..., Set 5 -- each has 16 observations.

  These K groups are known as the Validation Groups.
  These K groups in turn (one-by-one) will form the Validation Groups.

  \strong{Step 2:} We randomly select one set as a Validation Group.
  Let it be Set 1. We combine the data from all the remaining sets
  and call it the training data.
  [Here \eqn{16 \times 4 = 64} observations form our training data]

  \strong{Step 3:} Based on the training sample we apply Ridge or LASSO or
  any technique for different choices of \eqn{\lambda} and we get the
  estimated coefficients. Let the coefficients be denoted by
  \eqn{\hat{\beta}_0(\lambda), \hat{\beta}_1(\lambda), \ldots, \hat{\beta}_p(\lambda)}.

  \strong{Step 4:} Using the feature values from the Validation Set and
  the estimated coefficients from Step 3, we can predict the response.
  Let the predicted response be denoted by \eqn{\hat{y}_i(\lambda)}.

  Example: \eqn{\hat{\beta}_0(\lambda) = 2}, \eqn{\hat{\beta}_1(\lambda) = 3}
  \deqn{\hat{y}_i = \hat{\beta}_0 + \hat{\beta}_1 x_{1i}}
  \deqn{\hat{y}_i = 2 + 3x_{1i}}
  [You get the \eqn{x_{1i}} value from the Validation Set, i.e., Set 1.]

  We have \eqn{y_i} in the Set 1. \eqn{(y_i - \hat{y}_i)} gives error.

  \strong{Step 5:} Compute Mean Squared Error from the Validation Set:
  \deqn{\frac{1}{n_{valid}} \sum_{i \in \text{Validation Set}} (y_i - \hat{y}_i(\lambda))^2 = MSE_I(\lambda)}

  \eqn{n_{valid}} = number of observations in the validation set.

  Correct divisor = \eqn{n_{valid} - p - 1}
  [This is also degrees of freedom. We choose \eqn{n_{valid}} as divisor
  because \eqn{n_{valid} >> p-1}]

  \strong{Step 6:} Repeat Steps 1--5 for 'K' groups one-by-one.
  Each group gets the role of being the Validation Set.
  For this we shall get \eqn{MSE_I(\lambda), MSE_{II}(\lambda), \ldots, MSE_K(\lambda)}
  for a fixed choice of \eqn{\lambda}.

  \strong{Step 7:} We repeat Steps 1--6 for different choices of \eqn{\lambda}.
  We choose that \eqn{\lambda} which gives the minimum average MSE.

  This is the \strong{Cross-Validation Technique}.

  \strong{Cross Validation Table:}
  \tabular{llllll}{
    \strong{lambda} \tab \strong{S1} \tab \strong{S2} \tab \strong{...} \tab \strong{SK} \tab \strong{Avg MSE} \cr
    0.01 \tab MSE_I(lambda) \tab MSE_II(lambda) \tab ... \tab MSE_K(lambda) \tab MSE_{lambda=0.01} \cr
    0.50 \tab ... \tab ... \tab ... \tab ... \tab MSE_{lambda=0.50} -> least (say) \cr
  }

  We choose that lambda for which Avg MSE is least.

  Cross Validation technique helps to get an optimal value of \eqn{\lambda}.
  With this optimal choice we go back to the original training data and fit
  the model to get the training MSE. Use the fitted coefficients in the Test
  data to get the Test MSE.

  \strong{Question:} How do you estimate hyperparameters of a model?
  Answer: Write all steps for Cross Validation.
}

\section{Classification}{

  \itemize{
    \item Response variable is qualitative or categorical having 2 or more
          categories (mutually exclusive).
    \item A 2-category Y variable is called \strong{binary} response variable.
    \item Categories are nominal.
    \item Different classification techniques -- classifiers:
      \itemize{
        \item Logistic Regression
        \item KNN
        \item GAM
        \item Trees
        \item Random Forest
        \item Boosting
        \item Linear Discriminant Analysis
        \item Support Vector Machines
      }
  }

  We are provided with training observations:
  \deqn{(x_1, y_1),\, (x_2, y_2),\, \ldots,\, (x_n, y_n)}

  => Use the training data to build classifier and test it.
  => The classifier would work well for both test and training data.

  \strong{Example (Default data):}
  \itemize{
    \item Y = 1: if person is credit card defaulter
    \item Y = 0: otherwise
  }

  There are many predictors.

  Suppose there is a single predictor, say Income, for predicting whether
  a person is a defaulter or not. What could be Step 1?

  \strong{Step 1:} Make a box plot for the quantitative predictor for 2
  categories of Y [here: Defaulter or Non-defaulter] and make appropriate
  comment. No prediction can be made from here as no model is built.

  For model building, why not use a simple linear regression model?

  Example: Suppose Y is a categorical predictor denoting medical codes
  condition of a person admitted in the ER of a hospital.
  \itemize{
    \item Y = 1 if person has epileptic seizure
    \item Y = 2 if person has stroke
    \item Y = 3 if person has drug overdose
  }

  Let \eqn{x_1, x_2, \ldots, x_p} be \eqn{p} predictors.
  For response variable with more than 2 categories, Least Square Theory
  can't be used to fit the model since it would treat the categories of Y
  as numeric since we know \eqn{1 < 2 < 3}. So any reordering of the
  categories will change the result.
}

\section{Two Category Response Model}{

  Suppose Y = 1 if stroke, Y = 0 if drug overdose.

  We use the linear regression model:
  \deqn{E(Y | x_1, x_2, \ldots, x_p) = \beta_0 + \beta_1 x_1 + \cdots + \beta_p x_p}

  Using OLS we find \eqn{\hat{\beta}_0, \hat{\beta}_1, \ldots, \hat{\beta}_p}
  and obtain \eqn{\hat{E}(Y | x_1, \ldots, x_p)}.

  We predict stroke if \eqn{\hat{E}(Y | x_1, \ldots, x_p) > 0.5}, else \eqn{\hat{y} = 0}.

  \strong{Important:}
  \deqn{E(Y | x_1, x_2, \ldots, x_p) = 1 \times P(Y=1|x_1,x_2,\ldots,x_p)
        + 0 \times P(Y=0|x_1,x_2,\ldots,x_p)
        = P(Y=1|x_1,x_2,\ldots,x_p)}
}

\section{Logistic Regression}{

  Consider a single predictor, say \eqn{x}.

  \deqn{E(Y|x) = P(Y=1|x) = \beta_0 + \beta x}

  where \eqn{\beta_0, \beta \in \mathbb{R}}, \eqn{x \in \mathbb{R}}.

  This is known as \strong{Linear Probability Model (LPM)}, often used by
  practitioners for its simplicity.

  \strong{Limitations:}
  \itemize{
    \item It might fall beyond the range [0, 1].
  }

  \strong{Logistic Function:}
  \deqn{E(Y|x) = P(Y=1|x) = \frac{e^{\beta_0 + \beta x}}{1 + e^{\beta_0 + \beta x}} = P(x)}

  where \eqn{\beta_0, \beta, x \in \mathbb{R}}.

  \strong{Merit:} It is automatically bounded between 0 and 1.

  \strong{Demerit:} This model is non-linear in the parameters as well as
  \eqn{x}, so OLS can't be applied. Use \code{glm()} function to fit this model.

  \strong{Odds and Logit:}

  \deqn{\frac{P(x)}{1 - P(x)} = e^{\beta_0 + \beta x}}

  which is known as \strong{odds of a positive response} (say odds of stroke here).

  \deqn{\log\left(\frac{P(x)}{1-P(x)}\right) = \beta_0 + \beta x}

  is known as \strong{log odds} or \strong{logit}.

  \strong{Interpretation of logit:}
  Increasing \eqn{x} by 1 unit results in increment/decrement of the
  logit by \eqn{\beta} units.

  \strong{Derivative of P(x):}
  \deqn{P(y=1|x) = \frac{e^{\beta_0 + \beta x}}{1 + e^{\beta_0 + \beta x}}}

  \deqn{\frac{\partial P(y=1|x)}{\partial x}
        = \frac{(1 + e^{\beta_0+\beta x})\,e^{\beta_0+\beta x}\cdot\beta
                - e^{\beta_0+\beta x}\cdot e^{\beta_0+\beta x}\cdot\beta}{(1 + e^{\beta_0+\beta x})^2}}

  \deqn{= \beta \cdot \frac{e^{\beta_0+\beta x}}{1+e^{\beta_0+\beta x}}
         \cdot \left(1 - \frac{e^{\beta_0+\beta x}}{1+e^{\beta_0+\beta x}}\right)}

  \deqn{\Rightarrow \frac{\partial P(x)}{\partial x} = \beta\, P(x)\,(1 - P(x))}

  The incremental effect of \eqn{x} on probability of a positive response
  is not constant. It depends upon the value of \eqn{x}.

  The incremental effect is maximum if \eqn{P(x) = \frac{1}{2}}.
}

\section{Estimation of Model Parameters}{

  \enumerate{
    \item Non-linear least squares.
    \item Maximum Likelihood Method.
  }

  Let \eqn{Y_i \sim \text{Bern}(p_i)}.

  \deqn{f(y_i) = p_i^{y_i}(1-p_i)^{1-y_i}}

  \deqn{L = \prod_{i=1}^{n} f(y_i) = \prod_{i=1}^{n} p_i^{y_i}(1-p_i)^{1-y_i}}

  \deqn{\ln L = \sum_{i=1}^{n} y_i \ln p_i + \sum_{i=1}^{n}(1-y_i)\ln(1-p_i)}

  \strong{Score Equations:}
  \deqn{\frac{\partial L}{\partial \beta_0} = \frac{\partial L}{\partial p_i}
        \cdot \frac{\partial p_i}{\partial \beta_0} = 0}
  \deqn{\frac{\partial L}{\partial \beta} = \frac{\partial L}{\partial p_i}
        \cdot \frac{\partial p_i}{\partial \beta} = 0}
}

\section{Logistic Regression - Numerical Examples}{

  \strong{Example 1 (Balance as predictor):}

  \tabular{lllll}{
    \strong{Parameter} \tab \strong{Estimate} \tab \strong{SE} \tab \strong{Z-stat} \cr
    Intercept \tab -10.6513 \tab 0.3612 \tab -29.5 \cr
    Balance   \tab 0.0055   \tab 0.0002 \tab 24.9  \cr
  }

  \strong{Fitted model:}
  \deqn{\hat{P}(Y=1|x_i) = \frac{e^{-10.6513 + 0.0055 x_i}}{1 + e^{-10.6513 + 0.0055 x_i}}}

  Interpretation: \eqn{\hat{\beta} = 0.0055} means for one unit increment
  of Balance, the log odds of defaulting increases by 0.0055 units.
  Balance is a significant predictor for predicting default status since
  Z is large.

  Predict \eqn{P(Y=1|x=1000) = ?}

  \strong{Example 2 (Student - Binary Covariate):}

  \eqn{\hat{\beta}_0 = -3.5041}, \eqn{\hat{\beta} = 0.4049}

  \deqn{\hat{P}(Y=1|x=1) = ?}

  \strong{Example 3 (Study hours as predictor):}

  \deqn{x: \text{study hours};\quad Y = \begin{cases} 1 & \text{pass} \\ 0 & \text{fail} \end{cases}}

  \deqn{\hat{P}(Y=1|x) = \frac{e^{-62.46 + 20.82x}}{1 + e^{-62.46 + 20.82x}}}

  \strong{Odds:}
  \deqn{O_1 = \frac{P(Y=1|x)}{P(Y=0|x)}, \quad O_2 = \frac{P(Y=1|x+1)}{P(Y=0|x+1)}}

  \eqn{O_1}: Odds of passing exam when study hours is \eqn{x}.
  \eqn{O_2}: Odds of passing exam when study hours is \eqn{x+1}.

  \strong{Odds Ratio:}
  \deqn{\frac{O_1}{O_2} = \frac{P(Y=1|x)}{P(Y=1|x+1)} \cdot \frac{P(Y=0|x+1)}{P(Y=0|x)}}

  \deqn{\frac{O_2}{O_1} = e^{\beta} \Rightarrow \ln OR = \beta}

  Estimate of OR = \eqn{e^{\hat{\beta}}}

  Estimate of log OR = \eqn{\hat{\beta} = 20.82}

  So for one unit increment in study hours, the log odds of passing the
  exam increases by 20.82 units.

  \strong{Probability Calculations:}
  \deqn{\hat{P}(Y=1|X=3) = \frac{e^{-62.46+20.82\times3}}{1+e^{-62.46+20.82\times3}} \approx 0.5}

  \deqn{P(Y=1|x=5) = \frac{e^{-62.46+20.82\times5}}{1+e^{-62.46+20.82\times5}} = 1}

  From a chance of 50\% for passing the exam, it becomes a sure event for
  passing the exam if study hours increases from 3 to 5 hours.

  \strong{Marginal effect:}
  Is the marginal effect of 1 extra hour of study constant in logistic regression?

  \deqn{\text{marginal effect} = \frac{\partial P(x)}{\partial x} = \beta\, P(x)\,(1-P(x))}

  => Not a constant; depends on \eqn{x}.
}

\section{Multiple Logistic Regression}{

  \deqn{\hat{P}(\mathbf{x}) = \frac{e^{\hat{\beta}_0 + \hat{\beta}_1 x_1 + \cdots + \hat{\beta}_p x_p}}
        {1 + e^{\hat{\beta}_0 + \hat{\beta}_1 x_1 + \cdots + \hat{\beta}_p x_p}}}

  \strong{Interpretation of any regression coefficient:}
  Interpret in terms of log odds.

  \deqn{\ln \text{ odds} = \hat{\beta}_0 + \hat{\beta}_1 x_1 + \cdots + \hat{\beta}_p x_p}

  \strong{Interpretation of} \eqn{\hat{\beta}_i}: For 1 unit increment in \eqn{x_i},
  the log odds increases by \eqn{\hat{\beta}_i} units, holding other factors constant.

  \strong{Marginal effect (Important):}
  \deqn{\frac{\partial \hat{P}(x_1, \ldots, x_p)}{\partial x_i} = \ldots}

  Prepare a confusion matrix table (cut point is given).
  Given cut point is 0.4:
  \deqn{y = \begin{cases} 1 & \text{if } \hat{P} \geq 0.4 \\ 0 & \text{otherwise} \end{cases}}
}

\section{Predicted Response and Classification Accuracy}{

  \strong{Predicted Response:}
  \deqn{\hat{y} = 1 \text{ if } \hat{P} \geq 0.5, \quad = 0 \text{ otherwise}}

  Using a cutoff of 0.5, classify each student as pass/fail.
  Construct a confusion matrix.

  \strong{Confusion Matrix Structure:}
  \tabular{lll}{
              \tab \strong{Y=1} \tab \strong{Y=0} \cr
    \strong{yhat=1} \tab TP \tab FP \cr
    \strong{yhat=0} \tab FN \tab TN \cr
  }

  Row totals: TP+FP, FN+TN. Column totals: TP+FN, FP+TN.

  \strong{Types of Error:}
  \itemize{
    \item \eqn{P(\hat{Y}=1|Y=0) = \varepsilon_0} (Type I error)
    \item \eqn{P(\hat{Y}=0|Y=1) = \varepsilon_1} (Type II error)
  }

  \deqn{\hat{\varepsilon}_0 = P(\hat{Y}=1|Y=0)
        = \frac{P(\hat{Y}=1, Y=0)}{P(Y=0)} = \frac{1/10}{4/10} = \frac{1}{4}}

  \deqn{\hat{\varepsilon}_1 = P(\hat{Y}=0|Y=1)
        = \frac{P(\hat{Y}=0, Y=1)}{P(Y=1)} = \frac{0/10}{6/10} = 0}

  \strong{Sensitivity and Specificity:}
  \deqn{\text{Sensitivity} = \Pi_1 = P(\hat{Y}=1|Y=1)}
  \deqn{\text{Specificity} = \Pi_0 = P(\hat{Y}=0|Y=0)}

  \deqn{\Pi_1 = P(\hat{Y}=1|Y=1) = \frac{P(\hat{Y}=1, Y=1)}{P(Y=1)} = 1 - \hat{\varepsilon}_1}

  \deqn{\Pi_0 = 1 - \hat{\varepsilon}_0}
}

\section{ROC Curve and Optimal Cutpoint}{

  How to get the predicted value of Y after fitting logistic regression?

  \strong{Step 1:} After estimation of the model parameters we can get the
  fitted probabilities:
  \deqn{\hat{P}(Y_i=1|x_i) = \hat{p}_i = \frac{e^{\hat{\beta}_0 + \hat{\beta} x_i}}{1 + e^{\hat{\beta}_0 + \hat{\beta} x_i}}}

  where \eqn{\hat{\beta}_0} and \eqn{\hat{\beta}} are the maximum likelihood estimators.

  Suppose \eqn{\hat{p}_i} values = 0.96, 0.85, 0.77, 0.65, 0.55 (n=5)

  \strong{Step 3:} Taking \eqn{\hat{p}_1} as the cutpoint, classify the Y values
  as 0 and 1. Next taking \eqn{\hat{p}_2} as the cut point classify the Y values.
  Continuing this way, taking \eqn{\hat{p}_5} as the cut point classify the Y values.

  \strong{Step 4:} Prepare the column for observed Y and predicted Y and from
  these prepare a cross classified table of Y and \eqn{\hat{Y}}. This is called
  \strong{confusion matrix}.

  \strong{Step 5:} For each of the confusion matrices calculate TPR (True Positive
  Rate), FPR (False Positive Rate).

  \deqn{(\Pi_1) = TPR = P(\hat{Y}=1|Y=1) = \text{sensitivity of a diagnostic problem}}

  \deqn{(\varepsilon_0) = FPR = P(\hat{Y}=1|Y=0) = \text{Error}_0}

  We want TPR to be high and FPR to be low (= 1 - specificity).

  \strong{Step 6:} Choose that model (cut point) for which TPR(1 - FPR) is
  maximum and then classify on the basis of that cut point.

  \strong{Confusion Matrix Table (5 cutpoints) -- columns i, P_i, T1, T2:}
  \tabular{llll}{
    \strong{i} \tab \strong{P_i} \tab \strong{T1} \tab \strong{T2} \cr
    1 \tab 0.96 \tab 1 \tab 1 \cr
    2 \tab 0.85 \tab 0 \tab 1 \cr
    3 \tab 0.77 \tab 0 \tab 0 \cr
    4 \tab 0.65 \tab 0 \tab 0 \cr
    5 \tab 0.55 \tab 0 \tab 0 \cr
  }

  \strong{Confusion Matrix Table (5 cutpoints) -- columns i, T3, T4, T5:}
  \tabular{llll}{
    \strong{i} \tab \strong{T3} \tab \strong{T4} \tab \strong{T5} \cr
    1 \tab 1 \tab 1 \tab 1 \cr
    2 \tab 1 \tab 1 \tab 1 \cr
    3 \tab 1 \tab 1 \tab 1 \cr
    4 \tab 0 \tab 1 \tab 1 \cr
    5 \tab 0 \tab 0 \tab 1 \cr
  }
}

\section{Type I and Type II Errors in Classification}{

  \strong{Type I Error:}
  \deqn{P(\text{Type I error}) = P(\hat{Y}=1|Y=0) = FPR = \frac{FP}{FP+TN}}

  \deqn{1 - P(\text{Type I error}) = P(\hat{Y}=0|Y=0) = \frac{TN}{FP+TN} = \text{Specificity}}

  Note: Specificity + FPR = 1.
  Desirable thing is high Specificity and low FPR.

  \strong{Type II Error:}
  \deqn{P(\text{Type II error}) = P(\hat{Y}=0|Y=1) = FNR = \frac{FN}{TP+FN}}

  \deqn{\text{Power} = 1 - P(\text{Type II error}) = P(\hat{Y}=1|Y=1) = \frac{TP}{TP+FN}}

  Power of the test is known as \strong{sensitivity} of a classifier.
  Also called \strong{RECALL}.

  FNR + RECALL = 1.

  \strong{Desirable feature:} FNR low; RECALL high.

  Interpret: RECALL of a classifier is 80\% means out of 100 true
  occurrences of true positives, the classifier has been able to classify
  80 as positives.

  TPR = Prob{\eqn{\hat{Y}=1|Y=1}}.
  TPR(1 - FPR) should be high.
}

\section{Positive Predictive Value (PPV)}{

  \deqn{PPV = P(Y=1|\hat{Y}=1) = \frac{P(Y=1, \hat{Y}=1)}{P(\hat{Y}=1)} = \frac{TP}{TP+FP}}

  PPV is also called \strong{Precision}.

  Note: A classifier has 80\% precision implies if a classifier has
  classified 100 units as positive then only 80 are actually positive.

  It is also desirable to have high precision.

  \strong{Requirement:} High precision and high RECALL.

  \deqn{\text{Precision} + \text{RECALL} = \frac{TP}{TP+FP} + \frac{TP}{TP+FN}}

  \itemize{
    \item If FP = FN: RECALL and Precision are same.
    \item If FP < FN: High Precision and low RECALL.
    \item If FP > FN: Low Precision and high RECALL.
  }

  FP is linked with Prob(Type I error) and FN is linked with
  Prob(Type II error). We know both Type I error and Type II error
  cannot be minimised simultaneously. Therefore we can't make both
  Precision and RECALL high simultaneously. So we must strike a balance.

  Hence we look into \strong{F1 Score}.
}

\section{F1 Score}{

  F1 Score is the harmonic mean of Precision and RECALL.

  \deqn{F1\text{ Score} = \frac{2}{\frac{1}{P} + \frac{1}{R}} = \frac{2PR}{P+R}}

  where P = Precision, R = RECALL.

  \strong{Why harmonic mean is chosen?}
  Suppose Precision of a classifier is 1 and RECALL is 0. Then if we
  take the Arithmetic Mean:
  \deqn{AM = \frac{1+0}{2} = \frac{1}{2} \Rightarrow \text{ which is not a bad classifier (misleading)}}

  HM = 0, which correctly reflects the true picture since any one of
  RECALL or Precision is low then the classifier is not good. That one
  which should be reflected in the metric we choose.

  HM is a natural measure when we are averaging rates.
}

\section{Negative Predictive Value (NPV)}{

  \deqn{NPV = P(Y=0|\hat{Y}=0) = \frac{TN}{FN+TN}}

  Express NPV in terms of specificity and sensitivity.

  Let \eqn{P(Y=0) = \theta}, \eqn{P(Y=1) = 1 - \theta}.

  \eqn{\Pi_0} = specificity, \eqn{\Pi_1} = sensitivity.

  \deqn{NPV = \frac{\Pi_0 \cdot \theta}{\theta(\Pi_0 - \Pi_1) + \Pi_1}}

  \deqn{P\{\hat{Y}=0, Y=0\} = \Pi_0 \cdot \theta}

  \deqn{P\{\hat{Y}=0, Y=1\} = (1-\Pi_1)(1-\theta) = 1 - \theta - \Pi_1 + \Pi_1\theta}
}

\section{KNN Classification}{

  \enumerate{
    \item If predictors are qualitative, you have to convert them into
          numeric values to perform KNN.
    \item All predictors should be standardised.
  }

  \strong{Example:}
  \tabular{lll}{
    \strong{obs} \tab \strong{Y} \tab \strong{(x1,x2)} \cr
    1 \tab poor \tab (2,6) \cr
    2 \tab poor \tab (3,7) \cr
    3 \tab satis \tab ( ) \cr
  }

  Nearest neighbours and predicted Y:
  \tabular{ll}{
    obs 1: \tab 2,3,4 -> satisfactory \cr
    obs 2: \tab 3,4,5 -> satisfactory \cr
    obs 3: \tab 4,5,6 -> good \cr
  }

  \strong{Misclassification rate:}
  \deqn{\text{Misclassification rate} = \frac{\# \text{misclassified cases}}{\# \text{cases}} = \frac{8}{8} = 1}

  Misclassification = sum of all off-diagonal elements.
  Correct classification = sum of diagonal elements.

  \strong{Confusion Matrix Example:}
  \tabular{llll}{
            \tab \strong{poor} \tab \strong{satis} \tab \strong{good} \cr
    \strong{good}  \tab 0 \tab 0 \tab 2 \cr
    \strong{poor}  \tab 0 \tab 0 \tab 2 \cr
    \strong{satis} \tab 3 \tab 1 \tab 0 \cr
  }
}

\section{Multicategory Logistic Regression Model}{

  Suppose the response variable \eqn{y} has J categories, and let
  \eqn{P(y \in j) = \pi_j}, \eqn{j = 1(1)J}.

  \deqn{\pi_1 + \pi_2 + \cdots + \pi_J = 1}

  Let us choose a baseline category. WLOG let the Jth category be
  the baseline category.

  We calculate:
  \deqn{\frac{P(y \in j)}{P(y \in J)} = \frac{\pi_j}{\pi_J}, \quad j = 1(1)J-1}

  This is odds of falling in category \eqn{j} when compared with the
  baseline category J.

  The log odds of falling in category \eqn{j} when compared with the
  baseline category J is:
  \deqn{\ln \frac{\pi_j}{\pi_J}}

  which is also known as \strong{baseline category logit}, \eqn{j = 1(1)J-1}.

  Suppose there is a single predictor \eqn{x}, then the baseline category
  logit can be modelled as:
  \deqn{\ln \frac{\pi_j}{\pi_J} = \alpha_j + \beta_j x, \quad j = 1(1)J-1}

  This model is known as the \strong{Baseline Category Logit Model}.

  Number of parameters: \eqn{2(J-1)}.
  Number of equations: \eqn{(J-1)}.

  \strong{Example (3 categories, baseline = category 3):}

  Given model:
  \deqn{\ln \frac{\pi_j}{\pi_3} = \alpha_j + \beta_j x, \quad j = 1, 2}

  \deqn{\Rightarrow \ln \frac{\pi_1}{\pi_3} = \alpha_1 + \beta_1 x}
  \deqn{\Rightarrow \ln \frac{\pi_2}{\pi_3} = \alpha_2 + \beta_2 x}

  Log odds of falling in category 1 when compared with category 2:
  \deqn{\ln \frac{\pi_1}{\pi_2} = \ln \frac{\pi_1}{\pi_3} - \ln \frac{\pi_2}{\pi_3}}
}

\section{Alligator Food Choice Problem (Multicategory Example)}{

  Suppose primary food type for alligators are fish, invertibrate and
  others. Let x denote the length of the alligators.

  \strong{Output Table:}
  \tabular{lllll}{
    \strong{Parameters} \tab \strong{Choice} \tab \strong{Est} \tab \strong{SE} \tab \strong{p-value} \cr
    Intercept \tab F \tab 1.6177  \tab 1.307 \tab 0.215 \cr
    lambda    \tab I \tab 5.6874  \tab 1.793 \tab 0.501 \cr
    length    \tab F \tab -0.1181 \tab 0.517 \tab 0.831 \cr
    length    \tab I \tab -2.46   \tab 0.819 \tab 0.006 \cr
  }

  \strong{Odds Ratio Estimate:}
  \tabular{llll}{
    \strong{Effect} \tab \strong{Choice} \tab \strong{Est} \tab \strong{95\% CI} \cr
    length \tab F \tab 0.892 \tab 0.325 -- 2.468 \cr
    length \tab I \tab 0.085 \tab 0.015 -- 0.494 \cr
  }

  \strong{Q1: Fitted Baseline Category Logistic Model}

  Baseline category is others. Let \eqn{\pi_1} denote probability that a
  randomly selected alligator prefers fish. \eqn{\pi_2} is the probability
  that a randomly selected alligator prefers invertebrates.

  \strong{Fitted model:}
  \deqn{1.\quad \ln\left(\frac{\hat{\pi}_1}{\hat{\pi}_3}\right) = 1.6177 - 0.1181\, x}
  \deqn{2.\quad \ln\left(\frac{\hat{\pi}_2}{\hat{\pi}_3}\right) = 5.6874 - 2.46\, x}

  \strong{Q2:} For a fixed length of alligator, find the estimated odds of
  preferring fish over invertebrates.

  \deqn{\ln\left(\frac{\hat{\pi}_1}{\hat{\pi}_2}\right) = \ln\left(\frac{\hat{\pi}_1}{\hat{\pi}_3}\right)
        - \ln\left(\frac{\hat{\pi}_2}{\hat{\pi}_3}\right) = -4.0697 + 2.3499\, x}

  \deqn{\Rightarrow \frac{\hat{\pi}_1}{\hat{\pi}_2} = e^{-4.069 + 2.35x}}

  \strong{Q3: Test at 5\% level whether length of alligators significantly affects food choice.}

  Tests:
  \enumerate{
    \item \eqn{H_0: \beta_1 = 0} against \eqn{H_1: \beta_1 \neq 0}
    \item \eqn{H_{02}: \beta_2 = 0} against \eqn{H_{12}: \beta_2 \neq 0}
    \item \eqn{H_{03}: \beta_1 - \beta_2 = 0} against \eqn{H_{013}: \beta_1 - \beta_2 \neq 0}
  }

  \enumerate{
    \item t-ratio = \eqn{\frac{\hat{\beta}_1}{se(\hat{\beta}_1)}}; p-val = 0.831 => Accept H0.
          There is no significant impact of length of alligators on choosing
          food type as fish over others.

    \item p-val = 0.006; Reject H02. \eqn{t = \frac{\hat{\beta}_2}{se(\hat{\beta}_2)}}.
          There is a significant impact of length of alligators on choosing
          food type as invertebrates over others.

    \item For one unit increment in length, the log odds of preferring
          invertebrates over others decreases by 2.46 units.

    \item \eqn{t = \frac{\hat{\beta}_1 - \hat{\beta}_2}{se(\hat{\beta}_1 - \hat{\beta}_2)}
                = \frac{\hat{\beta}_1 - \hat{\beta}_2}{\sqrt{V(\hat{\beta}_1) + V(\hat{\beta}_2)
                  - 2\,\text{cov}(\hat{\beta}_1, \hat{\beta}_2)}}}
          (use if provided)
  }

  \strong{Odds ratio:}
  \deqn{\frac{P(y \in 1|x+1)}{P(y \in J|x+1)} = O_1}
  \deqn{\frac{P(y \in j|x)}{P(y \in J|x)} = O_2}

  \deqn{OR = \frac{O_1}{O_2}}

  \deqn{\ln\left(\frac{O_1}{O_2}\right) = \hat{\beta}_j \Rightarrow \frac{O_1}{O_2} = e^{\hat{\beta}_j}}

  The estimate of odds of preferring fish over others is \eqn{e^{\hat{\beta}_1}}
  and estimate of odds of preferring invertebrate over others is \eqn{e^{\hat{\beta}_2}}.

  Here, \eqn{e^{\hat{\beta}_1} = 0.896}, \eqn{e^{\hat{\beta}_2} = 0.085}.

  \strong{Q: Find 100(1-alpha)\% CI for beta_1 and beta_2.}

  For \eqn{\beta_1}:
  \deqn{CI_1 = \left[\hat{\beta}_1 - 1.96\,se(\hat{\beta}_1),\quad \hat{\beta}_1 + 1.96\,se(\hat{\beta}_1)\right]}

  For \eqn{\beta_2}:
  \deqn{CI_2 = \left[\hat{\beta}_2 - 1.96\,se(\hat{\beta}_2),\quad \hat{\beta}_2 + 1.96\,se(\hat{\beta}_2)\right]}

  Correspondingly, Table 2 has CI for \eqn{e^{\hat{\beta}_1}} and \eqn{e^{\hat{\beta}_2}}.
}

\section{EXAM SOLUTIONS - Part 1: 2025 Question Paper}{

  \subsection{Q1. Logistic Regression Interpretation}{

    For a STEM graduate (STEM = 1), the log odds of being Male is:
    \deqn{\text{Log Odds(Male)} = 0.7 - 0.28(1) = 0.42}

    The odds of being Male: \eqn{e^{0.42} \approx 1.5219}.

    The probability of being Male:
    \deqn{P(\text{Male}|\text{STEM}=1) = \frac{1.5219}{1 + 1.5219} \approx 0.6035 \; (60.35\%)}

    Consequently:
    \deqn{P(\text{Female}|\text{STEM}=1) = 1 - 0.6035 = 0.3965 \; (39.65\%)}

    \strong{Conclusion:} The equation yields approximately 39.65\% females.
    While relatively close to 42\%, it is strictly mathematically
    \strong{inconsistent} with exactly 42\%. If it were exactly 42\% females
    (58\% males), the log odds would be \eqn{\ln(0.58/0.42) \approx 0.322},
    not 0.42.
  }

  \subsection{Q2. KNN Regression}{

    Test point \eqn{X_0 = (0,0,0)}. Euclidean distances from \eqn{X_0}:

    \tabular{lll}{
      \strong{Obs} \tab \strong{Distance} \tab \strong{Y} \cr
      1 \tab \eqn{\sqrt{9} = 3}           \tab 10 \cr
      2 \tab \eqn{\sqrt{4} = 2}           \tab 12 \cr
      3 \tab \eqn{\sqrt{10} \approx 3.16} \tab 9  \cr
      4 \tab \eqn{\sqrt{5} \approx 2.23}  \tab 16 \cr
      5 \tab \eqn{\sqrt{2} \approx 1.41}  \tab 11 \cr
      6 \tab \eqn{\sqrt{3} \approx 1.73}  \tab 7  \cr
    }

    For \eqn{K=3}, the 3 nearest neighbours are Obs 5 (\eqn{Y=11}),
    Obs 6 (\eqn{Y=7}), Obs 2 (\eqn{Y=12}).

    \deqn{\hat{Y} = \frac{11 + 7 + 12}{3} = 10}
  }

  \subsection{Q3. LASSO Problem Setup and Bias-Variance Tradeoff}{

    \strong{LASSO Optimization Problem:}
    \deqn{\min_{\beta} \left\{ \sum_{i=1}^n \left( y_i - \beta_0
          - \sum_{j=1}^p \beta_j x_{ij} \right)^2
          + \lambda \sum_{j=1}^p |\beta_j| \right\}}

    \strong{Graph Explanation (X-axis: flexibility; Y-axis: error):}
    \itemize{
      \item \strong{Squared Bias:} Starts low at \eqn{\lambda=0} (OLS) and
            increases monotonically as \eqn{\lambda} increases (model becomes
            less flexible).
      \item \strong{Variance:} Starts high at OLS and decreases monotonically
            as \eqn{\lambda} increases (simpler models less sensitive to
            training data).
      \item \strong{Test MSE:} U-shaped curve = Irreducible Error + Bias\eqn{^2}
            + Variance. Drops initially, hits a minimum (optimal \eqn{\lambda}),
            then rises as bias dominates.
    }
  }

  \subsection{Q4. Precision-Recall Trade-off}{

    \deqn{\text{Precision} = \frac{TP}{TP + FP}, \quad
          \text{Recall (Sensitivity)} = \frac{TP}{TP + FN}}

    \strong{Trade-off:} Raising the classification threshold predicts
    "Positive" less often, decreasing FP (increasing Precision) but
    increasing FN (decreasing Recall). Lowering the threshold catches
    more actual positives (higher Recall) but introduces more false alarms
    (lower Precision). Both cannot be simultaneously optimised.
  }

  \subsection{Q5. Forward Stepwise Selection on Boston Data}{

    Forward selection starts with a null model. In each step it adds the
    single variable that best improves the model (lowest RSS), keeping all
    previously selected variables. Metrics such as adjusted \eqn{R^2},
    \eqn{C_p}, or BIC are used to pick the final model.

    \strong{R Code:}
    \preformatted{
library(MASS); library(leaps)
data("Boston")
fit_fwd <- regsubsets(crim ~ dis + rad + black + lstat,
                      data = Boston, nvmax = 4, method = "forward")
fwd_summary <- summary(fit_fwd)
fwd_summary$which
opt_bic <- which.min(fwd_summary$bic)
cat("Optimal number of variables (BIC):", opt_bic, "\n")
coef(fit_fwd, opt_bic)
    }
  }

  \subsection{Q6. Ridge Regression}{

    \strong{(a) Optimization Problem:}
    \deqn{\min_{\beta} \left\{ \sum_{i=1}^n \left( y_i - \beta_0
          - \sum_{j=1}^p \beta_j x_{ij} \right)^2
          + \lambda \sum_{j=1}^p \beta_j^2 \right\}}

    When \eqn{\lambda = 0} we get OLS (high variance, low bias if \eqn{p}
    is large). As \eqn{\lambda \to \infty}, coefficients shrink toward 0
    (low variance, high bias). The optimal \eqn{\lambda} balances this
    trade-off to minimise test MSE.

    \strong{(b) Cross-Validation Procedure:}
    \enumerate{
      \item Define a grid of \eqn{\lambda} values.
      \item Split training data randomly into \eqn{K} equal folds (e.g. \eqn{K=10}).
      \item For each fold \eqn{k}: hold it out as validation, fit Ridge on
            remaining \eqn{K-1} folds for all \eqn{\lambda}s, compute MSE on
            held-out fold.
      \item Average the \eqn{K} validation MSEs for each \eqn{\lambda} to
            get \eqn{CV(\lambda)}.
      \item Select the \eqn{\lambda} minimising \eqn{CV(\lambda)}. Fit the
            final model on the full training set using this \eqn{\lambda}.
    }
  }

  \subsection{Q7. Likelihood and Score Equation for Binary Predictor}{

    \strong{Model:} \eqn{P(y=1|x) = \frac{\exp(\beta x)}{1+\exp(\beta x)} = p_i}

    \strong{Likelihood Function:}
    \deqn{L(\beta) = \prod_{i=1}^n p_i^{y_i}(1-p_i)^{1-y_i}
          = \prod_{i=1}^n \left(\frac{e^{\beta x_i}}{1+e^{\beta x_i}}\right)^{y_i}
            \left(\frac{1}{1+e^{\beta x_i}}\right)^{1-y_i}}

    \strong{Log-Likelihood:}
    \deqn{l(\beta) = \sum_{i=1}^n \left[ y_i \beta x_i - \ln(1+e^{\beta x_i}) \right]}

    \strong{Score Equation:}
    \deqn{U(\beta) = \frac{\partial l(\beta)}{\partial \beta}
          = \sum_{i=1}^n x_i(y_i - p_i) = 0}

    \strong{Standard Error:}
    \deqn{I(\beta) = -\frac{\partial^2 l}{\partial \beta^2}
          = \sum_{i=1}^n x_i^2 p_i(1-p_i)}
    \deqn{SE(\hat{\beta}) = \frac{1}{\sqrt{I(\hat{\beta})}}
          = \frac{1}{\sqrt{\sum_{i=1}^n x_i^2 \hat{p}_i(1-\hat{p}_i)}}}

    If \eqn{x \in \{0,1\}}, with \eqn{n_1} observations at \eqn{x=1}:
    \deqn{SE(\hat{\beta}) = \frac{1}{\sqrt{n_1 \hat{p}_1(1-\hat{p}_1)}}}

    \strong{Odds Ratio:} For \eqn{x=1} vs \eqn{x=0}, OR = \eqn{e^{\beta}}.
    If \eqn{\hat{\beta} = 2}, estimated OR = \eqn{e^2 \approx 7.389}.

    95\% CI for OR:
    \deqn{\left[\exp(2 - 1.96 \cdot SE(\hat{\beta})),\;
                \exp(2 + 1.96 \cdot SE(\hat{\beta}))\right]}
  }

  \subsection{Q8. Multinomial Logit - Food Preferences}{

    Baseline category: Fried foods. Model:
    \deqn{\ln(P(\text{Choice})/P(\text{Fried})) = \beta_0 + \beta_1 \cdot \text{Female}}

    \strong{(i) Odds of preferring Pizza over Fried:}
    \itemize{
      \item Males (F=0): \eqn{\exp(5.69) \approx 295.89}
      \item Females (F=1): \eqn{\exp(5.69 + 1.56) = \exp(7.25) \approx 1408.10}
      \item Odds Ratio (Female vs Male): \eqn{\exp(1.56) \approx 4.76}
    }

    \strong{(ii) Log-odds of Pizza over Pasta:}
    \deqn{\ln\left(\frac{P(\text{Pizza})}{P(\text{Pasta})}\right)
          = \ln\left(\frac{P(\text{Pizza})}{P(\text{Fried})}\right)
          - \ln\left(\frac{P(\text{Pasta})}{P(\text{Fried})}\right)}

    \itemize{
      \item Females (F=1): \eqn{(5.69+1.56) - (2.33+1.33) = 7.25 - 3.66 = 3.59}
      \item Males (F=0): \eqn{5.69 - 2.33 = 3.36}
    }

    \strong{(iii) Probabilities:}
    \deqn{D = 1 + e^{\text{eq(Sandwich)}} + e^{\text{eq(Pizza)}} + e^{\text{eq(Pasta)}}}
    \deqn{P(\text{Choice}) = \frac{e^{\text{eq(Choice)}}}{D}, \quad
          P(\text{Fried}) = \frac{1}{D}}
  }

  \subsection{Q9. Logistic Regression on Default Data}{

    \strong{R Code:}
    \preformatted{
library(ISLR)
data("Default")
logit_fit <- glm(default ~ balance + student + income,
                 data = Default, family = "binomial")
summary(logit_fit)
pred_probs   <- predict(logit_fit, type = "response")
pred_classes <- ifelse(pred_probs > 0.5, "Yes", "No")
conf_matrix  <- table(Predicted = pred_classes, Actual = Default$default)
print(conf_matrix)
TP  <- conf_matrix["Yes", "Yes"]
FN  <- conf_matrix["No",  "Yes"]
FP  <- conf_matrix["Yes", "No"]
TN  <- conf_matrix["No",  "No"]
TPR <- TP / (TP + FN)
FPR <- FP / (FP + TN)
cat("TPR (Sensitivity):", round(TPR, 4), "\n")
cat("FPR:", round(FPR, 4), "\n")
    }
  }

  \subsection{Q10. Test MSE Decomposition and Ridge vs OLS}{

    \strong{(a) Test MSE Decomposition:}
    \deqn{E[(y_0 - \hat{f}(x_0))^2]
          = Var(\hat{f}(x_0)) + [Bias(\hat{f}(x_0))]^2 + Var(\varepsilon)}

    Irreducible error = \eqn{Var(\varepsilon)}.
    Reducible error = \eqn{Var(\hat{f}) + Bias^2}.

    \strong{(b) Ridge vs OLS (simple regression \eqn{y_i = \beta x_i + \varepsilon_i}):}
    \deqn{\hat{\beta}_{LS} = \frac{\sum x_i y_i}{\sum x_i^2}}
    \deqn{\hat{\beta}_R(\lambda) = \frac{\sum x_i y_i}{\sum x_i^2 + \lambda}}

    Since \eqn{\sum x_i^2 + \lambda \geq \sum x_i^2} for \eqn{\lambda \geq 0}:
    \deqn{\hat{\beta}_R(\lambda) \leq \hat{\beta}_{LS}}

    \strong{Equality case:} When \eqn{\lambda = 0}, Ridge reduces exactly to
    OLS. Ridge intentionally biases coefficients toward zero to reduce
    variance, particularly useful under multicollinearity.
  }
}

\section{EXAM SOLUTIONS - Part 2: 2024 Question Paper}{

  \subsection{Q1. Product Success Analysis}{

    \strong{(i) Classification or Regression?}
    It is a \strong{Classification} problem because the response variable
    (success or failure) is categorical (binary), not a continuous value.

    \strong{(ii) Inference or Prediction?}
    The primary objective is \strong{Prediction} because the management
    wishes to know whether the new product will be a success or failure,
    rather than understanding the relationships between predictors and outcome.

    \itemize{
      \item \eqn{n = 20} (number of observations / similar products)
      \item \eqn{p = 13} (price, marketing budget, competition price + 10
            other variables)
    }
  }

  \subsection{Q2. Simple Linear Regression Simulation}{

    \strong{R Code:}
    \preformatted{
set.seed(123)
x <- rnorm(100)
y <- 2 * x + rnorm(100)
fit_sim     <- lm(y ~ x - 1)
summary_sim <- summary(fit_sim)
summary_sim
cat("Estimate:", coef(summary_sim)["x","Estimate"], "\n")
cat("SE:",       coef(summary_sim)["x","Std. Error"], "\n")
cat("t-stat:",   coef(summary_sim)["x","t value"], "\n")
cat("p-value:",  coef(summary_sim)["x","Pr(>|t|)"], "\n")
    }

    \strong{Comment:} The estimated coefficient is very close to the true
    value 2.0. The p-value is practically 0 (far less than 0.05), so we
    strongly reject \eqn{H_0: \beta = 0}. The small standard error indicates
    high precision.
  }

  \subsection{Q3. KNN Classification}{

    Test point \eqn{X_0 = (0,0,0)}. Distances and classes:

    \tabular{lll}{
      \strong{Obs} \tab \strong{Distance} \tab \strong{Class} \cr
      1 \tab \eqn{3}           \tab Red   \cr
      2 \tab \eqn{2}           \tab Red   \cr
      3 \tab \eqn{\sqrt{10}}   \tab Red   \cr
      4 \tab \eqn{\sqrt{5}}    \tab Green \cr
      5 \tab \eqn{\sqrt{2}}    \tab Green \cr
      6 \tab \eqn{\sqrt{3}}    \tab Red   \cr
    }

    \strong{K=1:} Closest is Obs 5. Prediction: \strong{Green}.

    \strong{K=3:} Obs 5 (Green), Obs 6 (Red), Obs 2 (Red).
    Majority vote: \strong{Red}.

    \strong{Comment:} Prediction changes with \eqn{K}. Small \eqn{K}
    captures local noise (high variance); larger \eqn{K} smooths the
    decision boundary.
  }

  \subsection{Q4. Credit Card Data Interpretation}{

    \itemize{
      \item \strong{Intercept (531.00):} Estimated average balance for the
            baseline category (Americans). Americans have an estimated average
            balance of \$531.00.
      \item \strong{Asian (-18.69):} Asians carry an estimated \$18.69 less
            in balance than Americans.
      \item \strong{Caucasian (-12.50):} Caucasians carry an estimated \$12.50
            less in balance than Americans.
    }

    \strong{Null Hypotheses tested by p-values:}
    \itemize{
      \item For Asian: \eqn{H_0: \beta_{\text{Asian}} = 0} (no difference
            from Americans). p-value 0.7740 => fail to reject.
      \item For Caucasian: \eqn{H_0: \beta_{\text{Caucasian}} = 0} (no
            difference from Americans). p-value 0.8260 => fail to reject.
    }

    Ethnicity does not significantly affect balance.
  }

  \subsection{Q5. Regularization Methods}{

    \strong{(a) Minimized quantity:}
    \enumerate{
      \item \strong{Ridge:} \eqn{RSS + \lambda \sum_{j=1}^p \beta_j^2} (L2 norm)
      \item \strong{LASSO:} \eqn{RSS + \lambda \sum_{j=1}^p |\beta_j|} (L1 norm)
      \item \strong{Elastic Net:} \eqn{RSS + \lambda_1 \sum |\beta_j| + \lambda_2 \sum \beta_j^2}
            (Mix of L1 and L2)
    }

    \strong{(b) Ridge vs Least Squares:}
    Ridge trades a small amount of bias for a significant reduction in
    variance, especially when predictors are highly correlated. This often
    results in a lower Test MSE than OLS.

    \strong{(c) LASSO as improvement over Ridge:}
    LASSO can force some coefficient estimates to be exactly zero, performing
    \emph{variable selection} and making models easier to interpret than
    Ridge (which keeps all variables).

    \strong{(d) Graph:}
    X-axis: \eqn{\|\hat{\beta}_\lambda\|_2 / \|\hat{\beta}_{OLS}\|_2}
    (ranging 0 to 1). As ratio moves from 1 (OLS) to 0 (heavy penalty),
    individual predictor curves shrink towards zero. Bias increases,
    Variance decreases, Test MSE forms a U-shape with minimum at the
    optimal ratio.
  }

  \subsection{Q6. Auto Dataset Linear Regression}{

    \strong{R Code:}
    \preformatted{
library(ISLR)
data("Auto")
plot(Auto$horsepower, Auto$mpg,
     main="MPG vs Horsepower", xlab="Horsepower", ylab="MPG")
fit_auto <- lm(mpg ~ horsepower, data=Auto)
abline(fit_auto, col="red", lwd=2)
summary(fit_auto)
new_data <- data.frame(horsepower = 98)
predict(fit_auto, new_data)
predict(fit_auto, new_data, interval="confidence")
predict(fit_auto, new_data, interval="prediction")
    }

    \strong{(ii) Comment:} The p-value for horsepower is virtually 0,
    indicating a strong statistically significant \strong{negative}
    relationship (as horsepower increases, mpg decreases). The relationship
    is strong, though visually non-linear.
  }

  \subsection{Q7. Bias-Variance and MSE}{

    \strong{(a) Sketch:} X-axis = Flexibility. Y-axis = Error.
    Training error decreases monotonically. Test error forms a U-shape.
    Bias decreases monotonically. Variance increases monotonically.

    \strong{(b) Decomposition:}
    \deqn{E[(y_0 - \hat{f}(x_0))^2]
          = Var(\hat{f}(x_0)) + [Bias(\hat{f}(x_0))]^2 + Var(\varepsilon)}

    Minimum possible value of Test MSE is \eqn{Var(\varepsilon)},
    the variance of the irreducible error.
  }

  \subsection{Q8. Backward Stepwise Selection on Boston Data}{

    Backward selection starts with the full model. At each step it drops
    the variable least useful (largest p-value / least impact on RSS).
    Continues until a 1-variable model. BIC or adjusted \eqn{R^2} selects
    the optimal model across steps.

    \strong{R Code:}
    \preformatted{
library(MASS); library(leaps)
data("Boston")
fit_bwd <- regsubsets(crim ~ dis + rad + black + lstat,
                      data = Boston, nvmax = 4, method = "backward")
bwd_summary <- summary(fit_bwd)
bwd_summary$which
opt_bic_bwd <- which.min(bwd_summary$bic)
cat("Optimal variables (Backward, BIC):", opt_bic_bwd, "\n")
coef(fit_bwd, opt_bic_bwd)
    }
  }

  \subsection{Q9. Bayes Classifier and Probability}{

    \strong{(a) Bayes classifier is quadratic:}
    If \eqn{X|Y=k \sim N(\mu_k, \sigma_k^2)} and variances \eqn{\sigma_k^2}
    differ across classes, the log-posterior
    \eqn{\ln P(Y=k|X=x)} contains the term
    \eqn{-\frac{(x-\mu_k)^2}{2\sigma_k^2}}. Because \eqn{\sigma_k^2}
    depends on \eqn{k}, the \eqn{x^2} term does not cancel when comparing
    classes. Hence the decision boundary is a quadratic function of \eqn{x}
    (Quadratic Discriminant Analysis - QDA).

    \strong{(b) Bayes Theorem Calculation:}
    \itemize{
      \item \eqn{P(Yes) = 0.8}, \eqn{P(No) = 0.2}
      \item For "Yes": \eqn{\mu_1 = 10}, \eqn{\sigma^2 = 36}
      \item For "No": \eqn{\mu_2 = 0}, \eqn{\sigma^2 = 36}
    }

    \deqn{f_{Yes}(4) = c \cdot \exp\!\left(-\frac{(4-10)^2}{72}\right)
          = c \cdot e^{-0.5} \approx c \cdot 0.6065}
    \deqn{f_{No}(4) = c \cdot \exp\!\left(-\frac{(4-0)^2}{72}\right)
          = c \cdot e^{-0.2222} \approx c \cdot 0.8007}

    \deqn{P(Yes|X=4) = \frac{0.6065 \times 0.8}{(0.6065 \times 0.8)
          + (0.8007 \times 0.2)}
          = \frac{0.4852}{0.64534} \approx 0.7518}

    There is roughly a 75.2\% probability the company will issue a dividend.
  }

  \subsection{Q10. LASSO CV and Multinomial Logit}{

    \strong{(a) k-fold CV for LASSO:}
    \enumerate{
      \item Choose a grid of \eqn{\lambda} values.
      \item Divide data into \eqn{k} roughly equal folds.
      \item For \eqn{i=1} to \eqn{k}: hold out fold \eqn{i}, train LASSO
            on remaining \eqn{k-1} folds for all \eqn{\lambda}s, compute
            test MSE on fold \eqn{i}.
      \item Average test MSEs across all \eqn{k} folds to produce the CV
            error curve.
      \item Choose the \eqn{\lambda} minimising the CV error (or apply the
            1-Standard-Error rule).
    }

    \strong{(b) Alligator Food Choice (baseline: Other):}
    \deqn{\ln(P(F)/P(O)) = 1.6 + 0.11\,x}
    \deqn{\ln(P(I)/P(O)) = 4.0 - 2.1\,x}

    \strong{Does food choice depend on size?}
    \itemize{
      \item For F: \eqn{t = 0.11/0.56 \approx 0.196} (not significant).
      \item For I: \eqn{t = -2.1/0.09 \approx -23.33} (highly significant).
    }
    Yes, primary food choice significantly depends on alligator size
    (at least one length coefficient is highly significant).

    \strong{Response Probabilities:}
    \deqn{P(O) = \frac{1}{1 + e^{1.6+0.11x} + e^{4.0-2.1x}}}
    \deqn{P(F) = \frac{e^{1.6+0.11x}}{1 + e^{1.6+0.11x} + e^{4.0-2.1x}}}
    \deqn{P(I) = \frac{e^{4.0-2.1x}}{1 + e^{1.6+0.11x} + e^{4.0-2.1x}}}
  }
}

\author{Lecture Notes and Exam Solutions - Predictive Analysis, Semester 2}

\keyword{regression}
\keyword{statistical learning}
\keyword{model selection}
\keyword{bias-variance tradeoff}
\keyword{KNN}
\keyword{multiple linear regression}
\keyword{classification}
\keyword{shrinkage}
\keyword{ridge}
\keyword{lasso}
\keyword{logistic}
\keyword{cross-validation}
\keyword{exam solutions}
