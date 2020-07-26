
FROM lambci/lambda:build-python3.7
ARG version=3.7
WORKDIR /build

RUN mkdir -p python/lib/python$version/site-packages/
RUN pip install nltk -t python/lib/python$version/site-packages/

# Setup NLTK again in system path to execute nltk.downloader
RUN pip install nltk
# Setup directory for NLTK_DATA
RUN mkdir -p ./nltk_data
# Download NLTK_DATA to build directory
RUN python -W ignore -m nltk.downloader punkt -d /build/nltk_data
RUN python -W ignore -m nltk.downloader stopwords -d /build/nltk_data

RUN mkdir -p ./share
RUN zip -r ./share/python-nltk-layer.zip python nltk_data
