text <- readLines(sprintf("merchant.txt.gz"),
                  encoding="UTF-8")
text<- readLines("http://www.gutenberg.org/cache/epub/244/pg244.txt")
myCorpus = Corpus(VectorSource(text))
myCorpus = tm_map(myCorpus, content_transformer(tolower))
myCorpus = tm_map(myCorpus, removePunctuation)
myCorpus = tm_map(myCorpus, removeNumbers)
myCorpus = tm_map(myCorpus, removeWords,
                  c(stopwords("SMART"),"the", "and", "but"))
myDTM = TermDocumentMatrix(myCorpus,
                           control = list(minWordLength = 1))
m = as.matrix(myDTM)
v<-sort(rowSums(m), decreasing = TRUE)
d <- data.frame(word = names(v),freq=v)
head(d, 10)
pal <- brewer.pal(9,"YlGnBu")
pal <- pal[-(1:4)]
wordcloud(myCorpus, max.words = 100, random.order = FALSE,colors = brewer.pal(8, "Dark2"))
