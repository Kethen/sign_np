FROM fedora:43
RUN dnf install -y gcc make zlib-ng-compat-devel zlib-ng-compat-static glibc-static
