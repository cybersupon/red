# README: SonarQube Deployment Script

## Overview

This script is a simple and effective way to deploy SonarQube using Docker. SonarQube is an open-source platform developed by SonarSource for continuous inspection of code quality. It performs automatic reviews with static analysis of code to detect bugs, code smells, and security vulnerabilities on 20+ programming languages.

This script is particularly useful for Red Team operations where you need to quickly spin up a SonarQube instance for code review, vulnerability assessment, or other security-related activities. 

## Usage

### Prerequisites

Before using this script, ensure that Docker is installed and running on your machine.

### Script Breakdown

1. **Stop and Remove Existing SonarQube Container:**
   The script begins by stopping and removing any existing SonarQube container to ensure that a fresh instance is deployed.

   ```sh
   docker stop sonarqube
   docker rm sonarqube
   ```

2. **Create Necessary Directories:**
   The script creates the necessary directories for SonarQube configuration, data, extensions, and bundled plugins. These directories are mounted as volumes in the Docker container to persist data across container restarts.

   ```sh
   mkdir -p ~/docker_volumes/sonarqube-conf
   mkdir -p ~/docker_volumes/sonarqube-data
   mkdir -p ~/docker_volumes/sonarqube-extensions
   mkdir -p ~/docker_volumes/sonarqube-bundled-plugins
   ```

3. **Pull the Latest SonarQube Image:**
   The latest SonarQube image is pulled from Docker Hub to ensure the instance is up-to-date.

   ```sh
   docker pull sonarqube
   ```

4. **Run SonarQube in a Docker Container:**
   The script runs SonarQube in a Docker container, mapping the necessary ports and mounting the previously created directories as volumes.

   ```sh
   docker run -d --rm --name sonarqube \
       -p 9000:9000 -p 9092:9092 \
       -v ~/docker_volumes/sonarqube-conf:/opt/sonarqube/conf \
       -v ~/docker_volumes/sonarqube-data:/opt/sonarqube/data \
       -v ~/docker_volumes/sonarqube-extensions:/opt/sonarqube/extensions \
       -v ~/docker_volumes/sonarqube-bundled-plugins:/opt/sonarqube/lib/bundled-plugins \
       sonarqube
   ```

5. **Optional: Configuration for Local Use**
   For local use, it is recommended to disable "Force Authentication" in SonarQube's settings or generate an authentication token to use with the `sonar-scanner` CLI.

   ```sh
   #FOR LOCAL ONLY - remember to disable "Force Authentication" OR Generate token and pass in sonar-scanner CLI
   ```

6. **Run a SonarQube Scan:**
   To run a scan on a specific project, navigate to the project directory and execute the `sonar-scanner` command:

   ```sh
   sonar-scanner -Dsonar.projectKey=<something> -Dsonar.sources=.
   ```

   To run a scan on all repositories in a parent directory, use the following command:

   ```sh
   for i in `ls`; do cd $i; sonar-scanner -Dsonar.projectKey=$i -Dsonar.sources=.;cd ..;done
   ```

7. **Access SonarQube:**
   After deploying SonarQube, the script waits for 15 seconds to allow the service to start, then opens the SonarQube dashboard in your default web browser.

   ```sh
   sleep 15
   open http://localhost:9000
   ```

## Important Notes

- **Port Configuration:** The script maps ports 9000 and 9092. Ensure these ports are not in use by other services on your machine.
- **Persistence:** Data is persisted in the `~/docker_volumes/` directory. If you want to clear SonarQube data, simply delete these directories.
- **Security:** For Red Team operations, ensure you are operating in a controlled environment and understand the security implications of disabling authentication or running scans on sensitive codebases.

## Conclusion

This script provides a quick and automated way to deploy and use SonarQube for security assessments and code quality reviews. It is designed for ease of use in Red Team engagements, but can be adapted for other use cases as well.
