import requests
from bs4 import BeautifulSoup
import pandas as pd

def getData(list_url):
    list_page = requests.get(list_url)
    list_soup = BeautifulSoup(list_page.text, "html.parser")

    film_h2_elements = list_soup.find_all("h2", class_="headline-2 prettify")

    film_links = []
    for h2 in film_h2_elements:
        a_tag = h2.find("a")
        if a_tag:
            film_links.append(a_tag['href'])
        else:
            print("No <a> tag found within an <h2> element.")

    base_url = "https://letterboxd.com"


    film_urls = [f"{base_url}{link}genres/" for link in film_links]

    print(f"Found {len(film_urls)} film URLs")


    films_data = []

    for url in film_urls:
        print(f"Processing URL: {url}")
        page = requests.get(url)
        soup = BeautifulSoup(page.text, "html.parser")
        item = {}
        try:
            title_tag = soup.find("h1", class_="headline-1")
            if title_tag:
                item['Title'] = title_tag.text.strip()
                print(f"Title: {item['Title']}")
            else:
                print("Title not found")
        except AttributeError as e:
            print("Error:", e)
            item['Title'] = None
            
        try:
            directors_div = soup.find("span", class_="directorlist")
            if directors_div:
                Directors_tags = directors_div.find("span", class_="prettify")
                item['Directors'] = Directors_tags.text.strip()
                print(f"Directors: {item['Directors']}")
            else:
                print("Directors not found")
        except AttributeError as e:
            print("Error:", e)
            item['Directors'] = None

        try:
            year_tag = soup.find("div", class_="releaseyear")
            if year_tag:
                item['Year'] = year_tag.text.strip()
                print(f"Year: {item['Year']}")
            else:
                print("Year not found")
        except AttributeError as e:
            print("Error:", e)
            item['Year'] = None

        try:
            rating_tag = soup.find("span", class_="rating")
            if rating_tag:
                item['Rating'] = rating_tag.text.strip()
                print(f"Rating: {item['Rating']}")
            else:
                print("Rating not found")
        except AttributeError as e:
            print("Error:", e)
            item['Rating'] = None

        try:
            genres_div = soup.find("div", id="tab-genres")
            if genres_div:
                genres_tags = genres_div.find("a", class_="text-slug")
                item['Genres'] = genres_tags.text.strip()
                print(f"Genres: {item['Genres']}")
            else:
                print("Genres not found")
        except AttributeError as e:
            print("Error:", e)
            item['Genres'] = None
    
        
        try:
            decription_tag = soup.find("div", class_ = "truncate")
            if decription_tag:
                item['Description'] = decription_tag.text.strip()
                print(f"Description: {item['Description']}\n")
            else:
                print("Description not found")
        except AttributeError as e:
            print("Error:", e)
            item['Description'] = None 
                
        
        films_data.append(item)
    df = pd.DataFrame(films_data)

url1 = "https://letterboxd.com/jack/list/official-top-250-films-with-the-most-fans/detail/"
url2 = "https://letterboxd.com/jack/list/official-top-250-films-with-the-most-fans/detail/page/2/"
url3 = "https://letterboxd.com/jack/list/official-top-250-films-with-the-most-fans/detail/page/3/"

getData(url1)
getData(url2)
getData(url3)

print(df)
df.to_csv('films_data.csv', index=False)
