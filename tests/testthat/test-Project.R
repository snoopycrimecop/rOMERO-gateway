setup <- read.csv("setup.csv", comment.char = "#", header = TRUE)

host <- as.character(setup[grep("omero.host", setup$Key, ignore.case=T), ]$Value)
port <- strtoi(setup[grep("omero.port", setup$Key, ignore.case=T), ]$Value)
user <- as.character(setup[grep("omero.user", setup$Key, ignore.case=T), ]$Value)
pass <- as.character(setup[grep("omero.pass", setup$Key, ignore.case=T), ]$Value)

imageID <- strtoi(setup[grep("imageid", setup$Key, ignore.case=T), ]$Value)
projectID <- strtoi(setup[grep("projectid", setup$Key, ignore.case=T), ]$Value)
datasetID <- strtoi(setup[grep("datasetid", setup$Key, ignore.case=T), ]$Value)

server <- OMEROServer(host=host, port=port, username=user, password=pass)
server <- connect(server)

test_that("Test Project getImages",{
  proj <- loadObject(server, "ProjectData", projectID)
  imgs <- getImages(proj)
  expect_that(length(imgs), equals(1))
  
  clazz <- class(imgs[[1]])[[1]]
  expect_that(clazz, equals('Image'))
})



