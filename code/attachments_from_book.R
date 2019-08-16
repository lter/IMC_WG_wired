
library(rvest)
library(rmarkdown)
library(lubridate)
library(stringr)


#get the attachments from a drupal book
#click on the link 'Printer Friendly Version' on the bottom of the webpage
#this will make all pages within a drupal book into one long printable document
#with all links on the bottom

#this script will only download attachments that are on the im.ltern.edu server

#this is the URL once you see the printable version
book_url <- 'http://im.lternet.edu/print/book/export/html/17'

#set the path where the attachements should be downloaded to
file_path <- '../resources_archive/LTER_IM_guidelines'

#rvest reads the html page
notes_page <- read_html(book_url)

#find all link on the bottom of the page
attachment_urls <- notes_page %>%
  html_node('.print-links') %>%
  html_text()

all_urls <- str_split(attachment_urls, '\\n')

download_urls <- array()
count <- 1

#parse out the URLs that go to resources within the im.lternet.edu server
for (l in 1:length(all_urls[[1]])) {
  
  if (str_detect(all_urls[[1]][l], 'http://im\\.lternet\\.edu/sites/im\\.lternet\\.edu/files/')) {
    
    download_urls[count] <- str_extract(all_urls[[1]][l], 'http://im\\.lternet\\.edu/sites/im\\.lternet\\.edu/files/.+')
    count <- count + 1
  }
  
}


#download the files. This sometimes chokes and some have to be downloaded manually, not sure why
#once a problem file is downloaded reset the for loop to the next index number

if (length(download_urls) > 0) {
  for (j in 1:length(download_urls)) {
    
    print(j)
    print(download_urls[j])
    
    filename_raw <- str_split(download_urls[j], '/')
    text_part <- length(filename_raw[[1]])
    
    destfile <- paste(file_path, 'attachments', filename_raw[[1]][text_part], sep = '/')
    
    download.file(download_urls[j],
                  destfile,
                  mode = 'wb',
                  quiet = FALSE)
    
  }
}
