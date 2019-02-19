tabItem(
  "tweets",
  fluidRow(
    box(
      width = 12,
      DTOutput("tweets_table")
    )
  )
)