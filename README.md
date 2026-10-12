# Nginx log analyser

A shell script that reads an nginx combined access log and prints the top 5 IP addresses, request paths, response status codes, and user agents.

Project page: https://roadmap.sh/projects/nginx-log-analyser

## Run

Download the sample log from the project page and save it in this directory as `nginx-access.log`.

```bash
bash analyse.sh
```

The report is written to the terminal.

## Output

Each section is highest count first:

```text
Top 5 IP addresses with the most requests:
<ip> - <n> requests

Top 5 most requested paths:
<path> - <n> requests

Top 5 response status codes:
<code> - <n> requests

Top 5 user agents:
<agent> - <n> requests
```

The path includes the query string. The status is the code that follows the request, including lines whose request is not three tokens.

## Note

AI was used to analyse the problem, to build a learning roadmap and practice plan, to generate the tests, and as a rubber duck. All research and the resulting solution in `analyse.sh` was written by hand.
