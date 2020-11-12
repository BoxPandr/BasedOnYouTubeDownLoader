#!/usr/bin/python3
from tqdm import tqdm

import requests


# url = 'https://www.facebook.com/favicon.ico'


url = 'https://static.realm.io/downloads/swift/realm-swift-10.1.1.zip'
# r = requests.get(url, allow_redirects=True)


# open('/Users/jzd/Music/yo/test_deng/facebook.ico', 'wb').write(r.content)



# Streaming, so we can iterate over the response.
response = requests.get(url, stream=True)
total_size_in_bytes = int(response.headers.get('content-length', 0))
block_size = 1024 #1 Kibibyte
progress_bar = tqdm(total=total_size_in_bytes, unit='iB', unit_scale=True)


path = '/Users/jzd/Desktop/Papr-develop/realm-swift-10.1.1.zip'

print("总量:")

print(total_size_in_bytes)

with open(path, 'wb') as file:
    for data in response.iter_content(block_size):
        progress_bar.update(len(data))
        file.write(data)


progress_bar.close()


if total_size_in_bytes != 0 and progress_bar.n != total_size_in_bytes:
    print("ERROR, something went wrong")