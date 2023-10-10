# Reset LDAP authentication
ldap_reset <- function(
  private
){
  private$authenticated <- FALSE
  private$authenticated_user <- NULL
  private$authenticated_until <- NULL
}

# Perform a simple LDAP bind operation
ldap_bind <- function(
  private,
  user,
  pw,
  type = c("cn", "uid"),
  timeout
){
  # reset the authentication
  ldap_reset(private)
  type <- match.arg(type)

  # build the DN for binding
  bind_dn <- ldap_bind_dn(user, private$base_dn, type)

  # perform the bind
  r <- ldapr_bind_s(
    private$handle,
    bind_dn,
    pw
  )

  # update
  private$authenticated <- TRUE
  private$authenticated_user <- user
  private$authenticated_until <- get_timeout(timeout)
}

# unbind
ldap_unbind <- function(
    private
){
  ldapr_unbind(private$handle)
  ldap_reset(private)
}
