from setuptools import setup

setup(
    install_requires=[
        "sklearn",
        "pandas",
        "numpy",
        "nltk",
        "requests",
        "mkl-service",
        "torch==1.6.0",
    ],
    extras_require={
    },
)
