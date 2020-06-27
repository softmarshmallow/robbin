import scrapy
import json

LEXICO_BASE_URL = "https://www.lexico.com/definition/{}"


def get_target_words():
    with open("crawled/word-smart.json", 'r') as f:
        loaded = json.load(f)
        return [w["token"] for w in loaded]


class WordListSpider(scrapy.Spider):
    name = "lexico_definition"
    words = get_target_words()
    i = -1

    def start_requests(self):
        urls = [LEXICO_BASE_URL.format(word) for word in self.words]
        print(urls)
        for url in urls:
            yield scrapy.Request(url=url, callback=self.parse)

    def parse(self, response):
        examples = []
        item_xpath = """//*[@id="content"]/div[1]/div[2]//div[@class="examples"]//li/em/text()"""
        items = response.xpath(item_xpath)
        for i in items:
            example = i.get()
            examples.append(example)
        print(examples)
        self.i += 1
        yield {
            "token": self.words[self.i],
            "examples": examples
        }


if __name__ == "__main__":
    words = get_target_words()
    print(words)
