FROM gitpod/workspace-full

# install Bun.js
RUN curl -fsSL https://bun.sh/install | bash
RUN echo 'export BUN_INSTALL="/home/gitpod/.bun"' >> /home/gitpod/.bashrc.d/600-bun | bash && \
    echo 'export PATH="$BUN_INSTALL/bin:$PATH"' >> /home/gitpod/.bashrc.d/600-bun | bash

# install ClickHouse
RUN sudo apt-key adv --keyserver keyserver.ubuntu.com --recv E0C56BD4 \
  && echo "deb http://repo.yandex.ru/clickhouse/deb/stable/ main/" | sudo tee /etc/apt/sources.list.d/clickhouse.list \
  && sudo apt-get update \
  && sudo DEBIAN_FRONTEND=noninteractive apt-get install -y clickhouse-server clickhouse-client \
  && sudo rm -rf /var/lib/apt/lists/*
