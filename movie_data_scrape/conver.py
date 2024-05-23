import pandas as pd

star_to_number = {
    '★★★★★': 5,
    '★★★★': 4,
    '★★★': 3,
    '★★': 2,
    '★': 1,
    '½': 0.5,
    '★★★★½': 4.5,
    '★★★½': 3.5,
    '★★½': 2.5,
    '★½': 1.5,
    '½': 0.5
}


df = pd.read_csv('films_data.csv')

df['Rating'] = df['Rating'].map(star_to_number)

print(df['Rating'])

df.to_csv('modified_films_data.csv', index=False)
