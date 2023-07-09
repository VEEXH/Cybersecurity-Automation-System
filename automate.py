#!/usr/bin/env python3

import subprocess # Import the subprocess module for running external commands
import os # Import the os module for interacting with the operating system

class CybersecurityTask: # Define a class for cybersecurity tasks
    def __init__(self, name, command): # Define the constructor method with two parameters: name and command
        self.name = name # Assign the name parameter to the name attribute
        self.command = command # Assign the command parameter to the command attribute

    def run(self): # Define a method for running the task
        print(f"Running {self.name}...") # Print a message indicating the task is running
        subprocess.run(self.command, shell=True) # Run the command using subprocess.run function with shell=True argument

# Create instances of CybersecurityTask class for each task

nmap_task = CybersecurityTask("nmap scan", "nmap -sV -oN nmap_scan.txt scanme.nmap.org") # Create an instance for nmap scan task with name and command arguments
nikto_task = CybersecurityTask("nikto scan", "nikto -h http://scanme.nmap.org/ -o nikto_scan.txt") # Create an instance for nikto scan task with name and command arguments

# Run each task using the run method

nmap_task.run() # Run nmap scan task
nikto_task.run() # Run nikto scan task

# Print a message indicating the tasks are completed

print("All tasks completed.") 
