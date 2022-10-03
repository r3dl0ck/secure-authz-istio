oc exec pod/customer-5fc9f6d46f-rl8s6 -c istio-proxy -- \
 curl -s  http://127.0.0.1:15000/config_dump   | \
  jq -r .configs[5].dynamic_active_secrets[0].secret  | \
	   jq -r .tls_certificate.certificate_chain.inline_bytes | \
   base64 --decode | \
    openssl x509 -text -noout | \
     grep "X509v3 Subject" -A 1
