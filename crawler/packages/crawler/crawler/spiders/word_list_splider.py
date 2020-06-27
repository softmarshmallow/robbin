import scrapy

VOCABULARY_COM_LISTS_WORDSMART = "https://www.vocabulary.com/lists/330127"


class WordListSpider(scrapy.Spider):
    name = "word_lists"

    def start_requests(self):
        urls = [VOCABULARY_COM_LISTS_WORDSMART]
        for url in urls:
            yield scrapy.Request(url=url, callback=self.parse)

    def parse(self, response):
        print("RES!!")
        print(response)
