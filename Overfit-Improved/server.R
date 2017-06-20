library(shiny)
library(shinythemes)
shinyServer(function(input, output) {
  
  
  output$plot1 <- renderPlot({
    
    n=input$n
    
    p=input$p
    k=input$k
    
    
    xmat=matrix(0,n,k)
    
    y1=rnorm(n,0,1)
    
    if(p!=0){
      x1=rnorm(n,y1,1/abs(p))
      x2=rnorm(n,y1,1/abs(p))
    }else{
      
      x1=rnorm(n,0,1 )
      x2=rnorm(n,0,1 )
      
    }
    
    
    if(p!=0){
      for(i in 1:k){
        
        xmat[,i]=rnorm(n,y1,1/abs(p))
        
        
      } }else{
        for(i in 1:k){
          
          xmat[,i]=rnorm(n,0,1 )
          
          
        }
      }
    
    
    R2=0
    
    for(i in 1:k){
      
      R2[i]=cor( y1,xmat[,i])
      
    }
    
    kk=which.max(abs(R2))
    
    y1=rnorm(n,0,1)
    xmat=matrix(0,n,k)
    
    mm2<-lm(y1~xmat[, k-kk+1]) # Randomly Chosen X
    d1<-density(y1-mm2$fitted.values) # Randomly Chosen X
    
    
    n=input$n
    
    p=input$p
    k=input$k
    
    
    xmat=matrix(0,n,k)
    
    
    
    y2=rnorm(n,0,1)
    
    
    if(p!=0){
      x1=rnorm(n,y2,1/abs(p))
      x2=rnorm(n,y2,1/abs(p))
    }else{
      
      x1=rnorm(n,0,1 )
      x2=rnorm(n,0,1 )
      
    }
    
    
    
    if(p!=0){
      for(i in 1:k){
        
        xmat[,i]=rnorm(n,y2,1/abs(p))
        
        
      } }else{
        for(i in 1:k){
          
          xmat[,i]=rnorm(n,0,1 )
          
          
        }
      }
    
    
    
    
    R2=0
    
    for(i in 1:k){
      
      R2[i]=cor( y2,xmat[,i])
      
    }
    
    kk=which.max(abs(R2))
    
    mm<-lm(y2~xmat[,kk]) # Best Chosen X
    
    y2-mm$fitted.values
    
    # hist(y-mm$fitted.values,freq = F)
    d2<-density(y2-mm$fitted.values) # Pick the best X
    
    plot(range(d1$x, d2$x), range(d1$y, d2$y), type = "n", xlab = "Residual",
              ylab = "Density", main="")
    
    if (input$goButton) {
      lines(d1,col="blue",lwd=2)
      lines(d2, col="black",lwd=2)
    }
    
  })
  
  output$text <- renderText({ 
    HTML(paste("Black line: Original y subtracts the best X",
               "Blue line: New generated y subtracts a randomly chosen X", sep ="<br/>"))
  })
  
  
})

