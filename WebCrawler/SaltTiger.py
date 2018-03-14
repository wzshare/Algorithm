import urllib.request
from bs4 import BeautifulSoup

def getBookURLInPage(url, f):
    content = urllib.request.urlopen(url).read()
    soup = BeautifulSoup(content, "html5lib")

    articles = soup.findAll('article')

    # print(url, file = f)

    for article in articles:

        # hearers = article.findAll('header')
        # title = hearers[0].findAll('a')
        # book_title = title[0].getText()
        # print(book_title, file = f)

        a_list = article.findAll('a', {'target' : '_blank'})
        if len(a_list) > 1:
            link_utl = a_list[-1]['href']
            print(link_utl, file = f)

    # print('', file = f)

    pagenavi = soup.find('div', {'class' : 'wp-pagenavi'})
    next_page = pagenavi.find('a', {'rel' : 'next'})
    if next_page is not None:
        url = next_page['href']
        getBookURLInPage(url, f)

if __name__ == '__main__':
    # url = 'https://salttiger.com/tag/ios/'
    url = 'https://salttiger.com/'
    f = open('slatTigerBooks.txt', 'a')
    print('>>>>>>>>>>>>>>> start  ', url, file = f)
    getBookURLInPage(url, f)
    print('<<<<<<<<<<<<<<< end', file = f)
    f.close()