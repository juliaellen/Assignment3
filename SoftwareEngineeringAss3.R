

Github =  oauth_app(appname = "Assignment3",
                   key = "8a67183dbf7c715328dc",
                   secret = "b9519bed5efe29c94ca84ec5ff202eec475e029f")

github_token1 = oauth2.0_token(oauth_endpoints("github"), GithubApp)
myToken = config(token = github_token1)

id2 = data2$login
for (j in 1:length(id2))
{
  UserIds[length(UserIds) +1] = id2[j]
  if(is.element(id2[j], UserIds) == FALSE)
  {
    UserIds[length(UserIds) +1] = id2[j]
  }
}
