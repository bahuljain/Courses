#Probability Models
- linear regression using Gaussian
- logistic regression using Bernoulli's Model
- Likelihood in Probability Models
  - Linear Regression: least squares
  - Logistic Regression: logistic loss

##Generative Models
- Can be used to to synthesize or re-generate data similar to training data.
- eg. Gaussian
- Regression models and classification boundaries not generative.

## Properties of PDFs
- Marginalization
- Conditioning
- Bayes Rule: posterior, likelihood, prior, evidence
- Expectation
  - Properties
  - Mean
  - Variance
  - Covariance
  - Conditional Expectation
  - Sample Mean, Var and Cov
- Independence
- Conditional Independence
- IID

##Uses of PDF
- Classification
- Regression
- Anomaly Detection

##Bernoulli Probability Models
- Maximum Likelihood

##Naive Bayes: Text Classification - Email/Spam
- Likelihood
- Maximum Likelihood
- Making Predictions

##Categorical/Multinomial Probability Models
- Representation
- Maximum Likelihood (use lagrange multipliers)

##Multinomial Counts: Text Classification - Email/Spam

##Gaussian Distribution
- Parameters: Mean, Variance

##Multivariate Gaussian Representation
- Parameters: Mean Vector, Covariance Matrix
- Spherical
- Diagonal Covariance
- Max Likelihood Gaussian
- Sampling from Gaussian

##Classification using Gaussians
- Gaussian for classes
- Max Likelihood to obtain parameters
- Prediction: Bayes Optimal Decision (argmax_y)

##Regression using Gaussians
- Max Likelihood given data to obtain parameters.
- Bayes Optimal Decision

##Principal Component Analysis (Compression)
- Dimensionality Reduction
- Reconstruct data as mean and steps along multiple directions
- Directions -> Eigen Vectors of Covariance
- Steps Size -> Eigen Values of Covariance
- Choose top C eigenvalues 
 
##Bayesian Inference
- MLE?
- MAP?

##Mixture Models
- multiple gaussians
- clustering

##K-Means Algorithm

##EM Algorithm
- Expectation Step 
- Maximization Step
- Bound Maximization using Jensen's Inequality

##Probability Graphical Models
- Storage, Inference Efficiency
- Factorization of Joint Probability Distribution
- DAG's or Bayesian Networks
  - 3 Fundamentals cases:
    - Markov Chain
    - 1 cause, 2 effects
    - 2 causes, 1 effect
  - Maximum Likelihood for Graphical Models
  - Testing Conditional Independence using Bayes Ball algorithm
    - 3 base cases
    - leaf nodes

- Undirected Graphs or Markov Models
  - Markov Property
  - Hammersley Clifford Theorem
  - Potential Functions
  - Separation

##Inference from Probability Graph Models
- Marginal Inference: JTA
- MAP: ArgMax JTA

###Junction Tree Algorithm

######Moralization
- connect all parents pairwise 

######Introducing Evidence
- slice tables

######Triangulation
- eliminate cycles over size 3
- eliminate chordless cycles

######Constructing Junction Tree
- Spanning Tree using Kruskal's algorithm (Maximum Cardinality of Separators)
- Running Intersection Property

######Propagating Probabilities
- Purpose
- Cliques to Separator
  - JTA: sum
  - ArgMax JTA: max
- Separator to Cliques
- Collect & Distribute
- Normalization
