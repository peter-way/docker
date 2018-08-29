FROM selenium/standalone-chrome
LABEL authors=李毅

#================================================
# 安装 python3 及 selenium 类库
#================================================
USER root
COPY sources.list /etc/apt/sources.list
RUN apt-get -qqy update \
  && apt-get -qqy --no-install-recommends install python python-pip \
  && pip install -qqqU selenium


#================================================
# 运行测试启动脚本
#================================================
USER seluser
COPY wrap_entry_point.sh /opt/bin/wrap_entry_point.sh
CMD ["/opt/bin/wrap_entry_point.sh"]
