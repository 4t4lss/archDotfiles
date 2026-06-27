import requests
from bs4 import BeautifulSoup

def fetchAndParseGrid(url: str):
    response = requests.get(url)
    #check if link is opened/valid
    if response.status_code != 200:
        print("Error: Could not fetch the document.")
        return
    #vars to store data into grid and to find max Y and X coord assuming 0 is smallest
    grid: dict[tuple[int,int],str] = {}
    maxX = 0
    maxY = 0
    #gathers html into soup
    soup = BeautifulSoup(response.text, 'html.parser')
    
    #finds all table rows
    rows = soup.find_all('tr')
    
    print("--- Testing Data Extraction ---")
    #store each row in a grid, xCoord, yCoord and its respective character
    for row in rows[1:]:
        #gets text inside each row
        cells = [cell.get_text().strip() for cell in row.find_all('td')]
        xCoord = int(cells[0])
        yCoord = int(cells[2])
        grid[(xCoord, yCoord)] = cells[1]
        if maxX < xCoord:
            maxX = xCoord
        if maxY < yCoord:
            maxY = yCoord

    while maxY >= 0:
        strBuff = ""
        for currX in range(0, maxX+1):
            strBuff += grid.get((currX, maxY), " ")
        print(strBuff)
        maxY = maxY-1

#doc url for decoding
#test doc
# doc_url = "https://docs.google.com/document/d/e/2PACX-1vTMOmshQe8YvaRXi6gEPKKlsC6UpFJSMAk4mQjLm_u1gmHdVVTaeh7nBNFBRlui0sTZ-snGwZM4DBCT/pub"
doc_url = "https://docs.google.com/document/d/e/2PACX-1vSvM5gDlNvt7npYHhp_XfsJvuntUhq184By5xO_pA4b_gCWeXb6dM6ZxwN8rE6S4ghUsCj2VKR21oEP/pub"

fetchAndParseGrid(doc_url)

