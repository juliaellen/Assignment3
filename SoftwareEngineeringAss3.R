id = followersDF1$login
UserIds = c(id)
AllUsers = c()
AllUsersDF = data.frame(Username = integer(), Followers = integer(), Following = integer())
AllUsersDF = data.frame(Username = integer(), Followers = integer(), Following = integer(), NumberOfRepositories = integer())
for (i in 1:length(UserIds))
  
followersDF3 = jsonlite::fromJSON(jsonlite::toJSON(content3))
followers = followersDF3$followers
following = followersDF3$following
reposnumber = followersDF3$public_repos
AllUsers[length(AllUsers) +1] = usernames[j]
AllUsersDF[nrow(AllUsersDF)+1,] = c(usernames[j], followers, following)
AllUsersDF[nrow(AllUsersDF)+1,] = c(usernames[j], followers, following, reposnumber)

}
next


