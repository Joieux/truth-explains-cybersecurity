FROM python:3.12-slim
WORKDIR /app
RUN pip install --no-cache-dir flask
COPY app.py /app/app.py
ENV PORT=5001
EXPOSE 5001
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD python -c "import urllib.request; urllib.request.urlopen('http://localhost:5001/health')" || exit 1
CMD ["python", "/app/app.py"]
