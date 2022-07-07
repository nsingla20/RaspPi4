import subprocess
#from playsound import playsound  
from num2words import num2words
# from io import BytesIO
from gtts import gTTS
# mp3_fp = BytesIO()
def myping(host):
    response = subprocess.run(["ping","-W 0.5","-c 1",host],stdout=subprocess.DEVNULL,stderr=subprocess.STDOUT)
    return not response.returncode

l1=[False for i in range(0,30)]

def execute():
    for ip in range(0, 30):
        ip_address = "192.168.1." + str(ip)
        if myping(ip_address)^l1[ip]:
            if l1[ip]:
                myobj = gTTS(text="Device disconnected from "+str(ip)+" segment", lang='en', slow=False)
                myobj.save("mssg.mp3")
                
            else:
                myobj = gTTS(text="Device connected to "+str(ip)+" segment", lang='en', slow=False)
                myobj.save("mssg.mp3")
            l1[ip]=not l1[ip]
            subprocess.run(["omxplayer","--no-keys","-o","local","mssg.mp3"])
while True:
    execute()
