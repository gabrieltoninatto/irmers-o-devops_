# Use uma imagem oficial do Python como imagem base
FROM python:3.13.4-alpine3.22

# Define o diretório de trabalho no container
WORKDIR /app

# Copia o arquivo de dependências para o diretório de trabalho
COPY requirements.txt .

# Instala as dependências
# --no-cache-dir: Desabilita o cache, o que pode reduzir o tamanho da imagem
# --upgrade pip: Garante que temos a versão mais recente do pip
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copia o resto do código da aplicação para o diretório de trabalho
COPY . .

# Expõe a porta 8000 para o mundo fora deste container
EXPOSE 8000

# Define o comando para rodar a aplicação
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]