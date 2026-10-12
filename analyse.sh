# AWK extractions

COUNTS=5

# Rank the values in the file by count
# awk command to remove the count from the output
# then print the value followed by the count
rank() { 
    sort | uniq -c | sort -nr | head -n $COUNTS | awk '{
        count = $1
        sub(/^[[:space:]]*[0-9]+ /, "")
        print $0 " - " count " requests"
    }'
}

# AWK extraction of IP addresses
echo -e "\nTop $COUNTS IP addresses with the most requests:"
awk '{ print $1 }' nginx-access.log | rank

# AWK extraction of requested paths
echo -e "\nTop $COUNTS most requested paths:"
awk -F'"' '{ print $2 }' nginx-access.log | awk '{ print $2 }' | rank

# AWK extraction of status codes
echo -e "\nTop $COUNTS response status codes:"
awk -F'"' '{ print $3 }' nginx-access.log | awk '{ print $1 }' | rank

# AWK extraction of user agents
echo -e "\nTop $COUNTS user agents:"
awk -F'"' '{ print $6 }' nginx-access.log | rank
