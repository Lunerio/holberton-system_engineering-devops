#!/usr/bin/python3
""" This script dumps a dict into a JSON file
"""
import json
import requests
from sys import argv


if __name__ == '__main__':
    user_name = requests.get('https://jsonplaceholder.typicode.com/users/{}/'.
                             format(int(argv[1]))).json().get('username')

    user_tasks = requests.\
        get('https://jsonplaceholder.typicode.com/users/{}/todos'.
            format(int(argv[1]))).json()

    tasks_list = []

    for item in user_tasks:
        new_dict = {}
        new_dict["task"] = item.get('title')
        new_dict["completed"] = item.get('completed')
        new_dict["username"] = user_name
        tasks_list.append(new_dict)

    complete_dict = {argv[1]: tasks_list}

    with open('{}.json'.format(argv[1]), mode='w') as file:
        json.dump(complete_dict, file)
