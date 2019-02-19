function(input, output, session) {

  tweets <- eventReactive(input$search_twitter, {
    search_tweets(
      input$search_twitter,
      n = 100,
      geocode = lookup_coords("usa"),
      lang = "en",
      include_rts = FALSE
    )
  })

  tweets_table_prep <- reactive({
    tweets()[, 1:7]
  })

  output$tweets_table <- renderDT({
    datatable(
      tweets_table_prep(),
      rownames = FALSE,
      options = list(
        scrollX = TRUE
      )
    )
  })
}