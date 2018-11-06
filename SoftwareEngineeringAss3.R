#Install Packages
library(jsonlite)
library(httpuv)
library(httr)
#Interrogate Github
oauth_endpoints("github")
#Access Github App
GithubApp = oauth_app(appname = "Assignment3",
                      key = "8a67183dbf7c715328dc",
                      secret = "b9519bed5efe29c94ca84ec5ff202eec475e029f")
# Get OAuth credentials
github_token1 = oauth2.0_token(oauth_endpoints("github"), GithubApp)
# Use API
myToken = config(token = github_token1)
data1 = GET("https://api.github.com/users/juliaellen/followers", myToken)
content1 = content(data1)
followersDF1 = jsonlite::fromJSON(jsonlite::toJSON(content1))
id = followersDF1$login
UserIds = c(id)
#Access User 'Defunkt' Following to get list of users
DefunktFollowingData <-
  GET("https://api.github.com/users/defunkt/following", myToken)
DefunktFollowingDataContent = content(DefunktFollowingData)
#Save users' data in a dataframe
DefunktFollowingDataFrame = jsonlite::fromJSON(jsonlite::toJSON(DefunktFollowingDataContent))
#Retrieve usernames and save in a vector
Id = DefunktFollowingDataFrame$login
UserIds = c(Id)
#Create empty vectors and data frame
AllUsers = c()
AllUsersDF = data.frame(Username = integer(), Followers = integer(), Following = integer(), NumberOfRepositories = integer())
AllUsersDF = data.frame(
  Username = integer(),
  Following = integer(),
  Followers = integer(),
  Repositories = integer()
)
#Loop through list of usernames to find users to add to the list
for (i in 1:length(UserIds))
{
  url2 = paste("https://api.github.com/users/", UserIds[i], "/followers", sep = "")
  data2 = GET(url2, myToken)
  content2 = content(data2)
  followersDF2 = jsonlite::fromJSON(jsonlite::toJSON(content2))
  usernames = followersDF2$login
  #Retrieve an individual users following list
  followingurl = paste("https://api.github.com/users/",
                       UserIds[i],
                       "/following",
                       sep = "")
  following = GET(followingurl, myToken)
  followingcontent = content(following)
  
  #Add followings to a dataframe and retrieve usernames
  followingDF = jsonlite::fromJSON(jsonlite::toJSON(followingcontent))
  followinglogin = followingDF$login
  
  followers = followersDF2$followers
  following = followersDF2$following
  for (j in 1:length(usernames))
    #Loop through 'following' users
    for (j in 1:length(followinglogin))
    {
      if(is.element(usernames[j], AllUsers) == FALSE)
        #Check that the user is not already in the list of users
        if (is.element(followinglogin[j], totalusers) == FALSE)
        {
          url3 = paste("https://api.github.com/users/", usernames[j], sep = "")
          data3 = GET(url3, myToken)
          content3 = content(data3)
          followersDF3 = jsonlite::fromJSON(jsonlite::toJSON(content3))
          followers = followersDF3$followers
          following = followersDF3$following
          reposnumber = followersDF3$public_repos
          AllUsers[length(AllUsers) +1] = usernames[j]
          AllUsersDF[nrow(AllUsersDF)+1,] = c(usernames[j], followers, following, reposnumber)
          #Add user to list of users
          totalusers[length(totalusers) + 1] = followinglogin[j]
          
          #Retrieve data on each user
          followingurl2 = paste("https://api.github.com/users/", followinglogin[j], sep = "")
          following2 = GET(followersurl, myToken)
          followerscontent2 = content(followers)
          followingDF2 = jsonlite::fromJSON(jsonlite::toJSON(followerscontent))
          
          #Retrieve each users following
          followingnumber = followingDF2$following
          
          #Retrieve each users followers
          followersnumber = followingDF2$followers
          
          #Retrieve each users number of repositories
          reposnumber = followingDF2$public_repos
          
          #Add users data to a new row in dataframe
          totalusersDF[nrow(totalusersDF) + 1, ] = c(followinglogin[j],
                                                     followingnumber,
                                                     followersnumber,
                                                     reposnumber)
          
        }
      next

