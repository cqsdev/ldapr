# Printing method
ldap_print <- function(
  private
){
  cat("<LDAP connection>\n")
  cat(paste0("URI: ", private$uri), "\n")
  cat(paste0("Authenticated: ", private$authenticated), "\n")
  if (private$authenticated) {
    cat(paste0("Authenticated user: ", private$authenticated_user), "\n")
    cat(paste0("Authenticated until: ", private$authenticated_until), "\n")
  }
}
