lambda_PM <- function(A, b, W, La, P){
  func <- function(L) {
    (P*L^-1) + (La*b*L^(-A))-(La*b*P^(W-A+1))*L^(-1*(W+1)) -1
  }
  growth.estimate <-uniroot.all(func, c(0, 8))[2]
  growth.estimate
}
