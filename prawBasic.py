#! usr/bin/env python3
import praw
import pandas as pd
import datetime as dt

import chibConfig
from chibConfig import*

reddit = praw.Reddit(client_id = chibConfig.id,
                     client_secret = chibConfig.secret,
                     username = chibConfig.username,
                     password = chibConfig.password,
                     user_agent = 'RPi_Scraper')

subreddit = reddit.subreddit('askreddit')
hot_askreddit = subreddit.hot(limit = 6)

topics_dict = {'title':[], 
               'score':[], 
               'id':[], 'url':[],
               "comms_num":[], 
               'created':[], 
               'body':[] 
               }

def get_date(created):
    return dt.datetime.fromtimestamp(created)

max_posts = 2
for submission in hot_askreddit:
    if not submission.stickied:
        topics_dict['title'].append(submission.title)
        topics_dict['score'].append(submission.score)
        topics_dict['id'].append(submission.id)
        topics_dict['url'].append(submission.url)
        topics_dict['comms_num'].append(submission.num_comments)
        topics_dict['created'].append(submission.created)
        topics_dict['body'].append(submission.selftext)
                  
table_data = pd.DataFrame(topics_dict)

_timestamp = table_data['created'].apply(get_date)
table_data = table_data.assign(timestamp = _timestamp)

print(table_data)

table_data.to_csv('testChart.csv', index=False)
