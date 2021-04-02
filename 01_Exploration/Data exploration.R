#library(googlesheets)
library(tidyverse)
library(readxl)
library(janitor)

details <- readxl::read_xlsx("00_data/David Robinson Screencast Annotations.xlsx",sheet = 1)
topic <- readxl::read_xlsx("00_data/David Robinson Screencast Annotations.xlsx",sheet = 2)


details %>% 
  glimpse() 
  
details %>% 
  clean_names() %>% 
  select(functions) %>% 
  separate_rows(functions,sep=" | ") %>% 
  filter(!is.na(functions),
         !str_detect(functions,"\\|")) %>%
  count(functions) %>% 
  arrange(-n) %>% 
  head(20)

