##  Server.r
##

library("shiny")
library("UsingR")
data(galton)

reg<-lm(Galton$child~Galton$parent) 

predictChildHeight <- function(parentHeight) {
        coef(reg)[1] + parentHeight * coef(reg)[2]
}

shinyServer(
        function(input, output) {
                
                ## calculate the predicted value reactively
                x <- reactive({ predictChildHeight(as.numeric(input$nbx_ParentHeight)) })
                
                output$txtOut_ParentHeight <- renderText(input$nbx_ParentHeight)
                
                output$txtOut_ChildHeight <- renderText({ 
                        input$btn_Go
                        isolate(x())
                })
                
                output$plotOut_SunFlower <- renderPlot({

                        sunflowerplot(Galton$parent,Galton$child, xlim=c(62,78), ylim=c(60,78))
        
                        input$btn_Go
                        isolate({
                                if (input$cbx_ShowLm) {
                                        abline(reg, col="blue", lwd=2) 
                                }
                        
                                abline(v=input$nbx_ParentHeight, col="green") 
                                abline(h=x(), col="green")
                        }) 
                })
        }
)