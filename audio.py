import pyaudio
import audioop
import RPi.GPIO as GPIO
from time import sleep
GPIO.setwarnings(False)
GPIO.setmode(GPIO.BCM)


CHUNK = 1024
FORMAT = pyaudio.paInt16
CHANNELS = 1
RATE = 44100
dev_index = 2

p = pyaudio.PyAudio()

stream = p.open(format=FORMAT,
                channels=CHANNELS,
                rate=RATE,
                #input_device_index = dev_index,
                input=True,
                frames_per_buffer=CHUNK)
GPIO.setup(6, GPIO.OUT, initial=GPIO.LOW)
while True:
    data = stream.read(CHUNK)
    rms = audioop.rms(data, 2)    # here's where you calculate the volume
    if rms>300:
        GPIO.output(6, GPIO.HIGH)
    else:
        GPIO.output(6, GPIO.LOW)



