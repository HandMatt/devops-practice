# AWK extractions

rank() { 
    sort | uniq -c | sort -nr | head -n 5 | awk '{
        count = $1
        sub(/^[[:space:]]*[0-9]+ /, "")
        print $0 " - " count " requests"
    }'
}

# AWK extraction of IP addresses
awk -v msg="Top 5 IP addresses with the most requests:" 'BEGIN {print msg}' > nginx-access-output.log
awk '{ print $1 }' nginx-access.log | rank >> nginx-access-output.log

# AWK extraction of requested paths
awk -v msg="\nTop 5 most requested paths:" 'BEGIN {print msg}' >> nginx-access-output.log
awk -F'"' '{ print $2 }' nginx-access.log | awk '{ print $2 }' | rank >> nginx-access-output.log

# AWK extraction of status codes
awk -v msg="\nTop 5 response status codes:" 'BEGIN {print msg}' >> nginx-access-output.log
awk -F'"' '{ print $3 }' nginx-access.log | awk '{ print $1 }' | rank >> nginx-access-output.log

# AWK extraction of user agents
awk -v msg="\nTop 5 user agents:" 'BEGIN {print msg}' >> nginx-access-output.log
awk -F'"' '{ print $6 }' nginx-access.log | rank >> nginx-access-output.log
