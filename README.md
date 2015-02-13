# File Type Detection Machine learning based on byte histograms 

This File type or MIME detection detection research is a part of NSF polar research project( https://github.com/NSF-Polar-Cyberinfrastructure/datavis-hackathon/issues/1) and it aims to analyse the existing polar scientific data and identify polar scientific data type.

One of the goals is to analyse and identify the file types in the polar research project which are missed from being identified by Tika (Tika is a Apache project for content detection, etc), Tika has implemented 3 file type identification method - magic bytes, glob and content metadata hint. The research is based on content based type identification, which extract the byte histgroms for the file and classify the types based on the file byte histgroms, this approach enhances identification and circumscribe it with what it has seen, so it only trusts the file with the type which has the similar byte histgrom pattern it has seen, this has pros and cons, the pros is that it enhance the security aspect of the file type identification, but the cons is slow detection whcih requires the reading the entire file for computing the byte histogram  and it might be also narrow minded when detecting those file types that might have huge difference from what it has seen even if those types belong to the same class.

##Multi-class classification:
Multi-class classification is chanllenging, because it is computational expensive. The idea in this project is first to analyse the file types that Tika is failing to identify, and target those unknown file types and provide the support that help identify them.

As an example, grb or grib files are one of the unknown files, content based learnign algorithm is firstly targeting at the grb file identificaiton.
Neural network and Linear logistic regression are implemented to classify grb file type from other file types.
The input is byte histgram of a file and the output is a 0/1 desicion that predict whether the the file is a grb type or not a grb type.

The positive training examples are collected from the AMD polar web sites (*.gsfc.nasa.gov).
  i.e. ftp://hydro1.sci.gsfc.nasa.gov/data/
  
The negative training examples are collected from the following
  i.e. http://digitalcorpora.org/corp/files/govdocs1/zipfiles/  





More detail with the implementation is coming soon.




