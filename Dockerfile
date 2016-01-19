FROM  ubuntu
MAINTAINER Ilya Fourmanov <ilya.fourmanov@gmail.com>

RUN apt-get update
RUN apt-get install curl git -y

RUN curl -L https://www.opscode.com/chef/install.sh | sudo bash -s -- -P chefdk
RUN locale-gen en_US.UTF-8
RUN chef gem install kitchen-ec2 -n /opt/chefdk/bin/
RUN chef gem install kitchen-azure -n /opt/chefdk/bin/
RUN chef gem install kitchen-docker -v 2.0.0 -n /opt/chefdk/bin/
RUN chef gem install kitchen-nodes -n /opt/chefdk/bin/

WORKDIR /kitchen
