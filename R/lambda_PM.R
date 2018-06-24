lambda_PM <- function(a, b, w, la, p){
  func <- function(L) {
    (p*L^-1) + (la*b*L^(-a))-(la*b*p^(w-a+1))*L^(-1*(w+1)) -1
  }
  growth.estimate <-uniroot.all(func, c(0, 8))[2]
  return(list("Lambda:"=growth.estimate))
}
