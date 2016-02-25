library(tm)
library(wordcloud)
function(input, output, session) {
  getTermMatrix <- (function(text) {
    # Careful not to let just any name slip in here; a
    # malicious user could manipulate this value.
    #if (!(book %in% books))
    #  stop("Unknown book")
    #text <- readLines(sprintf("./%s.txt.gz", book),
     #                 encoding="UTF-8")
    
    myCorpus = Corpus(VectorSource(text))
    myCorpus = tm_map(myCorpus, content_transformer(tolower))
    myCorpus = tm_map(myCorpus, removePunctuation)
    myCorpus = tm_map(myCorpus, removeNumbers)
    myCorpus = tm_map(myCorpus, removeWords,
                      c(stopwords("SMART"),"the", "and", "but"))
    
    myDTM = TermDocumentMatrix(myCorpus,
                               control = list(minWordLength = 1))
    
    m = as.matrix(myDTM)
    
    sort(rowSums(m), decreasing = TRUE)
  })
  terms <- reactive({
    # Change when the "update" button is pressed...
    input$update
    # ...but not for anything else
    validate(
      need(input$inText != "", "Please select a data set")
    )
    isolate({
      withProgress({
        setProgress(message = "Processing corpus...")
        getTermMatrix(input$inText)
      })
    })
  })
  
  # Make the wordcloud drawing predictable during a session
  wordcloud_rep <- repeatable(wordcloud)
  
  output$plot <- renderPlot({
    v <- terms()
    wordcloud_rep(names(v), v, scale=c(7,1),
                  min.freq = input$freq, max.words=input$max,
                  colors=brewer.pal(8, "Dark2"))
  })
}