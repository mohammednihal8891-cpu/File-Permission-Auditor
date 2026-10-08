#!/bin/bash
echo "===================================="
echo "     FILE PERMISSION AUDITOR"
echo "===================================="
echo
echo "1. Scan Directory"
echo "2. View Report"
echo "3. Exit"
echo
read -p "Enter your choice: " choice

case $choice in

    1)
        read -p "Enter directory to scan: " DIR
        ;;

    2)
        if [ -f "report.txt" ]; then
            cat report.txt
        else
            echo "No report found!"
        fi
        exit 0
        ;;

    3)
        echo "Exiting..."
        exit 0
        ;;

    *)
        echo "Invalid choice!"
        exit 1
        ;;

esac
REPORT="report.txt"

HIGH=0
MEDIUM=0
SAFE=0
if [ -z "$DIR" ]; then
    echo "Usage: ./auditor.sh <directory>"
    exit 1
fi

if [ ! -d "$DIR" ]; then
    echo "Directory not found!"
    exit 1
fi

echo "FILE PERMISSION AUDIT REPORT" > "$REPORT"
echo "====================================" >> "$REPORT"
echo "Directory: $DIR" >> "$REPORT"
echo "Date: $(date)" >> "$REPORT"
echo "====================================" >> "$REPORT"
echo "" >> "$REPORT"

echo "Scanning: $DIR"
echo

while IFS= read -r file
do
    PERM=$(stat -c "%A" "$file")
    OWNER=$(stat -c "%U" "$file")
    GROUP=$(stat -c "%G" "$file") 
    NUMBER=$(stat -c "%a" "$file")
    BASENAME=$(basename "$file")

    if [ "$NUMBER" = "777" ]; then

        HIGH=$((HIGH + 1))

        echo "[HIGH RISK]" | tee -a "$REPORT"
        echo "File  : $file" | tee -a "$REPORT"
if [[ "$BASENAME" == .* ]]; then
    echo "Type  : Hidden File" | tee -a "$REPORT"
fi
        echo "Owner : $OWNER" | tee -a "$REPORT"
        echo "Group : $GROUP" | tee -a "$REPORT"
        echo "Perm  : $PERM" | tee -a "$REPORT"
        echo "Reason: File has 777 permissions" | tee -a "$REPORT"
        echo "" | tee -a "$REPORT"

    elif [ "${NUMBER:2:1}" != "0" ]; then

        MEDIUM=$((MEDIUM + 1))

        echo "[MEDIUM RISK]" | tee -a "$REPORT"
        echo "File  : $file" | tee -a "$REPORT"
if [[ "$BASENAME" == .* ]]; then
    echo "Type  : Hidden File" | tee -a "$REPORT"
fi
        echo "Owner : $OWNER" | tee -a "$REPORT"
        echo "Group : $GROUP" | tee -a "$REPORT"
        echo "Perm  : $PERM" | tee -a "$REPORT"
        echo "Reason: Other users have write permission" | tee -a "$REPORT"
        echo "" | tee -a "$REPORT"
            else
        SAFE=$((SAFE + 1))
    
    fi

done < <(find "$DIR" -type f)

echo "====================================" | tee -a "$REPORT"
echo "SCAN COMPLETED" | tee -a "$REPORT"
echo "High Risk Issues   : $HIGH" | tee -a "$REPORT"
echo "Medium Risk Issues : $MEDIUM" | tee -a "$REPORT"
echo "Safe Files         : $SAFE" | tee -a "$REPORT"
echo "Total Issues       : $((HIGH + MEDIUM))" | tee -a "$REPORT"
echo "Report saved as: $REPORT" | tee -a "$REPORT"
