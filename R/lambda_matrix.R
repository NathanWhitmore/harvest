# Quick stage based population projection matrix

lambda_matrix <- function(f, b, stages, S){

    Fec <- b * S
    Fec <- c(rep(0,f-1),Fec[f:length(S)])
    Sur <- diag(S)
    mat <-rbind(Fec,Sur)
    rownames(mat) <- c("Fecundity", rep("Survival", length(S)))
    mat [stages,stages] <- S[stages]
    mat <- mat[-(stages+1),]
    return(list("Transition matrix" =mat,"Lambda:"=lambda(mat)))
}





