# docker-potreeconverter
potree converter for docker

## Example command to run.

docker run -v /host/path/input:/input \\ \
-v /host/path/output:/output \\ \
potreeconverter ./PotreeConverter \\ \
/input/filename.las \\ \
-p output_foldername \\ \
-o /output/output_foldername \\ \
--generate-page \\ \
--page-template \\ \
-p index  \\ \
--projection "+proj=utm +zone=47 +ellps=WGS84 +datum=WGS84 +units=m +no_defs"
