#install.packages("jsonlite")
library(jsonlite)
#install.packages("httpuv")
library(httpuv)
#install.packages("httr")
library(httr)

oauth_endpoints("github")


myapp <- oauth_app(appname = "Assignment3",
                   key = "8a67183dbf7c715328dc",
                   secret = "b9519bed5efe29c94ca84ec5ff202eec475e029f")

github_token1 <- oauth2.0_token(oauth_endpoints("github"), GithubApp)
myToken <- config(token = github_token1)

data1 <- fromJSON("https://api.github.com/users/juliaellen/followers")
id = data1$login
UserIds = c(id) 

AllUsers = c()
for (i in 1:length(UserIds))
{
  data2 = fromJSON(paste0("https://api.github.com/users/", UserIds[i], "/followers"))
  id2 = data2$login
  for (j in 1:length(id2))
  {
    UserIds[length(UserIds) +1] = id2[j]
  }
}
