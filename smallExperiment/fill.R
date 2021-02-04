library(RPostgreSQL)
database.host <- "khaleesi"
db <- dbConnect(PostgreSQL(), user= "trena", password="trena", dbname="remap2020", host=database.host)
tbl <- as.data.frame(get(load("tbl.chip.gata2.promoter.RData")))
rownames(tbl) <- NULL
#tbl <- tbl[, -9]
colnames(tbl) <- c("chrom", "start", "endpos", "name", "score", "strand", "peakstart", "peakend", "color")
dbWriteTable(db, "chip", tbl, append=TRUE, row.names=FALSE)
dbGetQuery(db, "select count(*) from chip")


   # now the annotation table

tbl.2 <- as.data.frame(get(load("../experimentAnnotation/tbl.experimentAnno.RData")))
rownames(tbl.2) <- NULL
colnames(tbl.2) <-  c("id", "tf", "celltype", "treatment", "experiment", "url")
dbWriteTable(db, "anno", tbl.2, append=TRUE, row.names=FALSE)
dbGetQuery(db, "select count(*) from anno")








dbDisconnect(db)


