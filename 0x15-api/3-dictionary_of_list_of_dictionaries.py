#!/usr/bin/python3
""" This script dump every tasks from every user to a JSON file
"""
import json
import requests


if __name__ == '__main__':
    users = requests.get('https://jsonplaceholder.typicode.com/users').json()

    with open('todo_all_employees.json', mode='w') as file:
        all_dict = {}
        for user in users:
            user_dict = {}
            tasks_list = []
            tasks = requests.\
                get('https://jsonplaceholder.typicode.com/user/{}/todos'.
                    format(user.get('id'))).json()
            for task in tasks:
                new_dict = {}
                new_dict["username"] = user.get('username')
                new_dict["task"] = task.get('title')
                new_dict["completed"] = task.get('completed')
                tasks_list.append(new_dict)
            all_dict[user.get('id')] = tasks_list
        json.dump(all_dict, file)
