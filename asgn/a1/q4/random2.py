import random
import string

def generate_random_file():
    # Define the characters that can be used
    characters = string.ascii_letters + string.digits + string.punctuation

    # Generate a string of 100 random characters
    random_string = ''.join(random.choice(characters) for _ in range(0))

    # Define the filename
    filename = 'input.txt'

    # Write the random string to a file
    with open(filename, 'w') as f:
        f.write(random_string)

    # Return the filename
    return filename

# Call the function and print the returned filename
print(generate_random_file())