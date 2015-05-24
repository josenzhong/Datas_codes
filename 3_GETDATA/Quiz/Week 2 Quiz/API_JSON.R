library(httr)
library(httpuv)
library(jsonlite)

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. To make your own application, register at at
#    https://github.com/settings/applications. Use any URL for the homepage URL
#    (http://github.com is fine) and  http://localhost:1410 as the callback url
#
#    Replace your key and secret below.
myapp <- oauth_app("github",
                   key="d8139d232a03e3863b6e",
                   secret = "cbf8491608ec4b965d719de33f537eb70c465116") 


# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp, cache=FALSE)

# 4. Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
content(req)

# OR:
req <- with_config(gtoken, GET("https://api.github.com/users/jtleek/repos"))
stop_for_status(req)
content(req)

# Coverting the JSON Object
json1 = content(req)
json2 = jsonlite::fromJSON(toJSON(json1))
colnames(json2)

temp <- lapply(json2, function(x) {
  x[sapply(x, is.null)] <- NA
  unlist(x)
})

temp$created_at[temp$name == "datasharing"]
