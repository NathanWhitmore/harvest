# Quick stage based population projection matrix

lambda_matrix <- function(r.stage, b, stages, S, terminal){
  if(missing(terminal)) {terminal=FALSE} else {terminal=terminal}

    Fec <- c(rep(0,r.stage -1),rep(b,stages-(r.stage-1)))
    Fec <- S * Fec
    Sur <- diag(S)
    mat <-rbind(Fec,Sur)
    rownames(mat) <- c("Fecundity", rep("Survival", length(S)))
    if(terminal==FALSE){
       mat [stages,stages] <- S[stages]} else {
         mat [stages,stages] <- 0
       }
    mat <- mat[-(stages+1),]
    return(list("Transition matrix" =mat,"Lambda:"=lambda(mat)))
}



