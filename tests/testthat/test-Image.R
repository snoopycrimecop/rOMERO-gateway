setup <- read.csv("setup.csv", comment.char = "#", header = TRUE)

host <- as.character(setup[grep("omero.host", setup$Key, ignore.case=T), ]$Value)
port <- strtoi(setup[grep("omero.port", setup$Key, ignore.case=T), ]$Value)
user <- as.character(setup[grep("omero.user", setup$Key, ignore.case=T), ]$Value)
pass <- as.character(setup[grep("omero.pass", setup$Key, ignore.case=T), ]$Value)

imageID <- strtoi(setup[grep("imageid", setup$Key, ignore.case=T), ]$Value)

server <- OMEROServer(host=host, port=port, username=user, password=pass)
server <- connect(server)

test_that("Test Image getThumbnail",{
  img <- loadObject(server, "ImageData", imageID)
  thumb <- getThumbnail(img)
  plot(0:1,0:1,type="n",ann=FALSE,axes=FALSE)
  rasterImage(thumb,0,0,1,1)
  expect_that(dim(thumb), equals(c(96,96,3)))
})

