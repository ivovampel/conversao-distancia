# Utiliza a imagem base do python na versão 3.13.0
FROM python:3.13.0

# Define o diretório de trabalho dentro do contêiner como /app
WORKDIR /app

# Copia o arquivo requirements.txt do host para o diretório de trabalho no contêiner
COPY requirements.txt .

# Instala as dependências listadas em requirements.txt usando pip
RUN pip install -r requirements.txt

# Copia todo o conteúdo do diretório atual do host para o diretório de trabalho no contêiner
COPY . /app

# Expõe a porta 5000 para permitir o acesso externo ao contêiner
EXPOSE 5000

# Define o comando padrão para iniciar o Gunicorn com a aplicação, escutando na porta 5000
CMD [ "gunicorn","--bind", "0.0.0.0:5000", "app:app" ]
