import serial
import csv
import time

# Define the COM port and baud rate
com_port = "/dev/cu.usbmodem12301"  # replace with your device's name
baud_rate = 9600  # replace with the baud rate you're using

# Open the serial port
ser = serial.Serial(com_port, baud_rate)

# Open a CSV file to store the data
with open("3030.csv", mode="w", newline="") as file:
    writer = csv.writer(file)

    try:
        while True:
            if ser.in_waiting > 0:
                line = ser.readline().decode("utf-8").rstrip()
                # Assuming the data is comma-separated
                data = line.split(",")
                writer.writerow(data)
                print(f"Data written: {data}")

            # Optional: sleep for a short time (e.g., 1 second)
            # time.sleep(1)

    except KeyboardInterrupt:
        print("Stopped by User")

    finally:
        ser.close()
        print("Serial Port Closed")
