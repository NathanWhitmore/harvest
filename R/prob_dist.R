# computes an empirical cumulative distribution function
# for either net productivity (default) or gross productivity

prob_dist <- function(x, net){
  if(missing(net)) {net=TRUE} else {net=net}
  ifelse(net==FALSE,ecdf(Monte.Carlo$gross.productivity)(x),
         ecdf(Monte.Carlo$net.productivity)(x))
}
