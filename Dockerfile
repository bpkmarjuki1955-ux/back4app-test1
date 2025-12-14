FROM python:3.12-slim

WORKDIR /app

# install deps
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# copy source
COPY app.py test_app.py ./

# jalankan test saat build (kalau gagal, build gagal)
RUN pytest -q

EXPOSE 8080

# production server
CMD ["gunicorn", "-b", "0.0.0.0:8080", "app:app"]
