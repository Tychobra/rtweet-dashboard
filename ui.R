header <- dashboardHeader(
  title = "Twitter Dashboard"
)

sidebar <- dashboardSidebar(
  sidebarMenu(
    shinyWidgets::searchInput(
      "search_twitter",
      "Seach Twitter",
      value = "Elon Musk",
      btnSearch = icon("search"),
      #btnReset = icon("remove"),
      width = "100%"
    ),
    menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
    menuItem("Map", tabName = "map", icon = icon("map-o")),
    menuItem("Tweets", tabName = "tweets", icon = icon("twitter"))
  )
)

body <- dashboardBody(
  tags$head(
    tags$link(
      rel = "shortcut icon",
      type = "image/png",
      href = "https://res.cloudinary.com/dxqnb8xjb/image/upload/v1510505618/tychobra-logo-blue_d2k9vt.png"
    ),
    tags$link(rel = "stylesheet", type = "text/css", href = "styles.css"),
    tags$script(src = "custom.js")
  ),
  tabItems(
    source("ui/01-ui-dashboard.R", local = TRUE)$value,
    source("ui/02-ui-map.R", local = TRUE)$value,
    source("ui/03-ui-tweets.R", local = TRUE)$value
  )
)

dashboardPage(
  header,
  sidebar,
  body,
  skin = "black"
)