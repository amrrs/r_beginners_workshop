#devtools::install_github("bnosac/image", subdir = "image.darknet", build_vignettes = TRUE)

library(image.darknet)

#If required, Set new working directory where the final predictions imaged with bounding box will be saved

#setwd(paste0(getwd(),"/projects/"))

#Define Model - here it is Tiny Yolo
yolo_tiny_voc <- image_darknet_model(type = 'detect', 
                                     model = "tiny-yolo-voc.cfg", 
                                     weights = system.file(package="image.darknet", "models", "tiny-yolo-voc.weights"), 
                                     labels = system.file(package="image.darknet", "include", "darknet", "data", "voc.names"))



#Image Detection
x <- image_darknet_detect(file = "tinyyolo_in_R/google-car.png", 
                          object = yolo_tiny_voc,
                          threshold = 0.19)
