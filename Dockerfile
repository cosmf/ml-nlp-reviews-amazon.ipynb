# Folosim o imagine Python oficială ca bază
FROM python:3.9-slim

# Setăm directorul de lucru în container
WORKDIR /app

# Instalăm dependențele de sistem necesare
# libgomp1 este pentru suport OpenMP (necesar pentru lightgbm, xgboost etc.)
# --no-install-recommends reduce numărul de pachete inutile instalate
# rm -rf /var/lib/apt/lists/* curăță cache-ul apt pentru a reduce dimensiunea imaginii
RUN apt-get update && apt-get install -y --no-install-recommends \
    libgomp1 \
    && rm -rf /var/lib/apt/lists/*

# Copiem fișierul cu cerințe în container
COPY requirements.txt .

# Instalăm dependențele Python
# --no-cache-dir reduce dimensiunea imaginii finale
RUN pip install --no-cache-dir -r requirements.txt

# (Opțional) Descărcăm resursele NLTK în timpul construirii imaginii
RUN python -m nltk.downloader punkt stopwords wordnet omw-1.4 -q

# Expunem portul pe care va rula Jupyter Notebook în container
EXPOSE 8888

# Comanda care va fi rulată la pornirea containerului
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--allow-root", "--no-browser", "--NotebookApp.token=''", "--NotebookApp.password=''"]