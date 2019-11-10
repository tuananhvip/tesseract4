ARG version=4.0.0
ARG base_version=v4
ARG lang="eng"
ARG langcn="chi_sim"


FROM minidocks/base:3.8 as v3

FROM minidocks/librsvg as v4

FROM $base_version as latest


ARG version
ENV TESSDATA_PREFIX=/usr/share/tessdata \
    TESSDATA_URL=https://github.com/tesseract-ocr/tessdata/blob/master/chi_sim.traineddata

#    TESSDATA_URL=https://github.com/tesseract-ocr/tessdata/raw/$version
# https://github.com/tesseract-ocr/tesseract/issues/898#issuecomment-315202167
ENV OMP_THREAD_LIMIT=1

RUN apk --update add tesseract-ocr && chmod a+rwx "$TESSDATA_PREFIX" && clean

# COPY rootfs /

# RUN if [ "$version" != '3.04.00' ]; then tessdata osd equ; fi

CMD [ "tesseract" ]


# Lang
FROM latest as lang
RUN apt-get install tesseract-ocr-chi-sim
FROM latest




# FROM centos:centos7
# MAINTAINER tuan anh <tuananhktmt@gmail.com>

# RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

# ## Install BUILD Tools
# RUN yum -y --nogpgcheck install libxslt gcc gcc-c++ make autoconf wget automake libtool unzip openssl-devel bzip2-devel  libffi-devel

# ## Tesseract 4 (Centos has only 3 by default)
# RUN yum-config-manager --nogpgcheck --add-repo https://download.opensuse.org/repositories/home:/Alexander_Pozdnyakov/CentOS_7/
# RUN yum -y install --nogpgcheck tesseract tesseract-ocr-chi-sim tesseract-langpack-chi_sim


# #ENV       TESSERACT_MAJOR_VERSION 3.02
# #ENV       TESSERACT_MINOR_VERSION 02
# #ENV       LEPTONICA_VERSION 1.69

# #RUN yum install -y libjpeg libz libgif libwebp libopenjp2 giflib libtiff libpng compat-libtiff3 tar

# #RUN rpm -Uhv http://li.nux.ro/download/nux/dextop/el7/x86_64/leptonica-${LEPTONICA_VERSION}-9.el7.nux.x86_64.rpm
# #RUN rpm -Uhv http://li.nux.ro/download/nux/dextop/el7/x86_64/tesseract-${TESSERACT_MAJOR_VERSION}.${TESSERACT_MINOR_VERSION}-4.el7.nux.x86_64.rpm
# #RUN rpm -Uhv http://li.nux.ro/download/nux/dextop/el7/x86_64/tesseract-osd-${TESSERACT_MAJOR_VERSION}.${TESSERACT_MINOR_VERSION}-4.el7.nux.x86_64.rpm

# ENTRYPOINT ["tesseract"]
# CMD ["--version"]
