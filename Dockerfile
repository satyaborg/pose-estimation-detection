FROM python:3.6-stretch
MAINTAINER Tanmay Thakur <tanmaythakurbrn2rule@gmail.com>

# Install Build Utilities
RUN apt-get update && \
	apt-get install -y gcc make apt-transport-https ca-certificates build-essential

# Check Python Environment
RUN python --version
RUN pip --version

# set the working directory for containers
WORKDIR  /usr/src/pose

# Installing Dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy all the files from the project’s root to the working directory
COPY . .

# Running Python Application
CMD ["python", "run-webcam.py","--model=mobilenet_thin","--resize=432x368","--camera=0"]