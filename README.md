# Automated Network Pentesting Workflow with n8n + Nmap + Groq AI

A streamlined workflow to automate network vulnerability scanning using **Nmap**, analyze the output using **Groq LLM**, and deliver results to a simple web UI via **n8n**.

-- 

# Video Demonstration Drive Link : https://drive.google.com/drive/u/2/folders/1wwrT0Hwa9fYafuY-vXdnCSpKK95b9Qd-

---

## ⚙️ Tech Stack

- **n8n** – Workflow automation engine
- **Nmap** – Network vulnerability scanner
- **Groq AI** – LLM-based result summarization
- **HTML/JS** – Frontend interface

---

## Workflow Blueprint

1. **Webhook Trigger**  
   Accepts target IP from a frontend POST request

2. **Set Node**  
   Extracts `target_ip` from request body

3. **Execute Command**  
   Runs: `nmap -sV <target_ip>`

4. **Set Prompt**  
   Formats `chatInput` like:  
   `Analyze this Nmap scan:\n\n<scan-output>`

5. **Groq Chat Model**  
   LLM processes and summarizes scan

6. **Respond to Webhook**  
   Returns plain text back to the frontend
   

## Frontend Integration

- Simple HTML+JS UI
- Sends target IP to `http://localhost:5678/webhook/start` via `POST`
- Receives Groq output and displays it in a formatted result box

---

##  Example Result:

PORT STATE SERVICE VERSION
22/tcp open ssh OpenSSH 8.2
80/tcp open http Apache httpd 2.4.29


---

## Prerequisites

- Node.js + n8n (`npm install n8n -g`)
- `nmap` installed locally
- Groq API key configured in n8n credentials

---

##  Deployment

```bash
n8n start

