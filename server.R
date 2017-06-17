library(shiny)
library(shinythemes)
function(input, output) {

 
  test <- eventReactive(input$goButton, {
    
    
   
    n=input$n
    
    p=input$p
    k=input$k
    
    
    xmat=matrix(0,n,k)
    
    y=rnorm(n,0,1)
    
    if(p!=0){
      x1=rnorm(n,y,1/abs(p))
     x2=rnorm(n,y,1/abs(p))
     }else{
      
       x1=rnorm(n,0,1 )
       x2=rnorm(n,0,1 )
      
    }
    
  
    if(p!=0){
    for(i in 1:k){
      
      xmat[,i]=rnorm(n,y,1/abs(p))
      
      
    } }else{
      for(i in 1:k){
        
        xmat[,i]=rnorm(n,0,1 )
        
        
      }
    }
    
    
    R2=0
    
    for(i in 1:k){
      
      R2[i]=cor( y,xmat[,i])
      
    }
    
    kk=which.max(abs(R2))
    
    y=rnorm(n,0,1)
    xmat=matrix(0,n,k)
    mm<-lm(y~xmat[,kk])
    
    mm2<-lm(y~xmat[, k-kk+1])
    
    # plot(density(y-mm$fitted.values),ylim=c(0,0.8))
    
   density(y-mm2$fitted.values, ylim = c(0,1.5),xlab="Residual", adjust=2)
    
    
    
    })
  
  
  output$plot1 <- renderPlot({
    
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
    
    mm<-lm(y2~xmat[,kk])
    
    y2-mm$fitted.values
    
    # hist(y-mm$fitted.values,freq = F)
    
    plot(density(y2-mm$fitted.values), xlab="Residual", main="")
    
    if (input$goButton) {
      lines(test(),col="blue",lwd=2)
      
    }
     
  })
  
  output$text <- renderText({ 
    HTML(paste("Black line: Original y subtracts the best X",
               "Blue line: New generated y subtracts a randomly chosen X", sep ="<br/>"))
  })
  
 
}

