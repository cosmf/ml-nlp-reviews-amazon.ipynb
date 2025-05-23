# Amazon Review Sentiment Analysis with Docker

This project provides a Dockerized environment for performing comprehensive sentiment analysis on Amazon customer reviews. It includes steps for data preprocessing, exploratory data analysis (EDA), training various machine learning models (e.g., Logistic Regression, RandomForest, GradientBoosting, XGBoost, LightGBM, CatBoost), and evaluating their performance to identify the most effective classifiers.

## Prerequisites

* Docker Desktop installed and running.

## Setup & Run


  **Build the Docker image:**
    Open a terminal in the project's root directory and run:
    ```bash
    docker build --no-cache -t aad_proiect_env .
    ```
  **Run the Docker container:**
    ```bash
    docker run -p 8888:8888 -v "${PWD}:/app" --name jupyter_aad aad_proiect_env
    ```
    *(Use `"%CD%"` instead of `"${PWD}"` if in Windows Command Prompt/PowerShell for the volume mount)*

  **Access Jupyter Notebook:**
    With Docker Desktop running and the container started, open your web browser and navigate to:
    `http://localhost:8888`

    You can then open and run the Jupyter Notebook (e.g., `notebook.ipynb`) from the interface.

---

