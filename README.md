## Function
1. **Collect Domain Information**: Capture and analyze DNS response packets to extract domain names and IP addresses of websites accessed by users in the internal network.
2. **Process DNS Data**: Match the collected domain names with the existing database to classify websites into categories such as Social Media, Entertainment, News, Education, etc.
3. **Send Data to Server**: Transmit domain names and IP addresses to the server via API for logging and storage.
4. **Log and Store Data**: Save information about domain names and IP addresses into a database, while logging unknown domains into a separate file.
5. **Statistics and Display**: Generate access statistics based on categories and display the results on a dashboard interface.

## System Design
- system:
<img width="853" height="569" alt="image" src="https://github.com/user-attachments/assets/596410c4-cc24-4e97-a3db-10c4b68500d3" />

- db :
<img width="1107" height="697" alt="image" src="https://github.com/user-attachments/assets/921c625e-ec7d-4ca6-b73c-5e5ad061fa9a" />

## Setup
Run start DBMS (i use PostGreSQL).
Run dns_server: python3 run.py.
Run dns_agent: sudo ./dns_agent [interface] [address: app].
(implement based on Linux).
