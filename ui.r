##  ui.r
##

library("shiny")

shinyUI(pageWithSidebar(
        
        # the header panel
        headerPanel("Predict Child's Height"),
        
        # the side bar        
        sidebarPanel(
#                 numericInput("nbx_ParentHeight", "Enter Parent Height (in in)", 
#                              value=0, min=50, max=100, step=0.5),
                sliderInput("nbx_ParentHeight", "Enter Parent Height in Inches:", 
                            min = 62, max = 78, value = 0, step= 0.5),
                checkboxInput("cbx_ShowLm", label = "Show Regression Line", value=FALSE),
                actionButton("btn_Go", "GO!")
        ),
        
        # the main panel
        mainPanel(
                h4("You Entered:"),
                verbatimTextOutput("txtOut_ParentHeight"),
                h4("Which resulted in a prediction of:"),
                verbatimTextOutput("txtOut_ChildHeight"),
                plotOutput("plotOut_SunFlower"),
                
                ## the explanation text
                h3("Explanation"),
                h4("The app uses the famous Galton dataset to predict the height of a 
                    child based on what you input as the parent's height.  The heights 
                    are in inches, and the sunflower plot shows the density of the data 
                    points collected by Galton.  A linear regression model is fitted 
                    onto the data points.  You can check the checkbox to see the regression 
                    line.  A prediction of the child's height is done by applying the 
                    linear regression model to the parents height."),
                h4("To use: Use the slider to enter a Parents Height, then hit GO")
        )

))