FROM ubuntu

RUN apt update && DEBIAN_FRONTEND=non-interactive apt upgrade -y \
  && DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends \
    python3 python3-pip git \
  && pip3 install --no-cache-dir notebook rabbitpy \
  && useradd -d /notebooks -m jupyter \
  && rm -rf /var/lib/apt/lists/*

EXPOSE 8888
USER jupyter
WORKDIR /notebooks
VOLUME ["/notebooks"]
  
ENTRYPOINT ["jupyter-notebook", "--no-browser", "--ip", "0.0.0.0", "--NotebookApp.token="]
