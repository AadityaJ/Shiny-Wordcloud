Shiny Based Word cloud
===============================
## [Big Link to the App](https://aadityaj.shinyapps.io/R-Worcloud)
### Intro
From wikipedia
> *A tag cloud (word cloud, or weighted list in visual design) is a visual representation of text data, typically used to depict keyword metadata (tags) on websites, or to visualize free form text*.

The current word cloud is able to filter word contents based on their relative frequency.

### Running and Dependencies

The link to app is posted [above](https://aadityaj.shinyapps.io/R-Worcloud).</br>
To run just click on the link and paste on the textBox like
![this](http://www.aadityajamuar.net/selfplots/shiny-wordcloud.png)


</br>
Or if you want to run it yourself locally
```
$ git clone https://github.com/AadityaJ/Shiny-Wordcloud
```
Then in your RStudio navigate to the project, do :
```
$ setwd("~/Shiny-Wordcloud/R-Worcloud")
$ runApp()
```
Although make sure that when you are Running locally, the code relies on libraries :
* [worcloud](https://cran.r-project.org/web/packages/wordcloud/index.html)
* [tm](https://cran.r-project.org/web/packages/tm/index.html)
