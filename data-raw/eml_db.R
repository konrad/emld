## FIXME: Consider generating a version that returns a data.frame for each class:
## with columns as property, required, type, & description (indicating if it takes a text/data value or another node)
## Would be constructed by parsing the XSD again directly...



library(readr)
library(stringr)
library(magrittr)
library(devtools)
library(EML)

class_defs <- read_lines("../../ropensci/EML/R/classes.R")
#stmml_classes <- read_lines("../../ropensci/EML/R/classes-stmml.R")

matches <- str_match(class_defs, "setClass\\(\'(\\w+)\'.*") %>% na.omit()
classes <- matches[,2]
real_classes <- classes[ - grep("ListOf\\w+",classes)]


eml_db <- lapply(real_classes, function(tag){
  order <- methods::slotNames(tag)
  # Notes: lang and schemaLocation are xsi: properties and technically available on any xml node
  # value is a child node only used to give alternate values, e.g. for differen langs.  acts a bit like @value
  # references acts like @id, and should not be a separate property
  # character refers to R character type, and is not a slot
  drop <- grep("(.Data|slot_order|schemaLocation|lang|value|references|character)", order)
  if(length(drop) > 0){
    order <- order[-drop]
  }
  order <- gsub("^id$", "@id", order)
  attrs <- c("scope","system","authSystem","function",
             "typeSystem","phonetype","keywordType","enforced",
             "exclusive","directory")
  for(attr in attrs){
    order <- gsub(paste0("^(", attr, ")$"), "#\\1", order)
  }

  order
  })
names(eml_db) <- real_classes

devtools::use_data(eml_db, overwrite = TRUE, internal = TRUE)