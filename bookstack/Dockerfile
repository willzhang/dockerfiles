FROM centos

RUN yum install -y wget \
  && wget -nv -O- https://download.calibre-ebook.com/linux-installer.py | python -c "import sys; main=lambda:sys.stderr.write('Download failed\n'); exec(sys.stdin.read()); main()" \
  && wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm \
  && yum -y localinstall google-chrome-stable_current_x86_64.rpm \
  && mkdir -p /opt/bookstack/ \
  && wget -P /opt/bookstack/ https://github.com/TruthHun/BookStack/releases/download/v2.0/2019-08-18.BookStack.V2.0_Linux_amd64.zip \
  && cd /opt/bookstack/ \
  && yum install -y unzip \
  && unzip 2019-08-18.BookStack.V2.0_Linux_amd64.zip \
  && chmod +x BookStack \
  && ./BookStack install \
  && rm -rf 2019-08-18.BookStack.V2.0_Linux_amd64.zip \
  && yum clean all

COPY ./conf/ /opt/bookstack/conf/

EXPOSE 8181

CMD [ ./BookStack ]