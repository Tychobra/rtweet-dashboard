tabItem(
  "dashboard",
  fluidRow(
    column(
      12,
      h1("Dashboard"),
      h3("Frequency of tweets over time"),
      verbatimTextOutput("tweets_raw")
    )
  )
)
