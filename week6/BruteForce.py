#!/usr/bin/python3

#Copyright 2021 Gary Hanley - Scripting Languages Week 6.6
#Created - 05/08/2021
#Brute Force Attack
#Input: Request Password to crack - to keep it quick use 3 digits beginning with 'a' or 'b'
#Then he script will crack it

import hashlib
import itertools
import string

#Set class for Colours
class bcolors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKCYAN = '\033[96m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'

#Ask for secret Password
password = input("Enter a 3 character alphanumeric secret password! : ")

#hash the password for security - store it in a database somewhere 
passwordhash = hashlib.sha256(password.encode("utf-8")).hexdigest()

#Fucntion Input hashed password - returns real password
def guess_password(real):
    chars = string.ascii_lowercase + string.digits

    attempts = 0

    for password_length in range(1, 9):

        for guess in itertools.product(chars, repeat=password_length):
            attempts += 1
            guess = ''.join(guess)

            #hash the guess
            guesshash = hashlib.sha256(guess.encode("utf-8")).hexdigest()

            print(f"Trying password | " + bcolors.WARNING + f"{guess} | " + bcolors.ENDC + f"{guesshash}")

            #if the hash is the same as the correct password's hash then we have cracked the password!
            if guesshash == real:            
                return bcolors.OKGREEN + 'Password has been cracked! It was {}. found in {} guesses.'.format(guess, attempts)
                break                

#Call function and enter password to hash
print(guess_password(passwordhash))

#credit to https://stackoverflow.com/questions/40269605/how-to-create-a-bruteforce-password-cracker-for-alphabetical-and-alphanumerical 