import threading, time, socket, json

encoding = 'utf-8'
BUFSIZE = 1024


# a read thread, read data from remote
class Reader(threading.Thread):
    def __init__(self, client, cltaddr):
        threading.Thread.__init__(self)
        self.client = client
        self.clientAddr = cltaddr

    def run(self):
        try:
            print('open:', self.clientAddr)
            while True:
                data = self.client.recv(BUFSIZE).decode('utf-8')
                if data is None:
                    break
                context = json.loads(data, encoding=encoding)
                if context['message'] == 'exit':
                    break
                else:
                    print(data)
                    self.client.send('receive'.encode())
            print("close:", self.clientAddr)
        except ConnectionResetError:
            print("fail:", self.clientAddr)
        self.client.close()

    def readline(self):
        rec = self.inputs.readline()
        if rec:
            string = bytes.decode(rec, encoding)
            if len(string) > 2:
                string = string[0:-2]
            else:
                string = ' '
        else:
            string = False
        return string

        # a listen thread, listen remote connect


# when a remote machine request to connect, it will create a read thread to handle
class Listener(threading.Thread):
    def __init__(self, port):
        threading.Thread.__init__(self)
        self.port = port
        self.sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        self.sock.bind(("0.0.0.0", port))
        self.sock.listen(0)

    def run(self):
        print("listener started")
        while True:
            client, cltaddr = self.sock.accept()
            Reader(client, cltaddr).start()
            cltaddr = cltaddr
            print("accept a connect")


lst = Listener(9011)  # create a listen thread
lst.start()  # then start
