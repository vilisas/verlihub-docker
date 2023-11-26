#
#
# Docker image for Verlihub (latest)
# Vlz, 2023
#
# "latest" at this moment is 1.4.0.x
#

FROM alpine:3.18

WORKDIR /opt
# these packages should be kept, util-linux-misc, tar is required to run scripts properly, but can be used without it
# if you don't need codepage conversions, icu-data-full package can be omited.
RUN apk add --no-cache mariadb-client libmaxminddb-libs pcre2 pcre icu icu-data-full gettext lua5.2 zlib bash mariadb-connector-c gettext-asprintf ncurses util-linux-misc tar

# packages required to build verlihub
# alpine switched to musl, execinfo isn't found by default and without it verlihub build fails.
# optional packages: perl-dev 
# ncurses is needed for vh script, otherwise tput is not found
# doing everything in one shot to keep final package smaller

RUN apk add --no-cache git gcc g++ make cmake mariadb-dev openssl-dev pcre-dev libmaxminddb-dev icu-dev gettext-dev lua5.2-dev zlib-dev \
 && git clone https://github.com/mikroskeem/libexecinfo.git libexecinfo && cd libexecinfo && make -j4 && make install PREFIX=/usr && rm -rf /opt/libexecinfo \
 && cd /opt \
 && git clone https://github.com/Verlihub/verlihub.git verlihub &&  mkdir verlihub/build && cd verlihub/build && cmake .. && make -j4 && make install/strip \
 && mkdir -p /etc/verlihub/plugins && mkdir /etc/verlihub/scripts && ln -s /usr/local/lib/libplug_pi.so /etc/verlihub/plugins/ && ln -s /usr/local/lib/liblua_pi.so /etc/verlihub/plugins/ \
 && apk del git gcc g++ make cmake mariadb-dev openssl-dev libmaxminddb-dev icu-dev lua5.2-dev zlib-dev pcre-dev \
 && rm -rf /opt/verlihub

WORKDIR /etc/verlihub
COPY entrypoint.sh /usr/local/bin/
RUN chmod a+x /usr/local/bin/entrypoint.sh
ENTRYPOINT /usr/local/bin/entrypoint.sh
