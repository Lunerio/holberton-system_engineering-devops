#!/usr/bin/python3
""" This module has a function for API requests
"""
import requests


def number_of_subscribers(subreddit):
    """ This func return the amount of subscribers
    of a given subreddit, or 0 if the subreddit
    doesnt exist
    """
    request_stat = requests.get('https://reddit.com/r/' + subreddit)
    if request_stat.status_code == 404:
        return 0
    else:
        headers = {'User-Agent':
                   'Mozilla/5.0 (Windows NT 6.2; Win64; x64)'}
        request_subs = requests.get('https://reddit.com/r/' + subreddit +
                                    '/about.json', headers=headers)
        request_dict = request_subs.json()
        data = request_dict.get('data')
        subs = data.get('subscribers')
        return subs
