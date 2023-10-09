# Initialize the LDAP object
ldap_init <- function(
  self, 
  private,
  host, 
  base_dn,
  port = 389
){
  assert_character(host)
  assert_character(base_dn)
  assert_numeric_scalar(port)

  proto <- if (port == 636) 'ldaps' else 'ldap'

  ldap_uri <- ldap_string(proto, host, port)
  uri_check <- ldapr_url_parse(ldap_uri)

  private$base_dn <- base_dn
  private$uri <- ldap_uri
  private$handle <- ldapr_init(ldap_uri)
  self
}