#this script will read the pages that have a table with links to the meeting notes
#it goes through each link, loads the Printer Friendly version of that page
#saves it as pdf and downloads all attachments
#it will not follow any further links that my be on that page
#so, some information may be lost

#if no table of meeting notes exists use the script 'attachments_for_book' and convert the actual page manually

library(rvest)
library(rmarkdown)
library(lubridate)
library(stringr)


#these are the different working group notes tables that were downloaded in chunks
#IMexec was done manually

# controlled vocabulary meeting notes
#notes_url <- 'http://im.lternet.edu/projects/controlled_vocabulary/meeting_notes'
# directory to store files
#file_path <- '../controlled_vocabulary'

#DEIMS meeting notes
#notes_url <- 'http://im.lternet.edu/projects/DEIMS/meeting_notes'
# directory to store files
#file_path <- '../IMC_WG_inactive_git/IMC_WG_inactive/DEIMS'

#EML Congruence Checker meeting notes
#notes_url <- 'http://im.lternet.edu/projects/eml_congruency_checker/meeting_notes'
# directory to store files
#file_path <- '../ECC'

# GIS working group
#notes_url <- 'http://im.lternet.edu/projects/gis_data/meeting_notes'
# directory to store files
#file_path <- './IMC_WG_inactive/GIS'

#units working group
#notes_url <- 'http://im.lternet.edu/projects/units/meeting_notes'
# directory to store files
#file_path <- '../IMC_WG_inactive/unitsWG'
#file_prefix <- 'unitsWG'

#webservices working group
#notes_url <- 'http://im.lternet.edu/projects/webservices/meeting_notes'
# directory to store files
#file_path <- '../IMC_WG_inactive/webservicesWG'
#file_prefix <- 'webservicesWG'

#governance working group
#notes_url <- 'http://im.lternet.edu/projects/governance/resources'
# directory to store files
#file_path <- '../IMC_WG_inactive/governanceWG'
#file_prefix <- 'governanceWG'

#IM/LNO collaboration working group
#notes_url <- 'http://im.lternet.edu/projects/inactive/im_lno_partnerships'
# directory to store files
#file_path <- '../IMC_WG_inactive/im_lno_partnershipWG'
#file_prefix <- 'im_lno_partnershipWG'

#QA/QC working group
#notes_url <- 'http://im.lternet.edu/projects/inactive/qa_qc'
# directory to store files
#file_path <- '../IMC_WG_inactive/qa_qcWG'
#file_prefix <- 'qa_qcWG'

#IMC virtual water cooler meetings
notes_url <- 'http://im.lternet.edu/home/meetings/virtualupdates'
# directory to store files
file_path <- '../IMC_VWC'
file_prefix <- 'IMC_VWC'


im_url <- 'http://im.lternet.edu'

notes_table <- read_html(notes_url)

links <- notes_table %>% html_node('tbody') %>% 
  html_nodes('a') %>% 
  html_attr('href')

upload_dates <- notes_table %>% 
  html_nodes('tr') %>% 
  html_node('.views-field-created') %>% 
  html_text() %>%
  str_trim() %>%
  mdy_hm()

upload_dates <- upload_dates[-1]

for (i in 1:length(links)) {
  
  page_url <- paste(im_url, links[i], sep = '')
  
  notes_page <- read_html(page_url)
  
  page_id <- notes_page %>% 
    html_node('.node') %>%
    html_attr('id')
  
  page_id <- str_remove(page_id, 'node-')
  
  print_url <- paste(im_url, 'print', page_id, sep = '/')
  
  print(i)
  print(print_url)
  
  file_name <- as.character(upload_dates[i])
  file_name <- str_replace_all(file_name, ' ', '_')
  file_name <- str_replace_all(file_name, ':', '')
  file_name <- paste(file_name, 'pdf', sep = '.')
  file_name <- paste(file_prefix, file_name, sep = '_')
  
  #convert webpage to pdf
  #this may only work on Windows and in RStudion where Pandoc is included
  #it also requires MiKTeX to be installed and on the Path
  #MiKTeX come with a package manager and will ask to install a lot of packages when going through this conversion
  
  pandoc_convert(print_url,
                 to = 'latex',
                 output = file_name,
                 wd = paste(getwd(), file_path, sep = '/'))
  
  
  #find all attachments and download them
  attachment_urls <- notes_page %>%
    html_node('table#attachments') %>%
    html_nodes('a') %>% 
    html_attr('href')
  
  attachment_file_names <- notes_page %>%
    html_node('table#attachments') %>%
    html_nodes('a') %>%
    html_text()
  
  if (length(attachment_urls) > 0) {
    for (j in 1:length(attachment_urls)) {
      
      destfile <- paste(file_path, 'attachments', attachment_file_names[j], sep = '/')
      
      download.file(attachment_urls[j],
                    destfile,
                    mode = 'wb',
                    quiet = FALSE)
      
    }
  }
  
  
}
