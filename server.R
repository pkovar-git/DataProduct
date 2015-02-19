library(shiny)
library(UsingR)

data(father.son)

fit <- lm(sheight ~ fheight, data=father.son)

predict.son.height <- function(father.height) predict(fit,data.frame(fheight = c(father.height)))

shinyServer(
  function(input, output) {
    father.height <- reactive(input$father.height)
    son.height <- reactive(round(predict.son.height(father.height()),2))
    
    output$father.height.cm <- renderPrint(paste(father.height(),'in = ',round(father.height() * 2.54 , 0),'cm'))
    
    output$son.height.in <- renderPrint({input$goButton
                                      isolate(paste("Father's height",father.height(),'in','->',"son's height",son.height(),'in'))})
    
    output$son.height.cm <- renderPrint({input$goButton
                                         isolate(paste("Father's height",round(father.height() * 2.54 , 0),'cm','->',"son's height",round(son.height() * 2.54, 0),'cm'))})

    output$scatterPlot <- renderPlot({input$goButton
          isolate(plot(father.son,xlab="father's height", ylab="son's height"))
          isolate(abline(h = son.height(), col = "red"))
          isolate(abline(v = father.height(), col = "red"))
        })
    }
  
)