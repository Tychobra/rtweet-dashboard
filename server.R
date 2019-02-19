function(input, output, session) {



  output$tweets_raw <- renderPrint({

    search_tweets(
      input$search_twitter,
      n = 100,
      geocode = lookup_coords("usa"),
      lang = "en",
      include_rts = FALSE
    ) %>%
      glimpse()

  })
}