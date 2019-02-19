library(shiny)
library(shinydashboard)
library(shinyWidgets)
library(config)
library(rtweet)
library(dplyr)
library(DT)



tryCatch({
  twitter_auth_info <- config::get(value = "twitter", file = "conf/config.yml")

  rtweet::create_token(
    app = twitter_auth_info$app_name,
    consumer_key = twitter_auth_info$consumer_key,
    consumer_secret = twitter_auth_info$consumer_secret,
    access_token = twitter_auth_info$access_token,
    access_secret = twitter_auth_info$access_secret
  )

}, error = function(err) {
  warning("Error reading twitter information from the configuration file")
})



get_tweet_html <- function(screen_name, status_id) {
  bq <- httr::GET(glue("https://publish.twitter.com/oembed?url=https://twitter.com/{screen_name}/status/{status_id}?omit_script=true"))
  if (bq$status_code >= 400)
    tags$blockquote("Sorry, unable to retrieve tweet")
  else {
    httr::parsed_content(bq)$html %>% HTML()
  }
}
