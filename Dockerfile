FROM centos:7
RUN yum update -y && yum install -y epel-release
RUN yum install -y gcc gcc-c++ make R bwa samtools BEDTools zip unzip git zlib-devel libpng12
RUN mkdir -p /build
WORKDIR /build
RUN curl -OL https://genome-test.gi.ucsc.edu/~kent/exe/linux/blatSuite.36.zip && unzip -d /usr/local/bin blatSuite.36.zip
RUN curl -OL https://cran.r-project.org/src/contrib/ada_2.0-5.tar.gz && R CMD INSTALL ada_2.0-5.tar.gz
RUN git clone https://github.com/lh3/seqtk.git
WORKDIR /build/seqtk
RUN make && cp seqtk /usr/local/bin
WORKDIR /build
ADD ericscript-0.5.5.tar.bz2 /build/
RUN ln -s /build/ericscript-0.5.5/ericscript.pl /usr/local/bin
