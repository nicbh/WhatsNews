import socket, time, json

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

s.connect(('127.0.0.1', 9011))

for data in [{'state': 'user'}, {'state': ''}, {'state': 'exit'}]:
    s.send(json.dumps(data, ensure_ascii=False).encode())
    time.sleep(1)
    print(s.recv(1024).decode())

s.send('exit'.encode())
time.sleep(5)
s.close()
