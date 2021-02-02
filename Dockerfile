FROM registry.redhat.io/openshift4/ose-jenkins-agent-maven

USER root
WORKDIR /opt

#RUN wget https://apache.mirrors.nublue.co.uk/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz >/dev/null 2>&1
#RUN tar zxvf apache-maven-3.6.3-bin.tar.gz
#RUN ln -s apache-maven-3.6.3 maven
#ENV M2_HOME=/opt/maven

RUN wget https://github.com/graalvm/mandrel/releases/download/mandrel-20.1.0.4.Final/mandrel-java11-linux-amd64-20.1.0.4.Final.tar.gz >/dev/null 2>&1
#https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-20.0.0/graalvm-ce-java11-linux-amd64-20.0.0.tar.gz >/dev/null 2>&1
RUN tar -xf mandrel-java11-linux-amd64-20.1.0.4.Final.tar.gz
ENV JAVA_HOME="$( pwd )/mandrel-java11-20.1.0.4.Final"
ENV GRAALVM_HOME="${JAVA_HOME}"
ENV PATH="${JAVA_HOME}/bin:${PATH}"
#tar zxvf graalvm-ce-java11-linux-amd64-20.0.0.tar.gz
#ENV GRAALVM_HOME=/opt/graalvm-ce-java11-20.0.0
#ENV PATH=$GRAALVM_HOME/bin:$M2_HOME/bin:$PATH

#RUN gu install native-image
#RUN yum -y install gcc gcc-c++ glibc-devel libstdc++-devel libstdc++ zlib zlib-devel
#RUN dnf install glibc-devel zlib-devel gcc libstdc++-static
#RUN dnf --setopt=tsflags=nodocs install -y tar gzip gcc glibc-devel zlib-devel shadow-utils unzip gcc-c++ \
#            && rpm -q tar gzip gcc glibc-devel zlib-devel shadow-utils unzip gcc-c++

RUN chown -R 1001:0 $HOME && chmod -R g+rw $HOME

USER 1001