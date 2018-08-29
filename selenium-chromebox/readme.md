# 用法
1. 准备 python 测试文件，保存成 "main.py"。
   内容示例
```
# -*- coding: utf-8 -*-
from selenium import webdriver
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities

driver = webdriver.Remote(
   command_executor='http://127.0.0.1:4444/wd/hub',
   desired_capabilities=DesiredCapabilities.CHROME)

driver.get('http://baidu.com/')
print(driver.find_element_by_tag_name('body').get_attribute('innerHTML')[:100])
```

2. 由 Dockerfile 生成 image
  方法一：直接从 github 仓库拖
  ```
  docker build -t chromebox 'https://github.com/peter-way/docker.git#master:selenium-chromebox'
  ```

  方法二：克隆 github 仓库
  ```
  git clone https://github.com/peter-way/docker.git
  docker build -t chromebox docker/selenium-chromebox
  ```

3. 启动 container
  ```
  docker run -v <py测试文件目录>:/src -it chromebox
  ```
  注意：测试文件目录下必须有 main.py 文件。
