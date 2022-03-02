# syntax=docker/dockerfile:1
FROM continuumio/anaconda3

WORKDIR /src

COPY requirements.txt requirements.txt
# RUN pip3 install -r requirements.txt
RUN conda install --file requirements.txt -c conda-forge
RUN conda install jupyter -y --quiet
RUN mkdir -p /src/notebooks

COPY . .

EXPOSE 8888
EXPOSE 5000

CMD ["bash", "init.bash"]


# CMD ["jupyter", "notebook", "--notebook-dir=/src/notebooks", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]
# CMD [ "jupyter", "notebook", "--notebook-dir=/src/notebooks --ip='*' --port=8888 --no-browser --allow-root" ]

# ENTRYPOINT ["tail", "-f", "/dev/null"]

# CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]

# docker run -it -d -p 8888:8888 --name movies_container giorgos:latest
# docker rm -f $(docker ps -aq) && docker build -t movies . &&  docker run -it -d -p 8888:8888 --name movies_container movies:latest
# docker rm -f $(docker ps -aq); docker build -t movies . &&  docker run -it -p 8888:8888 -p 5000:5000 -v "$(pwd)":/src --name movies_container movies:latest