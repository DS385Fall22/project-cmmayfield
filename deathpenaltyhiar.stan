//
// This Stan program defines a simple model, with a
// vector of values 'y' modeled as normally distributed
// with mean 'mu' and standard deviation 'sigma'.
//
// Learn more about model development with Stan at:
//
//    http://mc-stan.org/users/interfaces/rstan.html
//    https://github.com/stan-dev/rstan/wiki/RStan-Getting-Started
//

// The input data is a vector 'y' of length 'N'.
data {
  int N;
  int Z;
  int S[N];
  real Y[N];
   vector[N] P;
   vector[N] C;
   
}

// The parameters accepted by the model. Our model
// accepts two parameters 'mu' and 'sigma'.
parameters {
  real alpha[Z];
  real alpha_bar;
  real beta[Z];
  real beta_bar;
  real gamma[Z];
  real gamma_bar;
  real <lower=0> sigma_b[Z];
}

// The model to be estimated. We model the output
// 'y' to be normally distributed with mean 'mu'
// and standard deviation 'sigma'.
model {
  for(i in 1:N){
 Y[i] ~ normal(alpha[S[i]] + beta[S[i]]*P[i] + gamma[S[i]]*C[i],sigma_b[S[i]]);
}
 alpha ~ normal(0,1);
 alpha_bar ~ normal(0,1);
  beta ~ normal(0,1);
  beta_bar ~ normal(0,1);
  sigma_b ~ lognormal(1,1);
  gamma ~ normal(0,1);
  gamma_bar ~ normal(0,1);
}
