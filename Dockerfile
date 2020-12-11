FROM daocloud.io/library/ubuntu:20.04
MAINTAINER emund <emund1101@163.com>

ENV LANG C.UTF-8
ENV TZ Asia/Shanghai
WORKDIR /
ADD install_FineBI5_1-CN-expect.sh ./

RUN apt-get update \
 && apt-get install curl expect -y \
 && curl -O https://fine-build.oss-cn-shanghai.aliyuncs.com/finebi/5.1.3/stable/exe/spider/linux_unix_FineBI5_1-CN.sh \
 && /install_FineBI5_1-CN-expect.sh \
 && rm -rf /linux_unix_FineBI5_1-CN.sh \
 && rm -rf /install_FineBI5_1-CN-expect.sh

EXPOSE 37799
CMD sh -c "nohup /usr/local/FineBI5.1/bin/finebi"