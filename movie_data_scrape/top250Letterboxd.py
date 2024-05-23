import requests
from bs4 import BeautifulSoup
import pandas as pd

def get_film_links(list_url):
    response = requests.get(list_url)
    if response.status_code != 200:
        print(f"Failed to retrieve {list_url}")
        return []
    
    soup = BeautifulSoup(response.text, "html.parser")
    film_h2_elements = soup.find_all("h2", class_="headline-2 prettify")
    
    film_links = []
    for h2 in film_h2_elements:
        a_tag = h2.find("a")
        if a_tag and 'href' in a_tag.attrs:
            film_links.append(a_tag['href'])
        else:
            print("No <a> tag found within an <h2> element.")
    
    base_url = "https://letterboxd.com"
    return [f"{base_url}{link}genres/" for link in film_links]

def extract_film_data(url):
    response = requests.get(url)
    if response.status_code != 200:
        print(f"Failed to retrieve {url}")
        return None
    
    soup = BeautifulSoup(response.text, "html.parser")
    item = {}

    try:
        title_tag = soup.find("span", class_="name js-widont prettify")
        item['Title'] = title_tag.text.strip() if title_tag else "Title not found"
        print(item['Title'] + "\t")
    except Exception as e:
        print(f"Error extracting title: {e}")
        item['Title'] = None

    try:
        directors_div = soup.find("span", class_="directorlist")
        item['Directors'] = ', '.join([a.text.strip() for a in directors_div.find_all("a")]) if directors_div else "Directors not found"
    except Exception as e:
        print(f"Error extracting directors: {e}")
        item['Directors'] = None

    try:
        year_tag = soup.find("div", class_="releaseyear")
        item['Year'] = year_tag.text.strip() if year_tag else "Year not found"
    except Exception as e:
        print(f"Error extracting year: {e}")
        item['Year'] = None

    try:
        rating_tag = soup.find("span", class_="rating")
        item['Rating'] = rating_tag.text.strip() if rating_tag else "Rating not found"
    except Exception as e:
        print(f"Error extracting rating: {e}")
        item['Rating'] = None

    try:
        genres_div = soup.find("div", id="tab-genres")
        genres_tag = genres_div.find("a", class_="text-slug")
        item['Genres'] = genres_tag.text.strip() if genres_div else "Genres not found"
    except Exception as e:
        print(f"Error extracting genres: {e}")
        item['Genres'] = None

    try:
        description_tag = soup.find("div", class_="truncate")
        item['Description'] = description_tag.text.strip() if description_tag else "Description not found"
    except Exception as e:
        print(f"Error extracting description: {e}")
        item['Description'] = None
    
    return item

def get_data(urls):
    all_links = []
    for url in urls:
        all_links.extend(get_film_links(url))

    films_data = []
    for url in all_links:
        print(f"Processing URL: {url}")
        data = extract_film_data(url)
        if data:
            films_data.append(data)

    df = pd.DataFrame(films_data)
    print(df)
    df.to_csv('films_data.csv', index=False)

urls = [
    "https://letterboxd.com/jack/list/official-top-250-films-with-the-most-fans/detail/",
    "https://letterboxd.com/jack/list/official-top-250-films-with-the-most-fans/detail/page/2/",
    "https://letterboxd.com/jack/list/official-top-250-films-with-the-most-fans/detail/page/3/"
]

get_data(urls)