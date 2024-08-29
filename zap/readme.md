# OWASP ZAP Docker Script for Red Team Operations

## Overview

This script is designed to streamline the use of OWASP ZAP (Zed Attack Proxy) via Docker, facilitating different types of security scans on web applications. OWASP ZAP is an open-source web application security scanner, highly effective for identifying vulnerabilities such as those related to cross-site scripting (XSS), SQL injection, and other common web security issues. This script offers a menu-driven interface to perform full scans, baseline scans, or start the ZAP GUI, making it a valuable tool in Red Team engagements.

## Prerequisites

- Docker must be installed and running on your machine.
- Familiarity with web security concepts and the OWASP ZAP tool is recommended.

## Script Functionality

Upon execution, the script presents a menu with the following options:

1. **Full Scan URL**  
   Performs a comprehensive security scan on the specified URL. This scan includes active and passive checks, making it suitable for in-depth vulnerability analysis.

   **Steps:**
   - Prompts for the URL to scan.
   - Pulls the latest ZAP Docker image.
   - Executes the full scan, saving the results in an HTML file named `zap-full-results-[domain].html` in the current directory.

   **Example Command:**
   ```sh
   docker run --rm -v $(pwd):/zap/wrk/:rw -t ghcr.io/zaproxy/zaproxy:weekly zap-full-scan.py -t http://example.com -g gen.conf -z "-Xmx10240m -config network.connection.timeoutInSecs=60" -r zap-full-results-example.com.html
   ```

2. **Baseline Scan URL**  
   Conducts a baseline scan on the specified URL, focusing primarily on passive checks. This is less intrusive than the full scan and can be used for a quick security assessment.

   **Steps:**
   - Prompts for the URL to scan.
   - Pulls the latest ZAP Docker image.
   - Runs the baseline scan, saving the results in an HTML file named `zap-base-results-[domain].html` in the current directory.

   **Example Command:**
   ```sh
   docker run --rm -v $(pwd):/zap/wrk/:rw -t ghcr.io/zaproxy/zaproxy:weekly zap-baseline.py -t http://example.com -g gen.conf -r zap-base-results-example.com.html
   ```

3. **Zap GUI**  
   Launches the ZAP GUI using Docker, allowing for manual exploration and testing of web applications. This is useful for performing custom tests or following up on automated scan results.

   **Steps:**
   - Pulls the latest ZAP Docker image.
   - Starts the ZAP GUI, accessible via `http://localhost:8080/zap`.
   - Opens the GUI in your default web browser.

   **Example Command:**
   ```sh
   docker run --rm -u zap -p 8080:8080 -p 8090:8090 -i ghcr.io/zaproxy/zaproxy:weekly zap-webswing.sh &
   ```

4. **Quit**  
   Exits the script.

## Usage Instructions

1. **Run the Script:**
   Execute the script in your terminal:
   ```sh
   ./your-script-name.sh
   ```

2. **Select an Option:**
   Choose from the menu options to perform a full scan, baseline scan, or start the ZAP GUI.

3. **Review Results:**
   The script generates HTML reports for the full and baseline scans, which you can review in any web browser.

## Important Notes

- **Resource Allocation:** The script configures ZAP with up to 10GB of memory for full scans. Adjust the `-Xmx10240m` parameter if your system has different memory constraints.
- **Network Timeouts:** The script sets a 60-second network connection timeout for full scans. Modify this if necessary, depending on your target's network characteristics.
- **Docker Image:** The script uses the latest weekly build of OWASP ZAP from the GitHub Container Registry (`ghcr.io/zaproxy/zaproxy:weekly`), ensuring access to the most up-to-date features and fixes.

## Conclusion

This script provides a powerful and flexible interface for using OWASP ZAP in Red Team engagements. Whether you need a quick baseline scan or a thorough vulnerability assessment, this tool simplifies the process, allowing you to focus on identifying and mitigating risks. Happy hunting, and stay vigilant!
