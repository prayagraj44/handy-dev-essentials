#oauth

#### Authorization Code Grant

```shell
curl -X GET "https://auth.example.com/oauth2/authorize?client_id=<CLIENT_ID>&redirect_uri=<REDIRECT_URI>&response_type=code&scope=<SCOPES>&code_challenge=<CODE_CHALLENGE>&code_challenge_method=S256&state=<STATE>" -H "accept: application/json"
```
