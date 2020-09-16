library(shiny)

data(Titanic)
df <- as.data.frame(Titanic)

ui <- fluidPage(
    
    titlePanel("Titanic Death/Survival Shiny APP"),
    
    sidebarLayout(
        
        sidebarPanel(
            helpText("Use the 3 select menus, then hit submit to determine those passengers' fates."),
            
            br(),
            
            selectInput( "class", "Class", levels(df[1,1]), "1st"),
            selectInput( "sex", "Sex", levels(df[1,2]), "Male"),
            selectInput( "age", "Age", levels(df[1,3]), "Adult"),
            submitButton("Submit")
        ),
        
        mainPanel(
            tabsetPanel(
                tabPanel("Plot", plotOutput('plot')), 
                tabPanel("Manual", verbatimTextOutput("summary"),p("This dataset provides information on the 2,201 passengers on its fatal maiden voyage.Use the 3 select menus, then hit submit to determine those passengers' fates."))
            )
        )
    )
)
