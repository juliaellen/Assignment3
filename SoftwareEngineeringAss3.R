id = followersDF1$login
UserIds = c(id)
AllUsers = c()
AllUsersDF = data.frame(Username = integer())
for (i in 1:length(UserIds))
{
  url2 = paste("https://api.github.com/users/", UserIds[i], "/followers", sep = "")

  if(is.element(id2[j], AllUsers) == FALSE)
  {
    AllUsers[length(AllUsers) +1] = id2[j]
    AllUsersDF[nrow(AllUsersDF)+1,] = c(id2[j])
    
  }
  next
}
next



