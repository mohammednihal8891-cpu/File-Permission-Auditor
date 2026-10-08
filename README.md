# 🔐 File Permission Auditor

A simple Linux-based cybersecurity tool that scans files and identifies insecure file permissions.

## 📌 Project Overview

File Permission Auditor is a Bash-based cybersecurity project designed to check file permissions in a selected directory.

It identifies files that may have risky permissions and classifies them based on their security risk.

## ⚙️ Features

- 🔍 Scan any directory
- 🔐 Check file permissions
- 👤 Display file owner and group
- ⚠️ Detect risky permissions
- 📁 Detect hidden files
- 📊 Classify issues as High Risk or Medium Risk
- 📝 Generate a security report
- 📄 View the generated report

## 🛠️ Technologies Used

- Linux
- Kali Linux
- Bash Shell Scripting
- Linux File Permissions
- find
- stat

## 📂 Project Structure

file-permission-auditor/
│
├── auditor.sh
├── report.txt
└── test/
    ├── normal.txt
    ├── dangerous.txt
    └── .secret

## 🚀 How to Run

Clone the repository:

git clone https://github.com/mohammednihal8891-cpu/file-permission-auditor.git

Go to the project directory:

cd file-permission-auditor

Give execute permission:

chmod +x auditor.sh

Run the program:

./auditor.sh

## 🖥️ How It Works

1. The program displays a menu.
2. Select Scan Directory.
3. Enter the directory path.
4. The script checks files and their permissions.
5. It identifies insecure permissions.
6. The issues are classified as High Risk or Medium Risk.
7. A report is saved as report.txt.
8. The report can be viewed using View Report.

## 🔎 Example

FILE PERMISSION AUDITOR

1. Scan Directory
2. View Report
3. Exit

Enter your choice: 1
Enter directory to scan: test

Example result:

[MEDIUM RISK]

File   : test/normal.txt
Owner  : kali
Group  : kali
Perm   : -rw-rw-r--

Reason : Other users have write permission

[HIGH RISK]

File   : test/.secret
Type   : Hidden File
Owner  : kali
Group  : kali
Perm   : -rwxrwxrwx

Reason : File has 777 permissions

## 🎯 Purpose

The main purpose of this project is to demonstrate how insecure Linux file permissions can be detected and reported using Bash scripting.

## 🎓 Learning Outcomes

Through this project, I learned:

- Linux file permissions
- Bash scripting
- File ownership
- Permission auditing
- Security risk identification
- Linux command-line tools
- Report generation

## 👨‍💻 Author

**Mohammed Nihal**

Cybersecurity Student

---

⭐ If you find this project useful, consider giving it a star!
