

Github =  oauth_app(appname = "Assignment3",
                   key = "8a67183dbf7c715328dc",
                   secret = "b9519bed5efe29c94ca84ec5ff202eec475e029f")


myToken = config(token = github_token1)
data1 = fromJSON("https://api.github.com/users/juliaellen/followers")
id = data1$login
data1 = GET("https://api.github.com/users/juliaellen/followers", myToken)
content1 = content(data1)
followersDF1 = jsonlite::fromJSON(jsonlite::toJSON(content1))
id = followersDF1$login
UserIds = c(id)
AllUsers = c()
for (i in 1:length(UserIds))
{
  data2 = fromJSON(paste0("https://api.github.com/users/", UserIds[i], "/followers"))
  id2 = data2$login
  url2 = paste("https://api.github.com/users/", UserIds[i], "/followers", sep = "")
  data2 = GET(url, myToken)
  content2 = content(data2)
  followersDF2 = jsonlite::fromJSON(jsonlite::toJSON(content2))
  id2 = followersDF2$login
  for (j in 1:length(id2))
  {
    if(is.element(id2[j], UserIds) == FALSE)
    {
      UserIds[length(UserIds) +1] = id2[j]
    }
    next
  }
  next
}

