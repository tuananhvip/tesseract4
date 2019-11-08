FROM centos:centos7
MAINTAINER tuan anh <tuananhktmt@gmail.com>

RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

## Install BUILD Tools
RUN yum -y --nogpgcheck install libxslt gcc gcc-c++ make autoconf wget automake libtool unzip openssl-devel bzip2-devel  libffi-devel

## Tesseract 4 (Centos has only 3 by default)
RUN yum-config-manager --nogpgcheck --add-repo https://download.opensuse.org/repositories/home:/Alexander_Pozdnyakov/CentOS_7/
RUN yum -y install --nogpgcheck tesseract tesseract-ocr-chi-sim tesseract-langpack-chi_sim


#ENV       TESSERACT_MAJOR_VERSION 3.02
#ENV       TESSERACT_MINOR_VERSION 02
#ENV       LEPTONICA_VERSION 1.69

#RUN yum install -y libjpeg libz libgif libwebp libopenjp2 giflib libtiff libpng compat-libtiff3 tar

#RUN rpm -Uhv http://li.nux.ro/download/nux/dextop/el7/x86_64/leptonica-${LEPTONICA_VERSION}-9.el7.nux.x86_64.rpm
#RUN rpm -Uhv http://li.nux.ro/download/nux/dextop/el7/x86_64/tesseract-${TESSERACT_MAJOR_VERSION}.${TESSERACT_MINOR_VERSION}-4.el7.nux.x86_64.rpm
#RUN rpm -Uhv http://li.nux.ro/download/nux/dextop/el7/x86_64/tesseract-osd-${TESSERACT_MAJOR_VERSION}.${TESSERACT_MINOR_VERSION}-4.el7.nux.x86_64.rpm

ENTRYPOINT ["tesseract"]
CMD ["--version"]
