FROM centos:7
RUN yum -y install policycoreutils selinux-policy-devel rpm-build; yum clean all

CMD ["/build/make.sh"]
