This File type or MIME detection research is a part of NSF polar research project ( https://github.com/NSF-Polar-Cyberinfrastructure/datavis-hackathon/issues/1) and it aims to analyze the existing polar scientific data and identify polar scientific data type.
One of the goals is to analyze and identify the file types in the polar research project which are missed from being identified by Tika (Tika is a Apache project for content detection, etc), Tika has implemented 3 file type identification method - magic bytes, glob and content metadata hint. The research is based on content based type identification, which extract the byte histograms for the file and classify the types based on the file byte histograms, this approach enhances identification and circumscribe it with what it has seen, so it only trusts the file with the type which has the similar byte histogram pattern it has seen, this has pros and cons, the pros is that it enhance the security aspect of the file type identification, but the cons is slow detection which requires the reading the entire file for computing the byte histogram and it might be also narrow minded when detecting those file types that might have huge difference from what it has seen even if those types belong to the same class.

### Multi-class classification:
Multi-class classification is challenging, because it is computational expensive and there are too many file types at least over 1000. The idea in this project is first to analyse the file types that Tika is failing to identify and minimize the problem domain, and target those unknown file types in this NASA polar scientific project and provide the support that help identify them.
As an example, grb or grib files are one of the unknown files, the content based learning research is targeting at the grb file identification.

### Algorithms
In this research, Neural network and Linear logistic regression are being implemented to classify grb file type from other file types. Please note, one of the challenges is that if predicting non-grb file types, it is better there are as many negative training examples as possible so as to train the model, however the size of negative training examples(i.e. non-grb files) can be enormous, therefore it might be better we are given a set of types to be classified and we build a model that can work on those file type classification.
The input is byte histogram of a file and the output is a binary decision that predict whether the file is a grb type or not a grb type (note again, if we are given a set of types to be classified, the problem will be much simplified and the algorithm efficiency will probably be improved as the problem domain is narrowed and bounded).
The positive training examples are collected from the AMD polar web sites (*.gsfc.nasa.gov). i.e. ftp://hydro1.sci.gsfc.nasa.gov/data/
The negative training examples are collected from the following i.e. http://digitalcorpora.org/corp/files/govdocs1/zipfiles/ 

###Preprocessing
/1) Read byte content of the file build byte histogram. build frequency by dividing each bin value with the max count of occurrence to have each bin value to fall in the range between 0 and 1.

/2) square the root to enhance the frequency distribution; as in some files some bytes have higher frequencies whereas other bytes are less frequent, or in a critical situation, some files have only one or two bins that occupy the majority of the count, this makes a large gap between the most frequent and less frequent, the solution is to apply a compounding function - A law or u law; square-rooting the bin values also provide the same effect, so by considering the computational cost, the square the bin value is chosen in place of A law or u law.

###Algorithm Neural networks
The simple idea is that machine learning techniques such as neural network is used to classify the file types based on byte frequency histogram. The input the preprocessed histogram and the output simply is a yes/no (1 or 0); With neural network, we can actually have a probability that might tell how likely it believes a given input histogram is a grb or non-grb, again it is worth stressing that no-grb is a huge class to be classified, we might need to have a s many negative training examples as possible, but if we know what types we are dealing with, the problem might be further simplified;

###The ultimate goal with this research: 
eventually, the feature of content based file type detection is being considered to be added as part of Tika library.
