# filetypeDetection

File type detection project is a part of NSF polar research project that aims to improve the MIME type detection algorithm currently implemented in Tika.

Neural network and Linear logistic regression are implemented to classify grb file type from other file types.
The input is byte histgram of a file and the output is a 0/1 desicion that predict whether the the file is a grb type or not a grb type.

The positive training examples are collected from the AMD polar web sites (*.gsfc.nasa.gov).
  i.e. ftp://hydro1.sci.gsfc.nasa.gov/data/
  
The negative training examples are collected from the following
  i.e. http://digitalcorpora.org/corp/files/govdocs1/zipfiles/  


More detail with the implementation is coming soon.




