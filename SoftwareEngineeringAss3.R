id = followersDF1$login
UserIds = c(id)
AllUsers = c()
AllUsersDF = data.frame(Username = integer(), Following = integer(), Followers = integer())
AllUsersDF = data.frame(Username = integer(), Followers = integer(), Following = integer())
for (i in 1:length(UserIds))
content2 = content(data2)
followersDF2 = jsonlite::fromJSON(jsonlite::toJSON(content2))
usernames = followersDF2$login

followers = followersDF2$followers
following = followersDF2$following
for (j in 1:length(usernames))
{
  if(is.element(usernames[j], AllUsers) == FALSE)
  {
    url3 = paste("https://api.github.com/users/", usernames[j], sep = "")
    data3 = GET(url3, myToken)
    content3 = content(data3)
    followersDF3 = jsonlite::fromJSON(jsonlite::toJSON(content3))
    followers = followersDF3$followers
    following = followersDF3$following
    AllUsers[length(AllUsers) +1] = usernames[j]
    AllUsersDF[nrow(AllUsersDF)+1,] = c(usernames[j], followers, following)


