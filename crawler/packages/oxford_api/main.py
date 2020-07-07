import json
import requests

from packages.oxford_api.settings import APP_ID, APP_KEY

endpoint = "entries"
language_code = "en-us"


def fetch():
    word_id = "example"
    url = "https://od-api.oxforddictionaries.com/api/v2/" + endpoint + "/" + language_code + "/" + word_id.lower()
    r = requests.get(url, headers={"app_id": APP_ID, "app_key": APP_KEY})
    print("code {}\n".format(r.status_code))
    print("text \n" + r.text)
    print("json \n" + json.dumps(r.json()))


if __name__ == "__main__":
    fetch()
