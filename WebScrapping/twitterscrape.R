install.packages("RCurl")
install.packages("twitteR")
library(RCurl)
# Set SSL certs globally
options(RCurlOptions = list(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl")))

library(twitteR)
reqURL <- "https://api.twitter.com/oauth/request_token"
accessURL <- "https://api.twitter.com/oauth/access_token"
authURL <- "https://api.twitter.com/oauth/authorize"
apiKey <- "fD0yNoeTcRyan2hF4cbVSgJdW"
apiSecret <- "Gv0HiAwWLo5nuZnC3SwCeWUHY7QH70ALHhhPAp8ILHIzNEx0Oz"

twitCred <- OAuthFactory$new(
  consumerKey = apiKey,
  consumerSecret = apiSecret,
  requestURL = reqURL,
  accessURL = accessURL,
  authURL = authURL
)

# Run this section separately at the terminal, go to website to get pin (different every time)

twitCred$handshake(
  cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl")
)

registerTwitterOAuth(twitCred)

#Searching twitter

FIFA<-searchTwitter("#WorldCup", n=60)