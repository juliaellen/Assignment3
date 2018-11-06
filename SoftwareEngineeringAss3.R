id = followersDF1$login
UserIds = c(id)
AllUsers = c()
AllUsersDF = data.frame(Username = integer())
AllUsersDF = data.frame(Username = integer(), Following = integer(), Followers = integer())
for (i in 1:length(UserIds))
  
data2 = GET(url2, myToken)
content2 = content(data2)
followersDF2 = jsonlite::fromJSON(jsonlite::toJSON(content2))
id2 = followersDF2$login
for (j in 1:length(id2))
  usernames = followersDF2$login
followers = followersDF2$followers
following = followersDF2$following
for (j in 1:length(usernames))
{
  if(is.element(id2[j], AllUsers) == FALSE)
    if(is.element(usernames[j], AllUsers) == FALSE)
    {
      AllUsers[length(AllUsers) +1] = id2[j]
      AllUsersDF[nrow(AllUsersDF)+1,] = c(id2[j])
      AllUsers[length(AllUsers) +1] = usernames[j]
      AllUsersDF[nrow(AllUsersDF)+1,] = c(usernames[j], followers, following)
      
    }
  next


