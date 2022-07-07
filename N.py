import RPi.GPIO as GPIO
import random
from time import sleep
GPIO.setwarnings(False)
GPIO.setmode(GPIO.BCM)
list=range(12,25)
def all_zero():
      for i in range(12,25):
          GPIO.setup(i, GPIO.OUT, initial=GPIO.LOW)
def disco(t,l):
    for i in range(0,l):
        for j in range(12,25):
            GPIO.output(j, GPIO.HIGH)
        sleep(t)
        for j in range(12,25):
            GPIO.output(j, GPIO.LOW)
        sleep(t)
def all_on(t,l):
    for i in range(12,25):
        GPIO.output(i, GPIO.HIGH)
        if(i-11>l):
            GPIO.output(i-l,GPIO.LOW)
        sleep(t)
    for i in range(25-l,25):
        GPIO.output(i,GPIO.LOW)
        sleep(t)
def pat1(t):
    for i in range(18,25):
        GPIO.output(i,GPIO.HIGH)
        GPIO.output(36-i,GPIO.HIGH)
        sleep(t)
        GPIO.output(i,GPIO.LOW)
        GPIO.output(36-i,GPIO.LOW)
    for i in range(24,17,-1):
        GPIO.output(i,GPIO.HIGH)
        GPIO.output(36-i,GPIO.HIGH)
        sleep(t)
        GPIO.output(i,GPIO.LOW)
        GPIO.output(36-i,GPIO.LOW)
all_zero()
for l in range(1,14):
    all_on(0.05,l)
for i in range(100,0,-1):
    pat1(i/1000)
disco(0.04,25)
for i in range(0,100):
    x=random.choice(list)
    GPIO.output(x,GPIO.HIGH)
    sleep(0.1)
    GPIO.output(x,GPIO.LOW)

