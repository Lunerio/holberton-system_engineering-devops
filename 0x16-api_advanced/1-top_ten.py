#!/usr/bin/python3
""" This module has a function for API requests
"""
import requests


def top_ten(subreddit):
    """ This func return the title of the top ten
    posts, or print None if the subreddit
    doesnt exist
    """
    request_stat = requests.get('https://reddit.com/r/' + subreddit)
    if request_stat.status_code == 404:
        print(None)
    else:
        headers = {'User-Agent':
                   'Mozilla/5.0 (Windows NT 6.2; Win64; x64)'}
        request_subs = requests.get('https://reddit.com/r/' + subreddit +
                                    '/hot.json', headers=headers)
        request_dict = request_subs.json()
        elements = request_dict.get('data').get('children')
        for post in range(10):
            post_data = elements[post].get('data')
            print(post_data.get('title'))
